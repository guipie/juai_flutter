import 'package:JuAI/common/routers/routes.dart';
import 'package:JuAI/pages/bbs/widgets/specials.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JuAI/common/config.dart';
import 'package:JuAI/common/store/content.dart';
import 'package:JuAI/common/theme.dart';
import 'package:JuAI/common/widgets/bottommost.dart';
import 'package:JuAI/pages/bbs/controller.dart';
import 'package:JuAI/pages/bbs/widgets/card_index.dart';

class BbsIndexPage extends StatelessWidget {
  BbsIndexPage({super.key});
  final logic = Get.find<BbsController>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future(() => ContentStore.to.getContents()),
      child: Obx(
        () => ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          controller: logic.state.indexScrollController,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 12, bottom: 24),
              child: Column(
                children: [
                  // search(),
                  SpecialsWidget(ContentStore.to.specials),
                  topTag(context),
                ],
              ),
            ),
            ...ContentStore.to.contents.map((e) => CardIndexWidget(e)).toList(),
            Obx(() => BottommostWidget(logic.state.indexDownloading.value)),
          ],
        ),
      ),
    );
  }

  Padding search() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: WcaoTheme.bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        height: 36,
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: WcaoTheme.placeholder,
            ),
            Container(
              margin: const EdgeInsets.only(left: 4),
              child: Text(
                "searchText",
                style: TextStyle(
                  color: WcaoTheme.secondary,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Container topTag(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Wrap(
        alignment: WrapAlignment.start,
        children: ContentStore.to.topTags
            .map(
              (e) => InkWell(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text(
                    '#${e['Name']}#',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: WcaoTheme.fsL,
                    ),
                  ),
                ),
                onTap: () => Get.toNamed(Routes.bbsTag, arguments: '#${e['Name']}#'),
              ),
            )
            .toList(),
      ),
    );
  }
}
