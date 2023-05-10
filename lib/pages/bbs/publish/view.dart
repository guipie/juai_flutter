import 'package:guxin_ai/common/routers/routes.dart';
import 'package:guxin_ai/pages/bbs/publish/controller.dart';
import 'package:flutter/material.dart';
import 'package:guxin_ai/wcao/kit/index.dart';
import 'package:guxin_ai/wcao/ui/theme.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import 'widgets/widgets.dart';

class PublishDongtaiPage extends StatelessWidget {
  PublishDongtaiPage({super.key});
  final logic = Get.find<PublishController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('发布动态'),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('发布'),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '优质内容，需要您的贡献',
                          border: InputBorder.none,
                        ),
                        maxLines: null,
                      ),
                    ),
                    if (logic.state.dongtaiPics.isNotEmpty)
                      Visibility(
                        visible: true,
                        child: Container(
                          height: 68,
                          margin: const EdgeInsets.only(bottom: 24),
                          child: ListView(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            scrollDirection: Axis.horizontal,
                            children: [
                              _selectedImage('https://wcao.cc/r/a/avatar?1'),
                              _selectedImage('https://wcao.cc/r/a/avatar?2'),
                              _selectedImage('https://wcao.cc/r/a/avatar?3'),
                              _selectedImage('https://wcao.cc/r/a/avatar?4'),
                              _selectedImage('https://wcao.cc/r/a/avatar?5'),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
            // 添加话题
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: logic.state.currentTags.map((e) => PublishWidgets().huatiWidget(e)).toList(),
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
                    onPressed: () {},
                    icon: Icon(
                      Icons.image_outlined,
                      color: WcaoTheme.secondary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.videocam_outlined,
                      color: WcaoTheme.secondary,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.tag_outlined,
                      color: WcaoTheme.secondary,
                    ),
                  ),
                  GFButton(
                    onPressed: () {
                      Get.toNamed(Routes.bbsPublishArticle);
                    },
                    text: "写文章",
                    size: GFSize.LARGE,
                    type: GFButtonType.transparent,
                  )
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: Icon(
                  //     Icons.location_on_outlined,
                  //     color: WcaoTheme.secondary,
                  //   ),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container _selectedImage(String src) {
    return Container(
      margin: const EdgeInsets.only(left: 12),
      child: Stack(
        children: [
          SizedBox(
            width: 68,
            height: 68,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: WcaoUtils.imageCache(src, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: 68,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(8), bottomRight: Radius.circular(8)),
                color: WcaoTheme.base.withOpacity(.5),
              ),
              alignment: Alignment.center,
              child: const Text(
                '删除',
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
