import 'package:juai/common/config.dart';
import 'package:juai/pages/bbs_chat/state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:signalr_netcore/signalr_client.dart';

class BbsChatController extends GetxController with GetSingleTickerProviderStateMixin {
  BbsChatController();
  final state = BbsChatState();

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    signalRInit();
    super.onInit();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    state.hubConnection.stop();
    super.dispose();
  }

  void signalRInit() {
    state.hubConnection = HubConnectionBuilder().withUrl(SERVER_SIGNALR_URL).build();
    state.hubConnection.onclose(({error}) {
      debugPrint("连接关闭：$error");
    });
    state.hubConnection.on("ReceiveChatGPT", (arguments) {
      debugPrint("接受到数据：$arguments");

      state.jitChatGpts.add({"title": arguments!.first!.toString(), "date": DateTime.now().toString()});
      state.jitScrollController.animateTo(
        state.jitScrollController.position.maxScrollExtent + 200,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
    state.hubConnection.onreconnecting(({error}) {
      debugPrint("重新连接：$error");
    });
    state.hubConnection.start();
    // state.hubConnection.start();
  }
}
