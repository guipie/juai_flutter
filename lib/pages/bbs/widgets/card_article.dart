import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guxin_ai/entities/content/content.dart';
import 'package:guxin_ai/common/routers/routes.dart';
import 'package:guxin_ai/common/theme.dart';

class CardAriticleWidget extends StatelessWidget {
  const CardAriticleWidget(this.content, {super.key});
  final ContentResEntity content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, top: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              Get.toNamed(Routes.bbsDetail, arguments: content.id);
            },
            child: Text(
              content.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 5),
          Wrap(
            spacing: 10,
            children: [
              Text(
                "张飞",
                style: TextStyle(fontWeight: FontWeight.w400, color: WcaoTheme.secondary),
              ),
              Text(
                "4评论",
                style: TextStyle(fontWeight: FontWeight.w400, color: WcaoTheme.secondary),
              ),
            ],
          )
        ],
      ),
    );
  }
}
