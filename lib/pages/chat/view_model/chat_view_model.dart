import 'dart:convert';
import 'dart:math';

import 'package:dio/dio.dart';

import '../../../base/base.dart';
import '../../../constants/enums/conversation_enum.dart';
import '../../../models/chat/chat_item_model.dart';
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
  Future<PagePagingData<ChatItemModel>> build() {
    var cur = ref.read(conversationStateVmProvider);
    return fetch(cur.current!.id ?? 0, page: 1);
  }

  Future<PagePagingData<ChatItemModel>> fetch(int curConversationId, {required int page}) async {
    if (curConversationId > 0) {
      var data = await DbChat().getChatList(curConversationId, page);
      return PagePagingData(items: data, hasMore: data.length >= 20, page: page);
    }
    return PagePagingData(items: [], hasMore: false, page: page);
  }

  void addSendChat(int conversationId, int id, String msg) async {
    var sendItem = ChatItemModel(
      id: id,
      conversationId: conversationId,
      sendMsg: msg,
      receiveMsg: '',
      sendId: ref.read(curentUserProvider).userId!,
      receiveId: ref.read(conversationStateVmProvider).aiModel!.id,
      msgType: MsgTypeEnum.text,
      type: ConversationEnum.chat,
      status: ChatResStatusEnum.chatting,
      createTime: DateTime.now(),
      lastTime: DateTime.now(),
    );
    await DbChat().insert(sendItem.toJson());
    state = state.whenData((value) => value.copyWith(items: [sendItem, ...value.items]));
  }

  Future<void> updateReceiveMsg(int id, String receiveMsg, ChatResStatusEnum status) async {
    await DbChat().updateById(id, {'receiveMsg': receiveMsg, 'status': status.value});
    state = state.whenData((value) => value.copyWith(items: value.items.map((e) => e.id == id ? e.copyWith(receiveMsg: receiveMsg, status: status) : e).toList()));
  }

  void updateChat(ChatItemModel chat) async {
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
      addSendChat(cur.current!.id!, chatDbId, sendMsg);
    } else {
      await updateReceiveMsg(chatDbId, S.current.retry, ChatResStatusEnum.chatting);
    }
    // Future(() {
    //   PrimaryScrollController.of(context).jumpTo(0);
    // });
    try {
      inputController.clear();
      ref.read(chatStateVMProvider.notifier).setSending(true);
      _cancelToken = CancelToken();
      await ref.read(chatRepositoryProvider).chat(
        ChatReqDto(conversationId: cur.current!.id!, chatDbId: chatDbId, message: sendMsg, model: cur.current!.model),
        cancelToken: _cancelToken,
        receive: (data) {
          debugPrint('收到数据：$data');
          var receiveChat = ChatResDto.fromJson(jsonDecode(data));
          updateReceiveMsg(receiveChat.chatDbId, receiveChat.text!.isEmpty ? receiveChat.msg! : receiveChat.text!, receiveChat.status);
        },
        error: (err) {
          ref.read(chatStateVMProvider.notifier).setSending(false);
          updateReceiveMsg(chatDbId!, '接收消息失败$err', ChatResStatusEnum.error);
          ('错误：$err').e();
          ''.toast();
        },
        complete: (res) {
          debugPrint('聊天结束$res');
          ref.read(chatStateVMProvider.notifier).setSending(false);
        },
      );
    } catch (e) {
      ref.read(chatStateVMProvider.notifier).setSending(false);
      e.e();
      var err = e.toString();
      if (e is DioException) {
        err = (e).message ?? '接收消息失败';
      }
      await updateReceiveMsg(chatDbId, '请求出错$err', ChatResStatusEnum.error);
      // S.current.error_.toast();
    }
  }

  //取消请求sendMsg
  void cancelSendMsg() {
    ref.read(chatStateVMProvider.notifier).setSending(false);
    _cancelToken.cancel();
  }
}
