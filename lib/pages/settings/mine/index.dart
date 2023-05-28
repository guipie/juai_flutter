import 'package:flutter/material.dart';
import 'package:JuAI/common/widgets/avatar.dart';
import 'package:JuAI/common/widgets/image_cache.dart';
import 'package:JuAI/pages/settings/mine/mock.dart';
import 'package:JuAI/common/widgets/tag.dart';
import 'package:JuAI/common/theme.dart';
import 'package:get/get.dart';

import '../../bbs/mock.dart';

class SettingsMineHomeWidget extends StatelessWidget {
  final MockMine mine = MockMine.get();
  final List<MockLike> items = MockLike.get(num: 4);

  SettingsMineHomeWidget({super.key});
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
              onPressed: () {},
              icon: Icon(Icons.arrow_back_sharp, color: Colors.white),
              label: Text("返回", style: TextStyle(color: Colors.white)),
            ),
            leadingWidth: 100,
            actions: [
              TextButton.icon(
                onPressed: () => Get.toNamed('/mine/add-tag'),
                icon: Icon(Icons.add_sharp, color: Colors.white),
                label: Text("", style: TextStyle(color: Colors.white)),
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
                        child: ImageCacheWidget(mine.bg),
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
                    child: adapterItem(mine.visits, '访客'),
                    onTap: () => Get.toNamed('/mine/visitors'),
                  ),
                  adapterDrive(),
                  InkWell(
                    child: adapterItem(mine.friends, '好友'),
                    onTap: () => Get.toNamed('/mine/firends'),
                  ),
                  adapterDrive(),
                  InkWell(
                    child: adapterItem(mine.fans, '粉丝'),
                    onTap: () => Get.toNamed('/mine/fans'),
                  )
                ],
              ),
            ),
          ),
        ];
      }),
      body: ListView.builder(
        physics: const ClampingScrollPhysics(), // 重要
        padding: const EdgeInsets.all(0),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return dynamicItem(items[index], items.length - 1 > index);
        },
      ),
    );
  }

  /// 我的动态 item
  Container dynamicItem(MockLike item, bool bottomBorder) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Container(
        padding: const EdgeInsets.only(bottom: 24, top: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: .5,
              color: bottomBorder ? WcaoTheme.outline : Colors.transparent,
            ),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.time.split('T')[0],
                        style: TextStyle(color: WcaoTheme.secondary),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 8),
                        width: 300,
                        child: Text(
                          item.text,
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
            item.media.isNotEmpty
                ? Container(
                    margin: const EdgeInsets.only(top: 12),
                    width: double.infinity,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: ImageCacheWidget(item.media[0]),
                    ),
                  )
                : Container(),
            Container(
              width: double.infinity,
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(top: item.media.isNotEmpty ? 24 : 12),
              child: Wrap(
                spacing: 12,
                runSpacing: 6,
                children: List.generate(
                  item.tag.length,
                  (index) => TagWidget(
                    item.tag[index],
                    color: WcaoTheme.primary,
                    borderRadius: BorderRadius.circular(24),
                  ),
                ).toList(),
              ),
            )
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
          "动态",
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
            avatarUrl: mine.avatar,
            radius: 28,
          ),
          Container(
            margin: const EdgeInsets.only(top: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  mine.nickName,
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
            child: Text(
              '${mine.createDay}天 ${mine.tags.length}动态',
              style: TextStyle(
                color: WcaoTheme.placeholder,
              ),
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
                  mine.tags.length,
                  (index) {
                    return TagWidget(
                      mine.tags[index],
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
