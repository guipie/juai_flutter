import 'dart:convert';
import 'dart:math';

import 'package:juai/common/store/chat.dart';
import 'package:juai/common/theme.dart';
import 'package:juai/entities/message/chat_prompt.dart';
import 'package:flutter/material.dart';

const List<MaterialColor> primaries = <MaterialColor>[
  Colors.red, // 红色
  Colors.pink, // 粉红色
  Colors.purple, // 紫色
  Colors.deepPurple, // 深紫色
  Colors.indigo, // 靛蓝色
  Colors.blue, // 蓝色
  Colors.lightBlue, // 浅蓝色
  Colors.cyan, // 青色
  Colors.teal, // 蓝绿色
  Colors.green, // 绿色
  Colors.lightGreen, // 浅绿色
  Colors.lime, // 酸橙色
  Colors.yellow, // 黄色
  Colors.amber, // 琥珀色
  Colors.orange, // 橙色
  Colors.deepOrange, // 深橙色
  Colors.brown, // 棕色
  Colors.blueGrey, // 蓝灰色
];

class RolePage extends StatefulWidget {
  const RolePage({super.key});

  @override
  State<RolePage> createState() => _RolePageState();
}

class _RolePageState extends State<RolePage> {
  var txtController = TextEditingController();
  List<ChatPromptEntity> data = List.from(ChatStore.to.chatPrompts);
  @override
  void initState() {
    txtController.addListener(() {
      setState(() {
        debugPrint("txtControllertxtController${txtController.text}");
        data = ChatStore.to.chatPrompts.where((x) => x.title.contains(txtController.text.trim())).toList();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("角色")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 10),
            child: Wrap(runSpacing: 16, spacing: 15, children: [
              Container(
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: 36,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    color: WcaoTheme.bgColor,
                  ),
                  child: TextField(
                    controller: txtController,
                    enableSuggestions: false,
                    autocorrect: false,
                    style: TextStyle(fontSize: WcaoTheme.fsBase),
                    decoration: const InputDecoration(
                      hintText: "请输入搜索角色关键词",
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
              ),
              ...List.generate(
                data.length,
                (i) => FilledButton(
                  onPressed: () => ChatStore.to.toChat(chatPrompt: data[i]),
                  // icon: aiAvatar(e.avatar, radius: 18, onClick: () => ChatStore.to.toChat(chatPrompt: e)),
                  child: Text(data[i].title),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(primaries[Random().nextInt(primaries.length)])),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
