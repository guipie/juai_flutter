import 'package:flutter/material.dart';
import 'package:JuAI/common/widgets/avatar.dart';
import 'package:JuAI/entities/content/content.dart';
import 'package:JuAI/common/utils/date.dart';
import 'package:JuAI/common/widgets/image_avatar_cache.dart';
import 'package:JuAI/common/widgets/image_cache.dart';
import 'package:JuAI/common/theme.dart';
import 'package:JuAI/pages/bbs/widgets/card_article.dart';
import 'package:JuAI/pages/bbs/widgets/card_dongtai.dart';

class CardIndexWidget extends StatelessWidget {
  const CardIndexWidget(this.content, {Key? key}) : super(key: key);
  final ContentResEntity content;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                avatar(avatarUrl: content.avatar, radius: 26),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          content.createNick ?? "用户",
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
            if (content.category == BaCategory.Text || content.category == BaCategory.Image || content.category == BaCategory.Video) CardDongtaiWidget(content),
            if (content.category == BaCategory.Article) CardAriticleWidget(content),
          ],
        ),
      ),
    );
  }
}
