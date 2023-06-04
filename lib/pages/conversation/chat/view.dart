import 'package:JuAI/pages/conversation/widgets/markdow_body.dart';
import 'package:JuAI/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:JuAI/entities/conversation.dart';
import 'package:JuAI/common/widgets/avatar.dart';
import 'package:JuAI/pages/conversation/chat/state.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import 'controller.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return const _ChatViewGetX();
  }
}

class _ChatViewGetX extends GetView<ChatController> {
  const _ChatViewGetX({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      init: ChatController(),
      id: "chat",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('好友名称'),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
              )
            ],
          ),
          bottomNavigationBar: BottomAppBar(
            height: GetPlatform.isMobile ? 80 : 160,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Expanded(
                  child: TextField(
                    // textInputAction: TextInputAction.newline,
                    controller: controller.state.messageController,
                    focusNode: controller.state.messageFocusNode,
                    keyboardType: TextInputType.text,
                    autofocus: true,
                    maxLength: 1000,
                    maxLines: 4,
                    decoration: const InputDecoration(
                      hintText: "发送消息...",
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 0,
                        horizontal: 8,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        gapPadding: 1.0,
                      ),
                    ),
                    onSubmitted: (val) {
                      controller.onSend();
                    },
                  ),
                ),
                Obx(
                  () => GFButton(
                    onPressed: controller.state.sendType.value == SendType.canSend ? () => controller.onSend() : null,
                    text: "发 送",
                    shape: GFButtonShape.pills,
                    color: controller.state.sendType.value == SendType.canSend ? GFColors.SUCCESS : GFColors.FOCUS,
                  ),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: CustomScrollView(
              reverse: true,
              controller: _.state.scrollContrller,
              slivers: [
                ValueListenableBuilder(
                  valueListenable: _.state.currentChat,
                  builder: (context, value, child) {
                    return SliverList(
                      // Use a delegate to build items as they're scrolled on screen.
                      delegate: SliverChildBuilderDelegate(
                        // The builder function returns a ListTile with a title that
                        // displays the index of the current item.
                        (context, index) {
                          if (_.state.currentChat.value.isNotEmpty) {
                            return msgItem(Conversation.fromJsonFromChatGPT(_.state.currentConversationId, _.state.chatId, _.state.currentChat.value), context);
                          }
                          return const SizedBox.shrink();
                        },
                        // Builds 1000 ListTiles
                        childCount: 1,
                      ),
                    );
                  },
                ),
                Obx(
                  () => SliverList(
                    // Use a delegate to build items as they're scrolled on screen.
                    delegate: SliverChildBuilderDelegate(
                      // The builder function returns a ListTile with a title that
                      // displays the index of the current item.
                      (context, index) => msgItem(_.state.chats.reversed.toList()[index], context),
                      childCount: _.state.chats.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Container msgItem(Conversation conversation, BuildContext context) {
    bool isOtherSide = conversation.sender == "机器人";
    List<Widget> _temp = [
      Flexible(
        fit: FlexFit.loose,
        child: Column(
          crossAxisAlignment: isOtherSide ? CrossAxisAlignment.start : CrossAxisAlignment.end,
          children: [
            SizedBox(
              child: Text(
                conversation.sendTime,
                style: TextStyle(fontSize: WcaoTheme.fsSm),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: isOtherSide ? Theme.of(context).cardColor : Colors.green,
                borderRadius: BorderRadius.circular(12),
              ),
              child: isOtherSide
                  ? ConversationWidgets().buildMarkdown(context, conversation.content)
                  : SelectionArea(
                      child: Text(
                        conversation.content,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: (isOtherSide) ? aiAvatar() : avatar(),
      ),
    ];
    _temp.insert(0, const SizedBox(width: 50));
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: isOtherSide ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: isOtherSide ? _temp.reversed.toList() : _temp,
      ),
    );
  }
}
