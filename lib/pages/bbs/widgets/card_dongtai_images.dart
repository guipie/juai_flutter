import 'package:flutter/material.dart';
import 'package:JuAI/entities/content/content.dart';
import 'package:JuAI/common/routers/routeFade.dart';
import 'package:JuAI/common/utils/utils.dart';
import 'package:JuAI/common/widgets/image_browser.dart';
import 'package:JuAI/common/widgets/image_cache.dart';

class CardDongtaiImagesWidget extends StatefulWidget {
  const CardDongtaiImagesWidget(this.content, {super.key});
  final ContentResEntity content;
  @override
  State<CardDongtaiImagesWidget> createState() => _CardDongtaiImagesWidgetState();
}

class _CardDongtaiImagesWidgetState extends State<CardDongtaiImagesWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Wrap(
        spacing: 10,
        runSpacing: 8,
        children: widget.content.files
            .map(
              (e) => InkWell(
                child: SizedBox(
                  width: 80,
                  height: 80,
                  child: ImageCacheWidget(QiniuUtil.getImageThumbnail(e)),
                ),
                onTap: () {
                  Navigator.of(context).push(
                    RouteFade(
                      page: GxImageBrowser(
                        imgDataArr: widget.content.files.map((e) => e.toString()).toList(),
                        index: widget.content.files.indexOf(e),
                      ),
                    ),
                  );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
