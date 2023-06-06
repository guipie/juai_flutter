import 'package:JuAI/common/store/user.dart';
import 'package:JuAI/pages/conversation/widgets/markdow_body.dart';
import 'package:JuAI/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:JuAI/entities/conversation.dart';
import 'package:JuAI/common/widgets/avatar.dart';
import 'package:JuAI/pages/conversation/chat/state.dart';
import 'package:get/get.dart';

import 'controller.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      init: ChatController(),
      id: "chat",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(_.state.chatRoleEntity.name),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_horiz),
              )
            ],
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
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
                                  return Wrap(
                                    alignment: WrapAlignment.center,
                                    children: [
                                      msgItem(
                                        Conversation.fromJsonFromChatGPT(
                                          _.state.currentChat.value,
                                          _.chatOpenAiId,
                                          _.state.chatRoleEntity,
                                        ),
                                        _,
                                        context,
                                      ),
                                      OutlinedButton(
                                        onPressed: () => _.stopChat(),
                                        child: const Text("停止.."),
                                      ),
                                    ],
                                  );
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
                            (context, index) => msgItem(_.state.chats[index], _, context),
                            childCount: _.state.chats.length,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(
                      () => InkWell(
                        onTap: () => controller.state.drawImage.value = !controller.state.drawImage.value,
                        child: Container(
                          padding: const EdgeInsets.only(left: 12, right: 8, bottom: 13),
                          color: controller.state.drawImage.value ? Colors.green : Colors.transparent,
                          child: Text(
                            "画图",
                            style: TextStyle(
                              fontSize: 16,
                              color: controller.state.drawImage.value ? Colors.white : WcaoTheme.placeholder,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Obx(
                        () => TextField(
                          // textInputAction: TextInputAction.newline,
                          controller: controller.state.messageController,
                          focusNode: controller.state.messageFocusNode,
                          keyboardType: TextInputType.text,
                          autofocus: false,
                          maxLength: 2000,
                          maxLines: GetPlatform.isMobile ? 1 : 4,
                          decoration: InputDecoration(
                            hintText: controller.state.drawImage.value ? "请输入画图的具体描述" : "输入问题的具体描述",
                            counterText: "",
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 12,
                            ),
                          ),
                          onSubmitted: (val) {
                            controller.onSend();
                          },
                        ),
                      ),
                    ),
                    Obx(
                      () => TextButton(
                        onPressed: controller.state.sendType.value == SendType.canSend ? () => controller.onSend() : null,
                        child: Icon(
                          Icons.send_sharp,
                          size: 23,
                          color: controller.state.sendType.value == SendType.canSend ? Colors.green : Colors.green[100],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Container msgItem(Conversation conversation, ChatController chatController, BuildContext context) {
    bool isOtherSide = conversation.sendId != UserStore.to.userId;
    var avatarUrl = isOtherSide ? chatController.state.chatRoleEntity.avatar : UserStore.to.userInfo.value!.avatar;
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
              padding: isOtherSide ? const EdgeInsets.all(4) : const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: avatar(avatarUrl: avatarUrl),
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
