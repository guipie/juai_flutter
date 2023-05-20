import 'package:flutter/material.dart';
import 'package:guxin_ai/common/theme.dart';
import 'package:guxin_ai/common/widgets/ui/tag.dart';

class TagsWidget extends StatelessWidget {
  const TagsWidget(this.tags, {super.key});
  final String tags;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 12),
      child: Wrap(
          spacing: 12,
          runSpacing: 6,
          children: tags.split("##").map((e) {
            return Tag(
              "#" + e.replaceAll("#", "") + "#",
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
