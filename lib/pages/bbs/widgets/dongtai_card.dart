import 'package:flutter/material.dart';
import 'package:guxin_ai/common/entities/content.dart';
import 'package:guxin_ai/common/routers/routeFade.dart';
import 'package:guxin_ai/common/widgets/image_browser.dart';
import 'package:guxin_ai/common/widgets/image_cache.dart';
import 'package:guxin_ai/common/theme.dart';
import 'package:guxin_ai/pages/bbs/widgets/tags.dart';
import 'package:guxin_ai/pages/bbs/widgets/tools.dart';

import 'video_paly.dart';

class DongtaiCardWidget extends StatelessWidget {
  const DongtaiCardWidget(this.content, {Key? key}) : super(key: key);
  final ContentResEntity content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: content.category == BaCategory.Video ? 5 : 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // buildMedia(item.mediaType, item.media),
          Container(
            margin: const EdgeInsets.only(top: 12),
            child: Text(
              content.summary,
              style: TextStyle(
                color: WcaoTheme.base,
                fontSize: WcaoTheme.fsL,
              ),
            ),
          ),
          if (content.category == BaCategory.Image && content.files.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Wrap(
                spacing: 10,
                runSpacing: 8,
                children: content.files
                    .map(
                      (e) => InkWell(
                        child: SizedBox(
                          width: 80,
                          height: 80,
                          child: ImageCacheWidget(e),
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            RouteFade(
                              page: GxImageBrowser(
                                imgDataArr: content.files.map((e) => e.toString()).toList(),
                                index: 0,
                              ),
                            ),
                          );
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
          if (content.category == BaCategory.Video && content.files.isNotEmpty) VideoPlayCardWidget(content.files.first),
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
