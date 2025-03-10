import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';

import '../../../base/base.dart';
import '../../../constants/enums/conversation_enum.dart';
import '../../../models/chat/chat_model.dart';
import '../../../models/chat/request/chat_req_dto.dart';
import '../../../models/chat/response/chat_res_dto.dart';
import '../../../repositories/chat_repository.dart';
import '../../../services/db/db_chat.dart';
import '../../../services/http/interceptor/api_exception.dart';
import '../../login/provider/login_provider.dart';
import '../../login/provider/user_provider.dart';
import 'chat_state_view_model.dart';
import 'conversation_state_view_model.dart';
import 'conversation_view_model.dart';

part 'chat_view_model.g.dart';

CancelToken _cancelToken = CancelToken();
TextEditingController inputController = TextEditingController();

@riverpod
class ChatVm extends _$ChatVm {
  @override
  Future<PagePagingData<ChatModel>> build() {
    var cur = ref.read(conversationStateVmProvider);
    return fetch(cur.current!.id ?? 0, page: 1);
  }

  Future<PagePagingData<ChatModel>> fetch(int curConversationId, {required int page}) async {
    if (curConversationId > 0) {
      var data = await DbChat().getChatList(curConversationId, page);
      return PagePagingData(items: data, hasMore: data.length >= 20, page: page);
    }
    return PagePagingData(items: [], hasMore: false, page: page);
  }

  Future<void> addSendChat(int conversationId, int id, String msg, String model) async {
    var sendItem = ChatModel(
      id: id,
      conversationId: conversationId,
      sendMsg: msg,
      receiveMsg: '',
      sendId: ref.read(curentUserProvider).userId!,
      receiveId: ref.read(conversationStateVmProvider).aiModel!.id,
      model: model,
      msgType: MsgTypeEnum.text,
      type: ConversationEnum.chat,
      status: ChatResStatusEnum.chatting,
      createTime: DateTime.now(),
      lastTime: DateTime.now(),
    );
    await DbChat().insert(sendItem.toJson());
    state = state.whenData((value) => value.copyWith(items: [sendItem, ...value.items]));
  }

  Future<List<Map<String, String>>> getHisMessages(int maxContext) async {
    if (maxContext == 0)
      return [];
    else {
      var his = <ChatModel>[];
      if (maxContext == -1) {
        his = await DbChat().getSuccessChatList(ref.read(conversationStateVmProvider).current!.id!, 1, pageSize: 100);
      } else {
        var hisTemp = state.value!.items.where((msg) => msg.status == ChatResStatusEnum.success);
        if (hisTemp.length < maxContext)
          his = hisTemp.toList();
        else
          his = hisTemp.skip(state.value!.items.length - maxContext).toList();
      }
      var hisMessages = <Map<String, String>>[];
      for (var i = 0; i < his.length; i++) {
        var msg = his[i];
        hisMessages.add({'role': 'user', 'message': msg.sendMsg});
        hisMessages.add({'role': 'assistant', 'message': msg.receiveMsg});
      }
      return hisMessages;
    }
  }

  Future<void> updateReceiveMsg(ChatResDto chatReceive) async {
    var msg = chatReceive.text.isEmptyJu() ? (chatReceive.msg ?? '') : chatReceive.text!;
    await DbChat().updateById(chatReceive.chatDbId, {'receiveMsg': msg, 'status': chatReceive.status.name, 'reqNum': chatReceive.reqNum, 'resNum': chatReceive.resNum, 'lastTime': DateUtil.formatDateNow});
    state = state.whenData((value) => value.copyWith(items: value.items.map((e) => e.id == chatReceive.chatDbId ? e.copyWith(receiveMsg: msg, status: chatReceive.status, reqNum: chatReceive.reqNum, resNum: chatReceive.resNum) : e).toList()));
  }

  Future<void> updateReceiveComplete(int id) async {
    await DbChat().updateCompleteStatus(id);
    state = state.whenData((value) => value.copyWith(items: value.items.map((e) => e.id == id && e.status == ChatResStatusEnum.chatting ? e.copyWith(status: ChatResStatusEnum.error) : e).toList()));
  }

  void updateChat(ChatModel chat) async {
    await DbChat().updateById(chat.id!, chat.toJson());
    state = state.whenData((value) => value.copyWith(items: value.items.map((e) => e.id == chat.id ? chat : e).toList()));
  }

  void deleteChat(int id) async {
    await DbChat().removeById(id);
    state = state.whenData((value) => value.copyWith(items: value.items.where((element) => element.id != id).toList()));
  }

  Future<void> sendMsg(String sendMsg, {int? chatDbId}) async {
    if (sendMsg.isEmpty) {
      return;
    }
    var cur = ref.read(conversationStateVmProvider);
    if (chatDbId == null) {
      chatDbId = DateTime.now().millisecondsSinceEpoch;
      await addSendChat(cur.current!.id!, chatDbId, sendMsg, cur.current!.model);
    } else {
      await updateReceiveMsg(ChatResDto(conversationId: cur.current!.id!, chatDbId: chatDbId, status: ChatResStatusEnum.chatting));
    }
    // Future(() {
    //   PrimaryScrollController.of(context).jumpTo(0);
    // });
    try {
      inputController.clear();
      ref.read(chatStateVMProvider.notifier).setSending(true);
      _cancelToken = CancelToken();
      await ref.read(chatRepositoryProvider).chat(
        ChatReqDto(
          conversationId: cur.current!.id!,
          chatDbId: chatDbId,
          message: sendMsg,
          model: cur.current!.model,
          modelService: cur.aiModel!.service,
          maxContext: cur.current!.maxContext,
          hisChatList: await getHisMessages(cur.current!.maxContext),
        ),
        cancelToken: _cancelToken,
        receive: (receiveChat) {
          debugPrint('收到数据：${receiveChat.toJson()}');
          updateReceiveMsg(receiveChat);
        },
        error: (err) {
          ref.read(chatStateVMProvider.notifier).setSending(false);
          updateReceiveMsg(ChatResDto(conversationId: cur.current!.id!, chatDbId: chatDbId!, msg: '接收消息失败$err', status: ChatResStatusEnum.error));
          ('错误：$err').e();
          ''.toast();
        },
        complete: (res) {
          debugPrint('聊天结束$res');
          ref.read(chatStateVMProvider.notifier).setSending(false);
          updateReceiveComplete(chatDbId!);
        },
      );
    } catch (e) {
      ref.read(chatStateVMProvider.notifier).setSending(false);
      e.e();
      var err = e.toString();
      if (e is DioException) {
        err = (e).message ?? '接收消息失败';
      }
      await updateReceiveMsg(ChatResDto(conversationId: cur.current!.id!, chatDbId: chatDbId, msg: '请求出错$err', status: ChatResStatusEnum.error));
      await updateReceiveComplete(chatDbId);
      // S.current.error_.toast();
    }
  }

  //取消请求sendMsg
  void cancelSendMsg() {
    ref.read(chatStateVMProvider.notifier).setSending(false);
    _cancelToken.cancel();
  }
}
