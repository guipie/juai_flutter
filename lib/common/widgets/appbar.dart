import 'package:flutter/material.dart';
import 'package:guxin_ai/pages/conversation/widgets/firends_dialog.dart';
import 'package:guxin_ai/pages/conversation/widgets/qr_scan.dart';
import 'package:guxin_ai/wcao/ui/theme.dart';

AppBar conversationBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: const Text('AI对话'),
    actions: [
      PopupMenuButton(
        padding: EdgeInsets.zero,
        icon: Icon(
          Icons.add,
          size: WcaoTheme.fsBase * 1.75,
        ),
        onSelected: (item) async {
          if (item == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const QrScan(),
              ),
            );
          } else if (item == 2) {
            showDialog(
              context: context,
              barrierDismissible: true,
              builder: (BuildContext context) => const FirendsDialog(),
            );
          }
        },
        itemBuilder: (BuildContext context) => [
          PopupMenuItem(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: [
                const Icon(Icons.crop_free),
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: const Text('扫一扫'),
                ),
              ],
            ),
            value: 1,
          ),
          PopupMenuItem(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.how_to_reg),
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: const Text('添加好友'),
                ),
              ],
            ),
            value: 2,
          ),
        ],
      )
    ],
  );
}
