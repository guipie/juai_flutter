import 'package:juai/common/routers/routes.dart';
import 'package:juai/common/widgets/load_data_refresh.dart';
import 'package:juai/entities/content/content.dart';
import 'package:juai/pages/bbs/index/controller.dart';
import 'package:juai/pages/bbs/widgets/specials.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:juai/common/store/content.dart';
import 'package:juai/common/theme.dart';
import 'package:juai/pages/bbs/widgets/card_index.dart';

class BbsIndexPage extends StatelessWidget {
  const BbsIndexPage({super.key});
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return [
          SliverToBoxAdapter(
            child: SpecialsWidget(ContentStore.to.specials),
          ),
          SliverToBoxAdapter(
            child: topTag(context),
          ),
        ];
      },
      body: LoadDataRefresh.buildRefreshListWidget<ContentResEntity, BbsIndexController>(
        itemBuilder: (item, index) => CardIndexWidget(item),
        tag: "BbsIndex",
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
