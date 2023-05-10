import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class DetailPage extends GetView<DetailController> {
  const DetailPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const Center(
      child: Text("DetailPage"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailController>(
      init: DetailController(),
      id: "detail",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("detail")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
