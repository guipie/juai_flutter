import 'dart:io';

import 'package:juai/common/theme.dart';
import 'package:juai/common/widgets/image_cache.dart';
import 'package:juai/pages/bbs/publish/state.dart';
import 'package:juai/pages/bbs/widgets/card_dongtai_video.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import 'controller.dart';

class SuggestionsPage extends GetView<SuggestionsController> {
  const SuggestionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SuggestionsController>(
      init: SuggestionsController(),
      id: "suggestions",
      builder: (_) {
        return GestureDetector(
          behavior: HitTestBehavior.translucent,
          child: Scaffold(
            appBar: AppBar(
              title: Obx(
                () => controller.isDrag.value
                    ? GFButton(
                        onPressed: () {},
                        text: "拖动到此处删除",
                        color: GFColors.DANGER,
                        fullWidthButton: true,
                      )
                    : const Text("问题反馈"),
              ),
              actions: [
                FilledButton(
                  onPressed: () => controller.toSave(),
                  child: const Text("发 布"),
                )
              ],
            ),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextField(
                        autofocus: false,
                        controller: controller.txtController,
                        decoration: const InputDecoration(
                          hintText: '您的功能需求和建议，及使用中遇到的任何问题，bug等...',
                          hintStyle: TextStyle(overflow: TextOverflow.fade),
                          border: InputBorder.none,
                        ),
                        maxLines: null,
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
                            onPressed: () => controller.openImage(context),
                            icon: Icon(
                              Icons.image_outlined,
                              color: WcaoTheme.secondary,
                            ),
                          ),
                          IconButton(
                            onPressed: () => controller.openVideo(context),
                            icon: Icon(
                              Icons.videocam_outlined,
                              color: WcaoTheme.secondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Obx(
                      () => controller.dongtaiPics.isNotEmpty
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
                                itemCount: controller.dongtaiPics.length,
                                itemBuilder: (context, index) {
                                  var _item = controller.dongtaiPics[index];
                                  return _selectedImage(_item, index);
                                },
                              ),
                            )
                          : const SizedBox(),
                    ),
                    Obx(
                      () => controller.dongtaiVideos.isNotEmpty ? _selectedVideo() : const SizedBox(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Draggable<int> _selectedImage(DongtaiFile file, int index) {
    return Draggable<int>(
      data: index,
      onDragStarted: () => controller.isDrag.value = true,
      onDragEnd: (details) {
        if (details.offset.dy < 100) controller.dongtaiPics.removeAt(index);
        controller.isDrag.value = false;
      },
      child: DragTarget<int>(
        onAccept: (fromIndex) {
          var fromItem = controller.dongtaiPics[fromIndex];
          controller.dongtaiPics.remove(fromItem);
          controller.dongtaiPics.insert(index, fromItem);
          controller.isDrag.value = false;
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
    DongtaiFile file = controller.dongtaiVideos[0];
    return InkWell(
      onTap: () {
        if (controller.videoController.value.isPlaying) {
          controller.videoController.pause();
        } else {
          controller.videoController.play();
        }
        controller.videoPlaying.value = controller.videoController.value.isPlaying;
      },
      child: Container(
        margin: const EdgeInsets.only(left: 4),
        height: 200,
        child: CardDongtaiVideoWidget(
          file.path,
          isNetwork: false,
          isFirstLoading: false,
        ),
      ),
    );
  }
}
