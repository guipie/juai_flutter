import 'package:juai/common/store/chat.dart';
import 'package:juai/common/store/store.dart';
import 'package:juai/common/theme.dart';
import 'package:juai/common/utils/loading.dart';
import 'package:juai/common/widgets/avatar.dart';
import 'package:juai/entities/message/chat_send_req.dart';
import 'package:juai/pages/conversation/chat/controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'text_show_hide.dart';

class ChatToolWidget extends StatelessWidget {
  ChatToolWidget({super.key});
  final _ = Get.find<ChatController>();
  final contextType = UserStore.to.gptTokenSettings.value.contextType.obs;
  final ValueNotifier _counter = ValueNotifier(1);
  @override
  Widget build(BuildContext context) {
    var size = ChatStore.to.gptImageSetting["ImageSize"].toString();
    int num = ChatStore.to.gptImageSetting["ImageNum"];
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        InkWell(
          onTap: () {
            if (!_.state.drawImage.value) {
              showModalBottomSheet(
                context: context,
                builder: (cnt) {
                  return ValueListenableBuilder(
                    valueListenable: _counter,
                    builder: (BuildContext context, dynamic value, Widget? child) {
                      return ListView(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  ChatStore.to.loadGptImageSetting(size: size, num: num);
                                  _.state.drawImage.value = !_.state.drawImage.value;
                                  Get.back();
                                },
                                child: Text(
                                  "确 定",
                                  style: TextStyle(color: WcaoTheme.primary),
                                ),
                              ),
                              const Spacer(),
                              TextButton(
                                onPressed: () => Get.back(),
                                child: Text(
                                  "取 消",
                                  style: TextStyle(color: WcaoTheme.placeholder),
                                ),
                              ),
                            ],
                          ),
                          ListTile(
                            title: const Text("生成图片像素"),
                            subtitle: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [GptImageSize.size256, GptImageSize.size512, GptImageSize.size1024]
                                  .map(
                                    (e) => RadioListTile(
                                      value: e,
                                      groupValue: size,
                                      title: Text(e.toString()),
                                      onChanged: (value) {
                                        debugPrint("valuevalue$value");
                                        size = value!;
                                        _counter.value++;
                                      },
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          ListTile(
                            title: const Text("生成图片个数"),
                            subtitle: ValueListenableBuilder(
                              valueListenable: _counter,
                              builder: (BuildContext context, dynamic value, Widget? child) {
                                return Wrap(
                                  children: [1, 2, 3, 4, 5, 6, 7, 8]
                                      .map(
                                        (e) => SizedBox(
                                          width: 90,
                                          child: RadioListTile(
                                            value: e,
                                            groupValue: num,
                                            title: Text(e.toString()),
                                            onChanged: (value) {
                                              debugPrint("valuevalue$value");
                                              num = value!;
                                              _counter.value++;
                                            },
                                          ),
                                        ),
                                      )
                                      .toList(),
                                );
                              },
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              );
            } else {
              _.state.drawImage.value = false;
            }
          },
          child: Obx(
            () => Container(
              padding: const EdgeInsets.all(6),
              color: _.state.drawImage.value ? Colors.green : Colors.transparent,
              child: Text(
                "画图",
                style: TextStyle(color: _.state.drawImage.value ? Colors.white : Colors.black54),
              ),
            ),
          ),
        ),
        const SizedBox(width: 5),
        InkWell(
          child: Container(
            padding: const EdgeInsets.all(6),
            color: Colors.transparent,
            child: const Text(
              "担任/",
              style: TextStyle(color: Colors.black54),
            ),
          ),
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
          child: Obx(
            () => Container(
              padding: const EdgeInsets.all(6),
              color: contextType.value != 0 ? Colors.green : Colors.transparent,
              child: Text(
                "上下文",
                style: TextStyle(color: contextType.value != 0 ? Colors.white : Colors.black54),
              ),
            ),
          ),
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
