import 'package:flutter/material.dart';
import 'package:guxin_ai/entities/content/content.dart';
import 'package:guxin_ai/common/utils/date.dart';
import 'package:guxin_ai/common/widgets/image_avatar_cache.dart';
import 'package:guxin_ai/common/widgets/image_cache.dart';
import 'package:guxin_ai/common/theme.dart';
import 'package:guxin_ai/pages/bbs/widgets/card_article.dart';
import 'package:guxin_ai/pages/bbs/widgets/card_dongtai.dart';

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
                SizedBox(
                  width: 60,
                  height: 60,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(44),
                    child: ImageAvatarCacheWidget(content.avatar ?? ""),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          content.createNick ?? "AI",
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

  /// 显示多媒体
  Widget buildMedia(bool type, List<String> media) {
    if (media.isEmpty) {
      return Container();
    }

    if (type) {
      // 视频
      return Container(
        margin: const EdgeInsets.only(top: 8),
        width: 172,
        height: 280,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(media[0]),
          ),
        ),
        child: Icon(
          Icons.play_circle_fill,
          color: WcaoTheme.primary,
          size: WcaoTheme.fsBase * 4,
        ),
      );
    } else {
      return Container(
        margin: const EdgeInsets.only(top: 8),
        child: Wrap(
          spacing: 12,
          runSpacing: 12,
          children: media
              .map((e) => SizedBox(
                    width: 124,
                    height: 124,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: ImageCacheWidget(e),
                    ),
                  ))
              .toList(),
        ),
      );
    }
  }
}
