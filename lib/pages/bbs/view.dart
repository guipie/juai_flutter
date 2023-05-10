import 'package:guxin_ai/common/routers/routes.dart';
import 'package:guxin_ai/pages/bbs/index/index.dart';
import 'package:flutter/material.dart';
import 'package:guxin_ai/wcao/ui/theme.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/types/gf_button_type.dart';

import 'controller.dart';

// 社区

class BbsPage extends GetView<BbsController> {
  const BbsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        initialIndex: controller.state.curPage,
        length: controller.state.tabs.length,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            setAppbar(),
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.state.pageController,
                children: const [BbsIndexPage()],
              ),
            )
          ],
        ),
      ),
    );
  }

  /// appbar
  AppBar setAppbar() {
    return AppBar(
      centerTitle: false,
      title: SizedBox(
        width: double.infinity,
        child: Wrap(
          alignment: WrapAlignment.start,
          children: controller.state.tabs
              .map(
                (e) => GFButton(
                  onPressed: () {
                    controller.state.tabs.indexOf(e);
                  },
                  size: GFSize.LARGE,
                  text: e,
                  color: 0 == controller.state.tabs.indexOf(e) ? GFColors.WARNING : GFColors.FOCUS,
                  type: GFButtonType.transparent,
                ),
              )
              .toList(),
        ),
      ),
      actions: [
        GFButton(
          onPressed: () {
            Get.toNamed(Routes.bbsPublishDongtai);
          },
          padding: const EdgeInsets.all(0),
          text: "发布",
          type: GFButtonType.transparent,
          icon: const Icon(Icons.add_outlined),
        ),
      ],
    );
  }
}
