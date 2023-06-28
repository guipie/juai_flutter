import 'package:juai/common/utils/date.dart';
import 'package:juai/pages/bbs_chat/controller.dart';
import 'package:juai/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

// chatgpt问答社区
class BbsChatPage extends StatelessWidget {
  BbsChatPage({super.key});
  final logic = Get.find<BbsChatController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Obx(
            () => Wrap(
              alignment: WrapAlignment.start,
              children: logic.state.tabs
                  .map(
                    (e) => GFButton(
                      onPressed: () {
                        logic.state.currentTabIndex.value = logic.state.tabs.indexOf(e);
                      },
                      text: e,
                      color: logic.state.currentTabIndex.value == logic.state.tabs.indexOf(e) ? GFColors.WARNING : GFColors.FOCUS,
                      type: GFButtonType.transparent,
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
        Expanded(
          child: Obx(
            () => ListView.builder(
              controller: logic.state.jitScrollController,
              itemCount: logic.state.jitChatGpts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: GFAvatar(
                    backgroundColor: WcaoTheme.base,
                    child: Text(
                      DateTimeStrLine(logic.state.jitChatGpts[index]["date"]!),
                      style: TextStyle(fontSize: WcaoTheme.fsSm),
                    ),
                  ),
                  title: Text("你是谁啊，你在哪啊。。"),
                  subtitle: Text(logic.state.jitChatGpts[index]["title"]!),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
