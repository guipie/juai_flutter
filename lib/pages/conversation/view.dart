import 'package:juai/common/store/chat.dart';
import 'package:juai/common/utils/utils.dart';
import 'package:juai/common/widgets/socket_connect.dart';
import 'package:flutter/material.dart';
import 'package:juai/entities/message/conversation.dart';
import 'package:juai/common/widgets/appbar.dart';
import 'package:juai/common/widgets/avatar.dart';
import 'package:juai/common/theme.dart';
import 'package:get/get.dart';
import 'controller.dart';

class ConversationPage extends GetView<ConversationController> {
  const ConversationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SocketConnectWidget(),
          conversationBar(context),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () => ChatStore.to.toChat(),
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.resolveWith(
                      (states) => TextStyle(fontSize: WcaoTheme.fsXl),
                    ),
                  ),
                  icon: const Icon(Icons.add_outlined),
                  label: const Text("新建对话"),
                ),
              ],
            ),
          ),
          // search(),
          Expanded(
            child: SingleChildScrollView(
              child: Obx(
                () => Column(
                  children: controller.state.conversations
                      .map(
                        (e) => InkWell(
                          child: listCard(e, context),
                          onTap: () => controller.toChat(e),
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container listCard(ConversationLast item, BuildContext context) {
    var rowWidget = Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Stack(
          children: [
            avatar(avatarUrl: item.lastSenderAvatar),
            if (item.unread > 0)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  alignment: Alignment.center,
                  width: 14,
                  height: 14,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    //设置四周圆角 角度
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    //设置四周边框
                    border: Border.all(width: 1, color: Colors.red),
                  ),
                  child: Text(
                    item.unread.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 9),
                  ),
                ),
              ),
          ],
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(left: 14, right: 20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      width: .1,
                      color: WcaoTheme.placeholder.withOpacity(.5),
                    ),
                  ),
                ),
                child: Wrap(
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    Text(
                      item.lastSender,
                      style: TextStyle(
                        fontSize: WcaoTheme.fsBase,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateTimeLine(DateTime.parse(item.lastSendTime)),
                      style: TextStyle(
                        fontSize: WcaoTheme.fsSm,
                        color: Theme.of(context).dividerColor,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text(
                  item.content,
                  style: TextStyle(fontSize: WcaoTheme.fsSm, color: Theme.of(context).colorScheme.secondary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        )
      ],
    );
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      margin: const EdgeInsets.only(top: 18),
      child: Dismissible(
        // Each Dismissible must contain a Key. Keys allow Flutter to
        // uniquely identify widgets.
        key: Key(item.conversationId.toString()),
        direction: DismissDirection.endToStart,
        // Provide a function that tells the app
        // what to do after an item has been swiped away.
        onDismissed: (direction) {
          // Remove the item from the data source.

          controller.toRemoveChat(item.conversationId);
        },
        // Show a red background as the item is swiped away.
        background: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          child: const Text("滑动顶部删除", style: TextStyle(color: Colors.white)),
        ),
        child: rowWidget,
      ),
    );
  }

  Container search() {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      height: 36,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: WcaoTheme.bgColor,
        ),
        child: TextField(
          enableSuggestions: false,
          autocorrect: false,
          style: TextStyle(fontSize: WcaoTheme.fsBase),
          decoration: const InputDecoration(
            hintText: "请输入搜索关键词",
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
