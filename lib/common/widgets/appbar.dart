import 'package:JuAI/pages/bbs/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JuAI/common/routers/routes.dart';
import 'package:JuAI/pages/conversation/widgets/firends_dialog.dart';
import 'package:JuAI/pages/conversation/widgets/qr_scan.dart';
import 'package:JuAI/common/theme.dart';

AppBar conversationBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: const Text('聚AI会话'),
    // actions: [
    //   PopupMenuButton(
    //     padding: EdgeInsets.zero,
    //     icon: Icon(
    //       Icons.add,
    //       size: WcaoTheme.fsBase * 1.75,
    //     ),
    //     onSelected: (item) async {
    //       if (item == 1) {
    //         // Navigator.push(
    //         //   context,
    //         //   MaterialPageRoute(
    //         //     builder: (_) => const QrScan(),
    //         //   ),
    //         // );
    //       } else if (item == 2) {
    //         showDialog(
    //           context: context,
    //           barrierDismissible: true,
    //           builder: (BuildContext context) => const FirendsDialog(),
    //         );
    //       }
    //     },
    //     itemBuilder: (BuildContext context) => [
    //       PopupMenuItem(
    //         padding: const EdgeInsets.only(left: 12),
    //         child: Row(
    //           children: [
    //             const Icon(Icons.crop_free),
    //             Container(
    //               margin: const EdgeInsets.only(left: 8),
    //               child: const Text('扫一扫'),
    //             ),
    //           ],
    //         ),
    //         value: 1,
    //       ),
    //       PopupMenuItem(
    //         padding: const EdgeInsets.only(left: 12),
    //         child: Row(
    //           mainAxisSize: MainAxisSize.min,
    //           children: [
    //             const Icon(Icons.how_to_reg),
    //             Container(
    //               margin: const EdgeInsets.only(left: 8),
    //               child: const Text('添加好友'),
    //             ),
    //           ],
    //         ),
    //         value: 2,
    //       ),
    //     ],
    //   )
    // ],
  );
}

AppBar bbsBar(BuildContext context, List<String> tabs) {
  final logic = Get.find<BbsController>();
  return AppBar(
    automaticallyImplyLeading: false,
    title: const Text("社区"),
    actions: [
      PopupMenuButton(
        child: const Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Icon(Icons.add_outlined),
            Text("发布"),
            SizedBox(width: 10),
          ],
        ),
        onSelected: (item) async {
          logic.toPublish(item);
        },
        itemBuilder: (BuildContext context) => [
          PopupMenuItem(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.image_aspect_ratio_outlined),
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: const Text('动态'),
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
                const Icon(Icons.article_outlined),
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: const Text('文章'),
                ),
              ],
            ),
            value: 2,
          ),
          PopupMenuItem(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.folder_special_outlined),
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  child: const Text('圈子'),
                ),
              ],
            ),
            value: 3,
          ),
        ],
      )
    ],
  );
}
