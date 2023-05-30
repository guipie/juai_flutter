import 'package:JuAI/common/utils/date.dart';
import 'package:JuAI/entities/content/content.dart';
import 'package:JuAI/pages/bbs/widgets/card_dongtai_images.dart';
import 'package:JuAI/pages/bbs/widgets/card_dongtai_video.dart';
import 'package:JuAI/pages/bbs/widgets/tags.dart';
import 'package:JuAI/pages/bbs/widgets/tools.dart';
import 'package:JuAI/pages/settings/mine/controller.dart';
import 'package:flutter/material.dart';
import 'package:JuAI/common/widgets/avatar.dart';
import 'package:JuAI/common/widgets/image_cache.dart';
import 'package:JuAI/common/widgets/tag.dart';
import 'package:JuAI/common/theme.dart';
import 'package:get/get.dart';

class SettingsMineHomeWidget extends StatelessWidget {
  SettingsMineHomeWidget({super.key});
  final logic = Get.find<SettingsMineHomeController>();
  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: ((context, innerBoxIsScrolled) {
        return [
          SliverAppBar(
            automaticallyImplyLeading: false,
            pinned: true,
            expandedHeight: 320,
            leading: TextButton.icon(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_sharp, color: Colors.white),
              label: const Text("返回", style: TextStyle(color: Colors.white)),
            ),
            leadingWidth: 100,
            actions: [
              TextButton.icon(
                onPressed: () => Get.toNamed('/mine/add-tag'),
                icon: const Icon(Icons.add_sharp, color: Colors.white),
                label: const Text("", style: TextStyle(color: Colors.white)),
              ),
            ],
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                double top = constraints.biggest.height;
                bool isOpacity = top == MediaQuery.of(context).padding.top + kToolbarHeight;
                return FlexibleSpaceBar(
                  centerTitle: true,
                  title: AnimatedOpacity(
                    duration: const Duration(microseconds: 300),
                    opacity: isOpacity ? 1 : 0,
                    child: Text(
                      "哈哈哈哈",
                      style: TextStyle(
                        color: WcaoTheme.base,
                        fontSize: WcaoTheme.fsXl,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  background: Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: top,
                        child: ImageCacheWidget(""),
                      ),
                      Positioned(
                        child: Container(
                          color: Colors.black.withOpacity(.33),
                        ),
                      ),
                      Positioned(
                        bottom: 56,
                        width: MediaQuery.of(context).size.width,
                        child: profile(),
                      )
                    ],
                  ),
                );
              },
            ),
          ),

          /// 数据信息
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    child: adapterItem(22, '全部'),
                    onTap: () => Get.toNamed('/mine/visitors'),
                  ),
                  adapterDrive(),
                  InkWell(
                    child: adapterItem(32, '动态'),
                    onTap: () => Get.toNamed('/mine/firends'),
                  ),
                  adapterDrive(),
                  InkWell(
                    child: adapterItem(41, '视频'),
                    onTap: () => Get.toNamed('/mine/fans'),
                  ),
                  adapterDrive(),
                  InkWell(
                    child: adapterItem(41, '文章'),
                    onTap: () => Get.toNamed('/mine/fans'),
                  )
                ],
              ),
            ),
          ),
        ];
      }),
      body: Obx(
        () => ListView.builder(
          physics: const ClampingScrollPhysics(), // 重要
          padding: const EdgeInsets.all(0),
          itemCount: logic.state.items.length,
          itemBuilder: (context, index) {
            return _contentItem(logic.state.items[index]);
          },
        ),
      ),
    );
  }

  /// 我的动态 item
  Container _contentItem(ContentResEntity content) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Container(
        padding: const EdgeInsets.only(bottom: 24, top: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: .5,
              color: WcaoTheme.outline,
            ),
          ),
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        dateFormatYMD(content.createTime),
                        style: TextStyle(color: WcaoTheme.secondary),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        width: 300,
                        child: Text(
                          content.summary,
                          style: TextStyle(
                            fontSize: WcaoTheme.fsL,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.more_horiz),
                  iconSize: WcaoTheme.fsBase * 2.5,
                  onPressed: () {},
                ),
              ],
            ),
            if (content.category == BaCategory.Image && content.files.isNotEmpty) CardDongtaiImagesWidget(content),
            if (content.category == BaCategory.Video && content.files.isNotEmpty) CardDongtaiVideoWidget(content.files.first),
            if (content.tags != null && content.tags!.length > 2) TagsWidget(content.tags!),
            ToolsWidget(content),
          ],
        ),
      ),
    );
  }

  Column adapterItem(int num, String text) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "$num",
          style: TextStyle(
            fontSize: WcaoTheme.fsXl,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: WcaoTheme.secondary,
          ),
        )
      ],
    );
  }

  Container adapterDrive() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 48),
      height: 12,
      width: .5,
      color: WcaoTheme.placeholder,
    );
  }

  /// 个人信息
  Widget profile() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          avatar(
            avatarUrl: "",
            radius: 28,
          ),
          Container(
            margin: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "mineNickName",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: WcaoTheme.fsXl,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.edit_note,
                  color: Colors.white,
                  size: WcaoTheme.fsBase * 2,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 12),
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 8.0,
              children: [
                Text(
                  '22天',
                  style: TextStyle(
                    color: WcaoTheme.placeholder,
                  ),
                ),
                Text(
                  '22关注',
                  style: TextStyle(
                    color: WcaoTheme.placeholder,
                  ),
                ),
                Text(
                  '22粉丝',
                  style: TextStyle(
                    color: WcaoTheme.placeholder,
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            height: 100,
            child: SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 12,
                runSpacing: 6,
                children: List.generate(
                  0,
                  (index) {
                    return TagWidget(
                      "hah哈哈12",
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      backgroundColor: Colors.black.withOpacity(.4),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      fontSize: WcaoTheme.fsBase,
                      fontWeight: FontWeight.bold,
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
