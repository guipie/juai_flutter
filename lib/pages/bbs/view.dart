import 'package:guxin_ai/common/widgets/appbar.dart';
import 'package:guxin_ai/pages/bbs/index/view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                children: [BbsIndexPage()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
