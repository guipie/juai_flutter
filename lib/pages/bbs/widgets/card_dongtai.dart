import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:guxin_ai/entities/content/content.dart';
import 'package:guxin_ai/common/routers/routeFade.dart';
import 'package:guxin_ai/common/routers/routes.dart';
import 'package:guxin_ai/common/widgets/image_browser.dart';
import 'package:guxin_ai/common/widgets/image_cache.dart';
import 'package:guxin_ai/common/theme.dart';
import 'package:guxin_ai/pages/bbs/widgets/card_dongtai_images.dart';
import 'package:guxin_ai/pages/bbs/widgets/tags.dart';
import 'package:guxin_ai/pages/bbs/widgets/tools.dart';

import 'card_dongtai_video.dart';

class CardDongtaiWidget extends StatelessWidget {
  const CardDongtaiWidget(this.content, {Key? key}) : super(key: key);
  final ContentResEntity content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // buildMedia(item.mediaType, item.media),
          InkWell(
            onTap: () => Get.toNamed(Routes.bbsDetail, arguments: content.id),
            child: Container(
              margin: const EdgeInsets.only(top: 12),
              child: Text(
                content.summary,
                style: TextStyle(
                  color: WcaoTheme.base,
                  fontSize: WcaoTheme.fsL,
                ),
              ),
            ),
          ),
          if (content.category == BaCategory.Image && content.files.isNotEmpty) CardDongtaiImagesWidget(content),
          if (content.category == BaCategory.Video && content.files.isNotEmpty) CardDongtaiVideoWidget(content.files.first),
          if (content.tags != null) TagsWidget(content.tags!),
          const ToolsWidget(),
        ],
      ),
    );
  }

  /// 显示多媒体
  Widget buildMedia(bool type, List<String> media) {
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
  }
}
