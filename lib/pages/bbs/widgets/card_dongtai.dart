import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:juai/entities/content/content.dart';
import 'package:juai/common/routers/routes.dart';
import 'package:juai/common/theme.dart';
import 'package:juai/pages/bbs/widgets/card_dongtai_images.dart';
import 'package:juai/pages/bbs/widgets/tags.dart';
import 'package:juai/pages/bbs/widgets/tools.dart';

import 'card_dongtai_video.dart';

class CardDongtaiWidget extends StatelessWidget {
  const CardDongtaiWidget(this.content, {Key? key}) : super(key: key);
  final ContentResEntity content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
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
                  fontSize: WcaoTheme.fsL,
                ),
              ),
            ),
          ),
          if (content.category == BaCategory.Image && content.files.isNotEmpty) CardDongtaiImagesWidget(content),
          if (content.category == BaCategory.Video && content.files.isNotEmpty) CardDongtaiVideoWidget(content.files.first),
          if (content.tags != null && content.tags!.length > 2) TagsWidget(content.tags!),
          ToolsWidget(content),
        ],
      ),
    );
  }
}
