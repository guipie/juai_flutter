import 'dart:io';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:JuAI/common/routers/routes.dart';
import 'package:JuAI/common/widgets/image_cache.dart';
import 'package:JuAI/common/widgets/tag.dart';
import 'package:JuAI/pages/bbs/publish/controller.dart';
import 'package:flutter/material.dart';
import 'package:JuAI/pages/bbs/publish/state.dart';
import 'package:JuAI/common/theme.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:video_player/video_player.dart';

class PublishDongtaiPage extends StatelessWidget {
  PublishDongtaiPage({super.key});
  final logic = Get.find<PublishController>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        // 触摸收起键盘
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: Obx(
            () => logic.state.isDrag.value
                ? GFButton(
                    onPressed: () {},
                    text: "拖动到此处删除",
                    color: GFColors.DANGER,
                    fullWidthButton: true,
                  )
                : Text(logic.state.specialName.isNotEmpty ? ("圈子:" + logic.state.specialName.value) : '发布动态'),
          ),
          actions: [
            GFButton(
              onPressed: () => logic.saveContents(PublishType.dongtai),
              text: "发布",
              color: GFColors.WARNING,
              shape: GFButtonShape.pills,
              size: GFSize.SMALL,
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: TextField(
                  autofocus: false,
                  focusNode: logic.state.dongtaiFocus,
                  controller: logic.state.dongtaiController,
                  decoration: const InputDecoration(
                    hintText: '优质内容，需要您的贡献',
                    border: InputBorder.none,
                  ),
                  maxLines: null,
                ),
              ),

              // 添加话题
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Obx(
                  () => Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    spacing: 2,
                    runSpacing: 2,
                    children: logic.state.currentTags
                        .map((e) => TagWidget(
                              e,
                              color: GFColors.WHITE,
                              backgroundColor: GFColors.SUCCESS,
                              close: true,
                              onClose: () => logic.tagClose(e),
                            ))
                        .toList(),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: .5, color: WcaoTheme.placeholder.withOpacity(.5)),
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () => logic.openImage(context),
                      icon: Icon(
                        Icons.image_outlined,
                        color: WcaoTheme.secondary,
                      ),
                    ),
                    IconButton(
                      onPressed: () => logic.openVideo(context),
                      icon: Icon(
                        Icons.videocam_outlined,
                        color: WcaoTheme.secondary,
                      ),
                    ),
                    IconButton(
                      onPressed: logic.toTag,
                      icon: Icon(
                        Icons.tag_outlined,
                        color: WcaoTheme.secondary,
                      ),
                    ),
                    GFButton(
                      onPressed: () {
                        Get.offNamed(Routes.bbsPublishArticle);
                      },
                      text: "写文章",
                      size: GFSize.LARGE,
                      type: GFButtonType.transparent,
                    ),
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: Icon(
                    //     Icons.location_on_outlined,
                    //     color: WcaoTheme.secondary,
                    //   ),
                    // ),
                  ],
                ),
              ),
              Obx(
                () => logic.state.dongtaiPics.isNotEmpty
                    ? SizedBox(
                        height: 200.h,
                        child: GridView.builder(
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, //每行三列
                              childAspectRatio: 1.0 //显示区域宽高相等
                              ),
                          itemCount: logic.state.dongtaiPics.length,
                          itemBuilder: (context, index) {
                            var _item = logic.state.dongtaiPics[index];
                            return _selectedImage(_item, index);
                          },
                        ),
                      )
                    : const SizedBox(),
              ),
              Obx(
                () => logic.state.dongtaiVideos.isNotEmpty ? _selectedVideo() : const SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  LongPressDraggable<int> _selectedImage(DongtaiFile file, int index) {
    return LongPressDraggable<int>(
      data: index,
      onDragStarted: () => logic.state.isDrag.value = true,
      onDragEnd: (details) {
        if (details.offset.dy < 100) logic.state.dongtaiPics.removeAt(index);
        logic.state.isDrag.value = false;
      },
      child: DragTarget<int>(
        onAccept: (fromIndex) {
          var fromItem = logic.state.dongtaiPics[fromIndex];
          logic.state.dongtaiPics.remove(fromItem);
          logic.state.dongtaiPics.insert(index, fromItem);
          logic.state.isDrag.value = false;
        },
        builder: (context, candidateData, rejectedData) {
          return Container(
            margin: const EdgeInsets.only(left: 4),
            height: 200,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: ImageCacheWidget(
                    file.path,
                    cacheImageType: CacheImageType.local,
                    width: 1.sw / 3,
                    height: 200,
                  ),
                ),
                if (file.percentage > 0)
                  Positioned(
                    bottom: 0,
                    height: 0.6,
                    child: GFProgressBar(
                      margin: EdgeInsets.zero,
                      progressBarColor: GFColors.SUCCESS,
                      percentage: file.percentage > 1 ? 1 : file.percentage,
                    ),
                  )
              ],
            ),
          );
        },
      ),
      feedback: Image.file(
        File(file.path),
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _selectedVideo() {
    DongtaiFile file = logic.state.dongtaiVideos[0];
    return InkWell(
      onTap: () {
        if (logic.state.videoController.value.isPlaying) {
          logic.state.videoController.pause();
        } else {
          logic.state.videoController.play();
        }
        logic.state.videoPlaying.value = logic.state.videoController.value.isPlaying;
      },
      child: Container(
        margin: const EdgeInsets.only(left: 4),
        height: 200,
        child: Stack(
          children: [
            Center(
              child: logic.state.videoController.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: logic.state.videoController.value.aspectRatio,
                      child: VideoPlayer(logic.state.videoController),
                    )
                  : Container(),
            ),
            Obx(
              () => logic.state.videoPlaying.value
                  ? Container()
                  : Positioned(
                      top: 100,
                      left: 1.sw / 2.3,
                      child: const Icon(
                        Icons.play_circle_fill_outlined,
                        size: GFSize.MEDIUM,
                        color: GFColors.WHITE,
                      ),
                    ),
            ),
            Positioned(
              top: 8,
              right: 2,
              child: InkWell(
                onTap: () => logic.state.dongtaiVideos.clear(),
                child: const Icon(
                  Icons.delete_outlined,
                  color: GFColors.WARNING,
                ),
              ),
            ),
            if (file.percentage > 0)
              Positioned(
                bottom: 0,
                height: 0.6,
                child: GFProgressBar(
                  margin: EdgeInsets.zero,
                  progressBarColor: GFColors.SUCCESS,
                  percentage: file.percentage > 1 ? 1 : file.percentage,
                ),
              )
          ],
        ),
      ),
    );
  }
}
