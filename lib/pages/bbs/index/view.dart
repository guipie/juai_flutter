import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guxin_ai/common/server.dart';
import 'package:guxin_ai/common/store/content.dart';
import 'package:guxin_ai/common/theme.dart';
import 'package:guxin_ai/common/widgets/bottommost.dart';
import 'package:guxin_ai/pages/bbs/controller.dart';
import 'package:guxin_ai/pages/bbs/widgets/card_index.dart';

class BbsIndexPage extends StatelessWidget {
  BbsIndexPage({super.key});
  final logic = Get.find<BbsController>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future(() => ContentStore.to.getContents()),
      child: Obx(
        () => ListView(
          controller: logic.state.indexScrollController,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 12, bottom: 24),
              child: Column(
                children: [
                  // search(),
                  special(),
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

  Container special() {
    return Container(
      margin: const EdgeInsets.only(top: 14),
      height: 86,
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        scrollDirection: Axis.horizontal,
        children: ContentStore.to.specials
            .map(
              (item) => Container(
                margin: const EdgeInsets.only(right: 12),
                alignment: Alignment.bottomLeft,
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(Qiniu_External_domain + item.coverImage),
                  ),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      child: Text(
                        item.title,
                        softWrap: false,
                        style: const TextStyle(color: Colors.white),
                      ),
                      padding: const EdgeInsets.only(left: 4, right: 6),
                      decoration: BoxDecoration(
                        color: WcaoTheme.primary,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
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
            .map((e) => Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text(
                    '#${e['Name']}#',
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: WcaoTheme.fsL,
                    ),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
