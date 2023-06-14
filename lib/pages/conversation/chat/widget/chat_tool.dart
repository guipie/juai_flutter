import 'package:JuAI/common/store/chat.dart';
import 'package:JuAI/common/store/store.dart';
import 'package:JuAI/common/theme.dart';
import 'package:JuAI/common/utils/loading.dart';
import 'package:JuAI/common/widgets/avatar.dart';
import 'package:JuAI/pages/conversation/chat/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'text_show_hide.dart';

class ChatToolWidget extends StatelessWidget {
  ChatToolWidget({super.key});
  final _ = Get.find<ChatController>();
  var contextType = UserStore.to.gptTokenSettings.value.contextType.obs;
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
                    var _prompt = ChatStore.to.chatPrompts[index];
                    return ListTile(
                      leading: avatar(avatarUrl: _prompt.avatar, radius: 18),
                      title: Text(_prompt.title),
                      subtitle: TextShowHide(
                        text: _prompt.prompts.first.prompt,
                        maxLines: 2,
                        additionMore: _prompt.prompts.map((e) => e.prompt).toList(),
                      ),
                      trailing: TextButton(
                          onPressed: () {
                            Get.back();
                            _.toAddPrompt(_prompt);
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
          child: contextType.value != 0
              ? const Icon(
                  Icons.display_settings_sharp,
                  color: Colors.green,
                )
              : const Icon(Icons.display_settings_outlined),
          onTap: () {
            showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
              builder: (context) {
                return Padding(
                  padding: const EdgeInsets.all(15),
                  child: Obx(
                    () => Wrap(
                      children: [
                        const Text(
                          "保持上下文设置",
                          style: TextStyle(color: Colors.red),
                        ),
                        ListTile(
                          title: const Text('不保持'),
                          subtitle: Text(
                            "只会消耗每次请求的token",
                            style: TextStyle(color: WcaoTheme.secondary),
                          ),
                          trailing: Transform.scale(
                            scale: .8,
                            child: CupertinoSwitch(
                              value: contextType.value == 0,
                              onChanged: (value) {
                                if (value) {
                                  contextType.value = 0;
                                  UserStore.to.setGetGptToken(contextType: contextType.value);
                                }
                              },
                            ),
                          ),
                        ),
                        ListTile(
                          title: const Text('全部保持'),
                          subtitle: Text(
                            "携带全部上下文，消耗token较多",
                            style: TextStyle(color: WcaoTheme.secondary),
                          ),
                          trailing: Transform.scale(
                            scale: .8,
                            child: CupertinoSwitch(
                              value: contextType.value == -1,
                              onChanged: (value) {
                                if (value) {
                                  contextType.value = -1;
                                  UserStore.to.setGetGptToken(contextType: contextType.value);
                                }
                              },
                            ),
                          ),
                        ),
                        ListTile(
                          title: UserStore.to.gptTokenSettings.value.contextType > 0 ? Text('自定义[${UserStore.to.gptTokenSettings.value.contextType}]') : const Text('自定义'),
                          subtitle: Text(
                            "当前上下文最近的会话数量(建议)",
                            style: TextStyle(color: WcaoTheme.secondary),
                          ),
                          trailing: Transform.scale(
                            scale: .8,
                            child: CupertinoSwitch(
                              value: contextType.value > 0,
                              onChanged: (value) {
                                if (value) {
                                  Loading.confirmTextFiled(
                                    "请输入自定义数量",
                                    inputText: "3",
                                    onConfirm: (inputText) {
                                      contextType.value = int.parse(inputText);
                                      UserStore.to.setGetGptToken(contextType: contextType.value);
                                    },
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
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
