import 'package:JuAI/common/routers/routes.dart';
import 'package:JuAI/common/theme.dart';
import 'package:JuAI/common/utils/date.dart';
import 'package:JuAI/common/widgets/bottommost.dart';
import 'package:JuAI/common/widgets/image_cache.dart';
import 'package:JuAI/common/widgets/load_data.dart';
import 'package:JuAI/components/reaction_button/flutter_reaction_button.dart';
import 'package:JuAI/components/reaction_button/src/ui/reaction_button.dart';
import 'package:JuAI/pages/bbs/widgets/card_index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class SpecialPage extends GetView<SpecialController> {
  SpecialPage({Key? key}) : super(key: key);
  final logic = Get.find<SpecialController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("圈子")),
      body: SafeArea(
        child: Column(
          children: [
            LoadDataWidget(
              logic.getSpecialDetail(),
              chindFunc: (val) => SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: ImageCacheWidget(
                        val.coverImage,
                        width: 80,
                      ),
                      title: Text(val.title),
                      subtitle: Text(val.summary, maxLines: 2, overflow: TextOverflow.ellipsis),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: Obx(
                        () => RichText(
                          text: TextSpan(
                            style: TextStyle(color: WcaoTheme.placeholder),
                            text: "创建于：" + dateFormatYMD(val.createTime),
                            children: [
                              const TextSpan(text: "        "),
                              const TextSpan(text: "成员："),
                              TextSpan(
                                text: logic.userCnt.value.toString(),
                                style: const TextStyle(color: Color.fromARGB(255, 3, 56, 231)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => logic.contents.isNotEmpty
                    ? ListView.builder(
                        itemCount: logic.contents.length,
                        itemBuilder: (context, index) {
                          return CardIndexWidget(logic.contents[index]);
                        },
                      )
                    : const BottommostWidget(false),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Obx(
        () => logic.isJoin.value
            ? ReactionButton<String>(
                onReactionChanged: (String? value) {
                  logic.toJoinOrPublish(route: value!);
                },
                reactions: [
                  Reaction<String>(
                    value: Routes.bbsPublishDongtai,
                    icon: TextButton.icon(onPressed: () {}, icon: const Icon(Icons.image_aspect_ratio_outlined), label: const Text("动态")),
                  ),
                  Reaction<String>(
                    value: Routes.bbsPublishArticle,
                    icon: TextButton.icon(onPressed: () {}, icon: const Icon(Icons.article_outlined), label: const Text("文章")),
                  ),
                  Reaction<String>(
                    value: Routes.bbsPublishSpecial,
                    icon: TextButton.icon(onPressed: () {}, icon: const Icon(Icons.folder_special_outlined), label: const Text("新圈子")),
                  ),
                ],
                initialReaction: Reaction<String>(
                  value: 'publish',
                  icon: FilledButton(onPressed: () {}, child: const Text("发布")),
                ),
                boxRadius: 10,
                boxDuration: const Duration(milliseconds: 500),
                itemScaleDuration: const Duration(milliseconds: 200),
              )
            : FilledButton.icon(
                onPressed: () => logic.toJoinOrPublish(),
                icon: const Icon(Icons.add, color: Colors.white),
                label: Text(
                  "加入",
                  style: TextStyle(fontSize: WcaoTheme.fsL, color: Colors.white),
                ),
              ),
      ),
    );
  }
}
