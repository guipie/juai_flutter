import 'package:JuAI/common/apis/content_special_api.dart';
import 'package:JuAI/common/routers/routes.dart';
import 'package:JuAI/common/store/store.dart';
import 'package:JuAI/common/utils/date.dart';
import 'package:JuAI/common/widgets/bottommost.dart';
import 'package:JuAI/entities/content/content.dart';
import 'package:JuAI/pages/bbs/widgets/card_dongtai_images.dart';
import 'package:JuAI/pages/bbs/widgets/card_dongtai_video.dart';
import 'package:JuAI/pages/bbs/widgets/specials.dart';
import 'package:JuAI/pages/bbs/widgets/tags.dart';
import 'package:JuAI/pages/bbs/widgets/tools.dart';
import 'package:JuAI/pages/settings/mine/controller.dart';
import 'package:JuAI/pages/widgets/follow_btn.dart';
import 'package:flutter/material.dart';
import 'package:JuAI/common/widgets/avatar.dart';
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
            expandedHeight: 280,
            leading: TextButton.icon(
              onPressed: () => Get.back(),
              icon: const Icon(Icons.arrow_back_sharp, color: Colors.white),
              label: const Text("返回", style: TextStyle(color: Colors.white)),
            ),
            leadingWidth: 100,
            actions: [
              if (UserStore.to.userId != logic.userId) FollowFillButtonWidget(logic.userId),
              if (UserStore.to.userId == logic.userId)
                TextButton.icon(
                  style: ButtonStyle(iconColor: MaterialStateProperty.all(Colors.white)),
                  onPressed: () => Get.toNamed(Routes.bbsPublishDongtai),
                  icon: const Icon(Icons.send_sharp),
                  label: const Text(
                    "发布",
                    style: TextStyle(color: Colors.white),
                  ),
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
                      logic.state.homeInfo.value.nickName,
                      style: TextStyle(
                        color: WcaoTheme.base,
                        fontSize: WcaoTheme.fsXl,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  background: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        height: top,
                        color: const Color.fromARGB(255, 36, 36, 36),
                      ),
                      Positioned(
                        bottom: 26,
                        width: MediaQuery.of(context).size.width,
                        child: profile(),
                      ),
                      Positioned(
                        bottom: 12,
                        right: 8,
                        child: Obx(
                          () => Text(
                            logic.state.homeInfo.value.remark ?? "",
                            style: TextStyle(color: WcaoTheme.secondary, fontSize: WcaoTheme.fsL),
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          //圈子
          SliverToBoxAdapter(
            child: FutureBuilder(
              future: SpecialApi.getMine(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) return SpecialsWidget(snapshot.data);
                return const SizedBox.shrink();
              },
            ),
          ),
          // 数据信息
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.all(24),
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      child: adapterItem(
                        logic.state.homeInfo.value.articleNum + logic.state.homeInfo.value.dongtaiNum + logic.state.homeInfo.value.videoNum,
                        '全部',
                        isSeleted: logic.state.currentType.value == "all",
                      ),
                      onTap: () {
                        logic.state.currentType.value = "all";
                        logic.getUserContents(isFirst: true);
                      },
                    ),
                    adapterDrive(),
                    InkWell(
                      child: adapterItem(
                        logic.state.homeInfo.value.dongtaiNum,
                        '动态',
                        isSeleted: logic.state.currentType.value == "dongtai",
                      ),
                      onTap: () {
                        logic.state.currentType.value = "dongtai";
                        logic.getUserContents(isFirst: true);
                      },
                    ),
                    adapterDrive(),
                    InkWell(
                      child: adapterItem(
                        logic.state.homeInfo.value.videoNum,
                        '视频',
                        isSeleted: logic.state.currentType.value == "video",
                      ),
                      onTap: () {
                        logic.state.currentType.value = "video";
                        logic.getUserContents(isFirst: true);
                      },
                    ),
                    adapterDrive(),
                    InkWell(
                      child: adapterItem(
                        logic.state.homeInfo.value.articleNum,
                        '文章',
                        isSeleted: logic.state.currentType.value == "article",
                      ),
                      onTap: () {
                        logic.state.currentType.value = "article";
                        logic.getUserContents(isFirst: true);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ];
      }),
      body: NotificationListener(
        onNotification: logic.handleScrollNotification,
        child: Obx(
          () => ListView.builder(
            physics: const ClampingScrollPhysics(), // 重要
            padding: const EdgeInsets.all(0),
            itemCount: logic.state.contents.length + 1,
            itemBuilder: (context, index) {
              debugPrint("indexindexindexindex$index");
              if (index == logic.state.contents.length) {
                return BottommostWidget(
                  logic.isLoading.value,
                  isNodata: logic.state.contents.isEmpty,
                );
              } else {
                return _contentItem(logic.state.contents[index]);
              }
            },
          ),
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
          crossAxisAlignment: CrossAxisAlignment.start,
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

  Column adapterItem(int num, String text, {bool isSeleted = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "$num",
          style: TextStyle(
            fontSize: isSeleted ? WcaoTheme.fsXl : WcaoTheme.fsL,
            fontWeight: isSeleted ? FontWeight.bold : FontWeight.w400,
          ),
        ),
        Text(
          text,
          style: TextStyle(
            color: isSeleted ? WcaoTheme.secondary : WcaoTheme.placeholder,
          ),
        )
      ],
    );
  }

  Container adapterDrive() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 26),
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
            avatarUrl: logic.state.homeInfo.value.avatar,
            radius: 28,
          ),
          Container(
            margin: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => Text(
                    logic.state.homeInfo.value.nickName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: WcaoTheme.fsXl,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => logic.toAddTag(),
                  icon: const Icon(Icons.tag_sharp, color: Colors.white),
                ),
              ],
            ),
          ),
          Obx(
            () => Container(
              margin: const EdgeInsets.only(top: 12),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 8.0,
                children: [
                  Text(
                    DateTime.now().difference(logic.state.homeInfo.value.createTime ?? DateTime.now()).inDays.toString() + '天',
                    style: TextStyle(
                      color: WcaoTheme.placeholder,
                    ),
                  ),
                  Text(
                    '${logic.state.homeInfo.value.followedNum}关注',
                    style: TextStyle(
                      color: WcaoTheme.placeholder,
                    ),
                  ),
                  Text(
                    '${logic.state.homeInfo.value.toBeFollowedNum}粉丝',
                    style: TextStyle(
                      color: WcaoTheme.placeholder,
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 5),
            height: 100,
            child: SingleChildScrollView(
              child: Obx(
                () => Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 12,
                  runSpacing: 6,
                  children: (logic.state.homeInfo.value.tag ?? [])
                      .map((e) => TagWidget(
                            e.toString(),
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                            backgroundColor: Colors.black.withOpacity(.4),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(24),
                            fontSize: WcaoTheme.fsBase,
                            fontWeight: FontWeight.bold,
                            close: logic.state.homeInfo.value.id == UserStore.to.userId,
                            onClose: () => logic.delTag(e.toString()),
                          ))
                      .toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
