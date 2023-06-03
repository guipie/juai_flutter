import 'package:JuAI/common/routers/routes.dart';
import 'package:flutter/material.dart';
import 'package:JuAI/common/widgets/avatar.dart';
import 'package:JuAI/entities/content/content.dart';
import 'package:JuAI/common/utils/date.dart';
import 'package:JuAI/common/widgets/image_avatar_cache.dart';
import 'package:JuAI/common/widgets/image_cache.dart';
import 'package:JuAI/common/theme.dart';
import 'package:JuAI/pages/bbs/widgets/card_article.dart';
import 'package:JuAI/pages/bbs/widgets/card_dongtai.dart';
import 'package:get/get.dart';

class CardIndexWidget extends StatelessWidget {
  const CardIndexWidget(this.content, {Key? key}) : super(key: key);
  final ContentResEntity content;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.15,
      margin: const EdgeInsets.all(2),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (content.category != BaCategory.Article)
              InkWell(
                onTap: () => Get.toNamed(Routes.settingsMineHome, arguments: content.createId),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    avatar(avatarUrl: content.avatar, radius: 24),
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
          ],
        ),
      ),
    );
  }
}
