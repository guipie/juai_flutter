import 'dart:async';
import 'dart:convert';

import 'package:JuAI/common/apis/notice_api.dart';
import 'package:JuAI/common/assets.dart';
import 'package:JuAI/common/config.dart';
import 'package:JuAI/common/store/user.dart';
import 'package:JuAI/entities/message/chat_role.dart';
import 'package:flutter/material.dart';
import 'package:JuAI/entities/conversation.dart';
import 'package:JuAI/common/utils/db_sqlite.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:signalr_netcore/signalr_client.dart';

class ChatStore extends GetxController {
  static ChatStore get to => Get.find();
  var chatRoles = <ChatRoleEntity>[].obs;
  var lastConversions = List<ConversationLast>.empty(growable: true).obs;
  var connected = false;
// If you want only to log out the message for the higer level hub protocol:
  // final hubProtLogger = Logger("SignalR - hub");
// If youn want to also to log out transport messages:
  var hubConnection = HubConnectionBuilder()
      .withUrl(
    SERVER_SIGNALR_URL,
    options: HttpConnectionOptions(
      accessTokenFactory: () => Future.value(UserStore.to.tokenInfo!.token),
      logMessageContent: true,
    ),
  )
      .withAutomaticReconnect(
    retryDelays: [0, 1000, 2000, 5000, 10000],
  ).build();
  @override
  Future<void> onInit() async {
    super.onInit();
    lastConversions.value = await DbSqlite.instance.queryAll("chat_last").then((value) => value.map((e) => ConversationLast.fromJson(e)).toList());
    _signalRInit();
    _loadChatRole();
    debugPrint("初始化会话列表：${lastConversions.length}条");
  }

  void _loadChatRole() {
    rootBundle.loadString(Assets.roleJson).then((value) {
      List jsonList = json.decode(value);
      chatRoles.value = jsonList.map((m) => ChatRoleEntity.fromJson(m)).toList();
      debugPrint("加载成功${chatRoles.length}");
    }).catchError((err) {
      debugPrint("加载失败$err");
    });
  }

  void _signalRInit() {
    // Configer the logging
    // final defaultHeaders = MessageHeaders();
    // var token = HttpUtil().getAuthorizationHeader();
    // defaultHeaders.setHeaderValue("Authorization", token?["Authorization"]);
//     Logger.root.level = Level.ALL;
// // Writes the log messages to the console
//     Logger.root.onRecord.listen((LogRecord rec) {
//       debugPrint('${rec.level.name}: ${rec.time}: ${rec.message}');
//     });
//     final transportProtLogger = Logger("SignalR - transport");
    try {
      hubConnection.onclose(({error}) {
        debugPrint("连接关闭：$error");
        connected = false;
        _signalRTimeOut();
      });
      hubConnection.on("ReceiveChatGPT", (arguments) {
        debugPrint("接受到[ReceiveChatGPT]数据：$arguments");
      });
      hubConnection.on("ReceiveChat", (arguments) {
        debugPrint("接受到[ReceiveChat]数据：$arguments");
        getAllChat();
      });
      hubConnection.onreconnecting(({error}) {
        debugPrint("重新连接：$error");
      });
      hubConnection.onreconnected(({connectionId}) {
        debugPrint("重新连接结束：$connectionId");
      });
      // hubConnection.serverTimeoutInMilliseconds = 1000 * 10;
      // hubConnection.keepAliveIntervalInMilliseconds = 1000 * 10;
      hubConnection.start()!.onError((error, stackTrace) {
        connected = false;
        debugPrint("连接出错了$error，stackTrace：$stackTrace");
        _signalRTimeOut();
      });
    } catch (e) {
      connected = false;
      debugPrint("连接出错了$e");
    }
    // state.hubConnection.start();
  }

  void _signalRTimeOut() {
    Timer.periodic(const Duration(seconds: 10), (timer) {
      if (connected) timer.cancel();
      connected = true;
      hubConnection.start()!.onError((error, stackTrace) {
        connected = false;
        debugPrint("重试连接出错了$error，stackTrace：$stackTrace");
      });
    });
  }

  Future<void> getAllChat() async {
    NoticeApis.getAllChat().then((value) {
      debugPrint(value.toString());
      List.generate(value.length, (index) {
        var cChat = value[index];
        var existIndex = lastConversions.indexWhere((m) => m.conversationId == cChat.sendId);
        ConversationLast _lastChat;
        Conversation _chat = Conversation(conversationId: cChat.sendId, sendId: cChat.sendId, recevieId: UserStore.to.userId, sendTime: cChat.sendTime.toString(), receiveTime: DateTime.now().toString(), content: cChat.content);
        if (existIndex > -1) {
          lastConversions[existIndex].content = cChat.content;
          lastConversions[existIndex].lastSendTime = cChat.sendTime.toString();
          lastConversions[existIndex].unread++;
          _lastChat = lastConversions[existIndex];
        } else {
          _lastChat = ConversationLast(
            conversationId: cChat.sendId,
            lastSender: cChat.sendNick,
            lastSenderAvatar: cChat.sendAvatar ?? "",
            lastSendTime: cChat.sendTime.toString(),
            content: cChat.content,
          );
          lastConversions.add(_lastChat);
        }
        DbSqlite.instance.insertExist("chat_last", _lastChat.toJson(), "conversationId=?", [_lastChat.conversationId]);
        DbSqlite.instance.insert("chat", _chat.toJson());
      });
    });
    // var receiveChat = Conversation.fromJsonFromChatGPT(msg, chatOpenAiId, state.chatRoleEntity);
    // if (conversationId > 0 && receiveId == state.chatRoleEntity.id) {
    //   _toAddChatStore(receiveChat);
    //   _toBottom();
    // }
    // _toAddChatLastStore(receiveChat);
  }

  void setLastConversion() {}
}
