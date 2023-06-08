import 'package:JuAI/common/store/chat.dart';
import 'package:JuAI/common/store/user.dart';
import 'package:JuAI/entities/message/chat_role.dart';
import 'package:JuAI/pages/conversation/chat/widget/chat_tool.dart';
import 'package:JuAI/pages/conversation/widgets/markdow_body.dart';
import 'package:JuAI/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:JuAI/entities/message/conversation.dart';
import 'package:JuAI/common/widgets/avatar.dart';
import 'package:get/get.dart';

import 'controller.dart';

class ChatPage extends StatelessWidget {
  ChatPage({Key? key}) : super(key: key);
  final _ = Get.find<ChatController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_.lastChat!.lastSender),
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
                controller: ChatStore.to.scrollContrller,
                slivers: [
                  ValueListenableBuilder(
                    valueListenable: ChatStore.to.currentChat,
                    builder: (context, value, child) {
                      return SliverList(
                        // Use a delegate to build items as they're scrolled on screen.
                        delegate: SliverChildBuilderDelegate(
                          // The builder function returns a ListTile with a title that
                          // displays the index of the current item.
                          (context, index) {
                            if (ChatStore.to.currentChat.value.isNotEmpty) {
                              return Wrap(
                                alignment: WrapAlignment.center,
                                children: [
                                  msgItem(
                                    Conversation.fromJsonFromChatGPT(
                                      ChatStore.to.currentChat.value,
                                      null,
                                      _.lastChat!,
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
                        (context, index) => msgItem(ChatStore.to.chats[index], _, context),
                        childCount: ChatStore.to.chats.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            if (_.lastChat!.type != ChatRoleEnum.chat.name)
              Container(
                color: WcaoTheme.primaryFocus.withOpacity(0.6),
                child: Column(
                  children: [
                    ChatToolWidget(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Obx(
                            () => TextField(
                              // textInputAction: TextInputAction.newline,
                              controller: _.state.messageController,
                              focusNode: _.state.messageFocusNode,
                              keyboardType: TextInputType.multiline,
                              textInputAction: TextInputAction.done,
                              autofocus: false,
                              maxLength: 2000,
                              maxLines: GetPlatform.isMobile ? null : 4,
                              decoration: InputDecoration(
                                hintText: _.state.drawImage.value ? "请输入画图的具体描述" : "输入问题的具体描述",
                                counterText: "",
                                contentPadding: const EdgeInsets.only(left: 15, bottom: 10),
                                border: InputBorder.none,
                              ),
                              onSubmitted: (val) {
                                _.onSend();
                              },
                            ),
                          ),
                        ),
                        Obx(
                          () => TextButton(
                            onPressed: ChatStore.to.sendType.value == SendType.canSend ? () => _.onSend() : null,
                            child: Icon(
                              Icons.send_sharp,
                              size: 23,
                              color: ChatStore.to.sendType.value == SendType.canSend ? Colors.green : Colors.green[100],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Container msgItem(Conversation conversation, ChatController chatController, BuildContext context) {
    bool isOtherSide = conversation.sendId != UserStore.to.userId;
    var avatarUrl = isOtherSide ? chatController.lastChat!.lastSenderAvatar : UserStore.to.userInfo.value!.avatar;
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
              padding: isOtherSide ? const EdgeInsets.all(4) : const EdgeInsets.all(8),
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
        padding: const EdgeInsets.all(6),
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
