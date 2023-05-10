import 'package:guxin_ai/pages/bbs/publish/controller.dart';
import 'package:flutter/material.dart';
import 'package:guxin_ai/pages/bbs/publish/widgets/article/article_edit.dart';
import 'package:guxin_ai/wcao/ui/theme.dart';
import 'package:get/get.dart';

import 'widgets/widgets.dart';

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
            onPressed: () {},
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
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '  文章标题',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 138, 136, 134),
                          ),
                          border: InputBorder.none,
                        ),
                        maxLines: 1,
                      ),
                    ),
                    Expanded(
                      child: ArticleEditPage(),
                    ),
                  ],
                ),
              ),
            ),
            // 添加话题
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.tag_outlined,
                      color: WcaoTheme.secondary,
                    ),
                  ),
                  ...logic.state.currentTags.map((e) => PublishWidgets().huatiWidget(e)).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
