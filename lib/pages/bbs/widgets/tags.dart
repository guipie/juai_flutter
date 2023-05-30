import 'package:JuAI/common/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:JuAI/common/theme.dart';
import 'package:JuAI/common/widgets/tag.dart';
import 'package:get/get.dart';

class TagsWidget extends StatelessWidget {
  const TagsWidget(this.tags, {super.key});
  final String tags;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      alignment: Alignment.topLeft,
      child: Wrap(
          spacing: 12,
          runSpacing: 6,
          children: tags.split("##").map((e) {
            return TagWidget(
              "#" + e.replaceAll("#", "") + "#",
              onTab: () => Get.toNamed(Routes.bbsTag, arguments: e),
              borderRadius: BorderRadius.circular(24),
              fontSize: WcaoTheme.fsBase,
              padding: const EdgeInsets.symmetric(
                vertical: 2,
                horizontal: 8,
              ),
              color: WcaoTheme.primary,
            );
          }).toList()),
    );
  }
}
