import 'package:JuAI/common/assets.dart';
import 'package:JuAI/common/utils/utils.dart';
import 'package:JuAI/common/widgets/image_cache.dart';
import 'package:flutter/material.dart';
import 'package:JuAI/entities/conversation.dart';
import 'package:JuAI/common/routers/routes.dart';
import 'package:JuAI/common/widgets/appbar.dart';
import 'package:JuAI/common/widgets/avatar.dart';
import 'package:JuAI/common/theme.dart';
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
          conversationBar(context),
          SizedBox(
            width: double.infinity,
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  onPressed: () {
                    Get.toNamed(Routes.currentChat);
                  },
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.resolveWith(
                      (states) => TextStyle(fontSize: WcaoTheme.fsXl),
                    ),
                  ),
                  icon: const Icon(Icons.add_outlined),
                  label: const Text("新建对话"),
                ),
                TextButton.icon(
                  onPressed: () {
                    controller.state.roleVisible.value = !controller.state.roleVisible.value;
                  },
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.resolveWith(
                      (states) => TextStyle(fontSize: WcaoTheme.fsXl),
                    ),
                  ),
                  icon: const Icon(Icons.settings_sharp),
                  label: Obx(() => controller.state.roleVisible.value ? const Text("会话") : const Text("角色")),
                ),
              ],
            ),
          ),
          // search(),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Obx(
                () => controller.state.roleVisible.value
                    ? AnimatedOpacity(
                        // If the widget is visible, animate to 0.0 (invisible).
                        // If the widget is hidden, animate to 1.0 (fully visible).
                        opacity: 1,
                        duration: const Duration(milliseconds: 800),
                        // The green box must be a child of the AnimatedOpacity widget.
                        child: Wrap(
                          runSpacing: 10,
                          runAlignment: WrapAlignment.center,
                          children: controller.state.chatRoles
                              .map(
                                (e) => TextButton.icon(
                                  onPressed: () {},
                                  icon: ImageCacheWidget(
                                    Assets.dataAvatarPrefix + e.avatar + ".png",
                                    cacheImageType: CacheImageType.asserts,
                                    width: 30,
                                  ),
                                  label: Text(e.name),
                                ),
                              )
                              .toList(),
                        ),
                      )
                    : Column(
                        children: controller.state.conversations
                            .map(
                              (e) => InkWell(
                                child: listCard(e, context),
                                onTap: () => Get.toNamed(Routes.currentChat, arguments: e.conversationId),
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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      margin: const EdgeInsets.only(top: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          aiAvatar(),
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
                        item.sender,
                        style: TextStyle(
                          fontSize: WcaoTheme.fsBase,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        DateTimeLine(DateTime.parse(item.sendTime)),
                        style: TextStyle(
                          fontSize: WcaoTheme.fsSm,
                          color: Theme.of(context).dividerColor,
                        ),
                      )
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
