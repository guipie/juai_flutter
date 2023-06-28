import 'package:juai/common/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:juai/common/widgets/avatar.dart';
import 'package:juai/entities/content/content.dart';
import 'package:juai/common/utils/date.dart';
import 'package:juai/common/theme.dart';
import 'package:juai/pages/bbs/widgets/card_article.dart';
import 'package:juai/pages/bbs/widgets/card_dongtai.dart';
import 'package:get/get.dart';

class CardIndexWidget extends StatelessWidget {
  const CardIndexWidget(this.content, {Key? key, this.isShowSpecial = true}) : super(key: key);
  final ContentResEntity content;
  final bool isShowSpecial;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.15,
      margin: const EdgeInsets.all(2),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (content.category != BaCategory.Article)
              GestureDetector(
                behavior: HitTestBehavior.deferToChild,
                onTap: () => Get.toNamed(Routes.settingsMineHome, arguments: content.createId),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    avatar(
                      avatarUrl: content.avatar,
                      radius: 24,
                      onClick: () => Get.toNamed(Routes.settingsMineHome, arguments: content.createId),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              content.createNick!,
                              style: TextStyle(
                                color: WcaoTheme.base,
                                fontWeight: FontWeight.bold,
                                fontSize: WcaoTheme.fsL,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 4),
                              child: Text(
                                dateFormat(content.createTime),
                                style: TextStyle(
                                  color: WcaoTheme.secondary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            if (content.category == BaCategory.Text || content.category == BaCategory.Image || content.category == BaCategory.Video) CardDongtaiWidget(content),
            if (content.category == BaCategory.Article) CardAriticleWidget(content),
            if ((content.specialId ?? 0) > 0 && isShowSpecial)
              Container(
                padding: EdgeInsets.zero,
                margin: EdgeInsets.zero,
                alignment: Alignment.centerRight,
                width: double.infinity,
                child: InkWell(
                  onTap: () => Get.toNamed(Routes.bbsSpecial, arguments: content.specialId),
                  child: Container(
                    child: Text(
                      content.specialName ?? "",
                      softWrap: false,
                      style: const TextStyle(color: Colors.white),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    decoration: BoxDecoration(
                      color: WcaoTheme.primary,
                      borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
