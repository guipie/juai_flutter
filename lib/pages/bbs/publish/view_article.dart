import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:guxin_ai/common/widgets/ui/tag.dart';
import 'package:guxin_ai/pages/bbs/publish/controller.dart';
import 'package:flutter/material.dart';
import 'package:guxin_ai/pages/bbs/publish/state.dart';
import 'package:guxin_ai/pages/bbs/publish/widgets/article/article_edit.dart';
import 'package:guxin_ai/common/widgets/ui/theme.dart';
import 'package:get/get.dart';

class PublishArticlePage extends StatelessWidget {
  PublishArticlePage({super.key});
  final logic = Get.find<PublishController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('发布文章'),
        actions: [
          TextButton(
            onPressed: () => logic.saveContents(PublishType.article),
            child: const Text('发布'),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: TextField(
                        controller: logic.state.articleTitleController,
                        decoration: const InputDecoration(
                          hintText: '  文章标题',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 138, 136, 134),
                          ),
                          border: InputBorder.none,
                          counterText: "",
                        ),
                        maxLines: 1,
                        maxLength: 30,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const Expanded(
                      child: ArticleEditPage(),
                    ),
                  ],
                ),
              ),
            ),
            // 添加话题
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Wrap(
                alignment: WrapAlignment.start,
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 2,
                runSpacing: 2,
                children: [
                  IconButton(
                    onPressed: () => logic.toTag(),
                    icon: Icon(
                      Icons.tag_outlined,
                      color: WcaoTheme.secondary,
                    ),
                  ),
                  ...logic.state.currentTags
                      .map((e) => Tag(
                            e,
                            color: GFColors.WHITE,
                            backgroundColor: GFColors.SUCCESS,
                            close: true,
                            onClose: () => logic.tagClose(e),
                          ))
                      .toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
