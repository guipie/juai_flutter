import 'package:JuAI/common/assets.dart';
import 'package:JuAI/common/store/chat.dart';
import 'package:JuAI/common/theme.dart';
import 'package:JuAI/common/widgets/avatar.dart';
import 'package:JuAI/common/widgets/cell.dart';
import 'package:JuAI/pages/conversation/chat/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'text_show_hide.dart';

class ChatToolWidget extends StatelessWidget {
  ChatToolWidget({super.key});
  final _ = Get.find<ChatController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () => _.state.drawImage.value = !_.state.drawImage.value,
          child: Obx(
            () => Container(
              padding: const EdgeInsets.all(8),
              color: _.state.drawImage.value ? Colors.green : Colors.transparent,
              child: const Text("画图"),
            ),
          ),
        ),
        const SizedBox(width: 5),
        InkWell(
          child: const Icon(Icons.six_ft_apart_outlined),
          onTap: () {
            showModalBottomSheet(
              context: context,
              useSafeArea: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
              builder: (context) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    var _role = ChatStore.to.chatPrompts[index];
                    return ListTile(
                      leading: avatar(avatarUrl: _role.avatar, radius: 18),
                      title: Text(_role.title),
                      subtitle: TextShowHide(
                        text: _role.prompts.first.prompt,
                        maxLines: 2,
                        additionMore: _role.prompts.map((e) => e.prompt).toList(),
                      ),
                      trailing: TextButton(
                          onPressed: () {
                            Get.back();
                            ChatStore.to.toChat(chatPrompt: _role);
                          },
                          child: const Text("确定")),
                    );
                  },
                  itemCount: ChatStore.to.chatPrompts.length,
                );
              },
            );
          },
        ),
        const SizedBox(width: 10),
        InkWell(
          child: const Icon(Icons.display_settings_outlined),
          onTap: () {
            showModalBottomSheet(
              context: context,
              useSafeArea: true,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: Wrap(
                    children: [
                      const Text(
                        "保持上下文设置",
                        style: TextStyle(color: Colors.red),
                      ),
                      ListTile(
                        title: const Text('不保持'),
                        subtitle: Text(
                          "只会消耗当前会话的token",
                          style: TextStyle(color: WcaoTheme.secondary),
                        ),
                        trailing: Transform.scale(
                          scale: .8,
                          child: CupertinoSwitch(
                            value: false,
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                      ListTile(
                        title: const Text('全部保持'),
                        subtitle: Text(
                          "携带当前所有会话，消耗token较多",
                          style: TextStyle(color: WcaoTheme.secondary),
                        ),
                        trailing: Transform.scale(
                          scale: .8,
                          child: CupertinoSwitch(
                            value: false,
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                      ListTile(
                        title: const Text('自定义'),
                        subtitle: Text(
                          "携带当前最近会话数量的token",
                          style: TextStyle(color: WcaoTheme.secondary),
                        ),
                        trailing: Transform.scale(
                          scale: .8,
                          child: CupertinoSwitch(
                            value: false,
                            onChanged: (value) {},
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
        const SizedBox(width: 20),
      ],
    );
  }
}
