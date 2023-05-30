import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JuAI/common/server.dart';
import 'package:JuAI/common/widgets/image_cache.dart';
import 'package:JuAI/entities/content/content.dart';
import 'package:JuAI/common/routers/routes.dart';
import 'package:JuAI/common/theme.dart';

class CardAriticleWidget extends StatelessWidget {
  const CardAriticleWidget(this.content, {super.key});
  final ContentResEntity content;
  @override
  Widget build(BuildContext context) {
    final RegExp regExp = RegExp(r'(http(s?):)([/|.|\w|\s|-])*\.(?:jpg|gif|png|jpeg)');
    final Iterable<Match> matches = regExp.allMatches(content.content);
    List<String> imageUrls = [];
    for (Match match in matches) {
      imageUrls.add(match.group(0) ?? "");
    }
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Row(
        children: [
          if (imageUrls.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(right: 15),
              width: 60,
              height: 60,
              child: ImageCacheWidget(imageUrls.first),
            ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.bbsDetail, arguments: content.id);
                  },
                  child: Text(
                    content.title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 5),
                Wrap(
                  spacing: 10,
                  children: [
                    Text(
                      "张飞",
                      style: TextStyle(fontWeight: FontWeight.w400, color: WcaoTheme.secondary),
                    ),
                    Text(
                      "${content.commentNum}评论",
                      style: TextStyle(fontWeight: FontWeight.w400, color: WcaoTheme.secondary),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
