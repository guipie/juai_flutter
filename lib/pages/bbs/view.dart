import 'package:guxin_ai/common/routers/routes.dart';
import 'package:guxin_ai/common/widgets/appbar.dart';
import 'package:guxin_ai/pages/bbs/index/index.dart';
import 'package:flutter/material.dart';
import 'package:guxin_ai/common/widgets/ui/theme.dart';
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
      appBar: bbsBar(context, controller.state.tabs),
      body: DefaultTabController(
        initialIndex: controller.state.curPage,
        length: controller.state.tabs.length,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
}
