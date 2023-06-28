import 'package:juai/common/widgets/bottommost.dart';
import 'package:juai/entities/content/content.dart';
import 'package:juai/pages/bbs/widgets/card_index.dart';
import 'package:flutter/material.dart';

class HudongListWidget extends StatelessWidget {
  const HudongListWidget(this.contents, this.isLoading, {super.key});
  final List<ContentResEntity> contents;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: contents.length + 1,
      itemBuilder: (context, index) {
        if (index == contents.length) {
          return BottommostWidget(
            isLoading,
            isNodata: contents.isEmpty,
          );
        }
        return CardIndexWidget(contents[index]);
      },
    );
  }
}
