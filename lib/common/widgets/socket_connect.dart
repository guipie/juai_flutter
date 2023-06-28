import 'package:juai/common/store/chat.dart';
import 'package:flutter/material.dart';

class SocketConnectWidget extends StatelessWidget {
  const SocketConnectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: ChatStore.to.connected,
      builder: (BuildContext context, bool value, Widget? child) {
        if (ChatStore.to.connected.value) {
          return const SizedBox.shrink();
        } else {
          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(10),
            child: const Text(
              "网络断开连接,正在重新...",
              style: TextStyle(color: Colors.red, fontSize: 18),
            ),
          );
        }
      },
    );
  }
}
