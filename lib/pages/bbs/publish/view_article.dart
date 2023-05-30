import 'package:getwidget/getwidget.dart';
import 'package:JuAI/common/widgets/tag.dart';
import 'package:JuAI/pages/bbs/publish/controller.dart';
import 'package:flutter/material.dart';
import 'package:JuAI/pages/bbs/publish/state.dart';
import 'package:JuAI/pages/bbs/publish/widgets/article/article_edit.dart';
import 'package:JuAI/common/theme.dart';
import 'package:get/get.dart';

class PublishArticlePage extends StatelessWidget {
  PublishArticlePage({super.key});
  final logic = Get.find<PublishController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(logic.state.specialName.isNotEmpty ? ("圈子:" + logic.state.specialName.value) : '发布文章'),
        actions: [
          GFButton(
            onPressed: () => logic.saveContents(PublishType.article),
            text: "发布",
            color: GFColors.WARNING,
            shape: GFButtonShape.pills,
            size: GFSize.SMALL,
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
                          hintText: '文章标题',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 138, 136, 134),
                          ),
                          border: InputBorder.none,
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
            Obx(
              () => Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 8,
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
                        .map((e) => TagWidget(
                              e,
                              color: GFColors.WHITE,
                              backgroundColor: GFColors.SUCCESS,
                              close: true,
                              onClose: () => logic.tagClose(e),
                            ))
                        .toList(),
                    GFButton(
                      padding: const EdgeInsets.only(right: 10),
                      onPressed: () {
                        logic.state.isPay.value = !logic.state.isPay.value;
                      },
                      icon: Obx(
                        () => Checkbox(
                            value: logic.state.isPay.value,
                            onChanged: (val) {
                              logic.state.isPay.value = !logic.state.isPay.value;
                            }),
                      ),
                      text: "是否付费",
                      type: GFButtonType.outline,
                    ),
                    logic.state.isPay.value
                        ? SizedBox(
                            width: 200,
                            child: TextField(
                              controller: logic.state.payController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(hintText: '请输入付费token数'),
                            ),
                          )
                        : const Text(""),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
