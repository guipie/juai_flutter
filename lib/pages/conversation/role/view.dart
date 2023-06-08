import 'package:JuAI/common/assets.dart';
import 'package:JuAI/common/routers/routes.dart';
import 'package:JuAI/common/store/chat.dart';
import 'package:JuAI/common/widgets/image_cache.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            children: ChatStore.to.chatRoles
                .map(
                  (e) => TextButton.icon(
                    onPressed: () => ChatStore.to.toChat(roleId: e.id),
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
        ),
      ),
    );
  }
}
