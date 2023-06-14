import 'package:JuAI/common/store/chat.dart';
import 'package:JuAI/common/widgets/avatar.dart';
import 'package:flutter/material.dart';

class RolePage extends StatelessWidget {
  const RolePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("角色")),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Wrap(
            runSpacing: 10,
            children: ChatStore.to.chatPrompts
                .map(
                  (e) => TextButton.icon(
                    onPressed: () => ChatStore.to.toChat(chatPrompt: e),
                    icon: aiAvatar(e.avatar, radius: 18, onClick: () => ChatStore.to.toChat(chatPrompt: e)),
                    label: Text(e.title),
                  ),
                )
                .toList(),
          ),
        ),
      ),
    );
  }
}
