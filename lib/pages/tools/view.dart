import 'package:JuAI/common/assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'package:getwidget/getwidget.dart';

class ToolsPage extends GetView<ToolsController> {
  const ToolsPage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return GFCard(
      boxFit: BoxFit.cover,
      image: Image.asset(Assets.jingqingqidai),
      content: const Text("服务器正在申请中"),
      buttonBar: GFButtonBar(
        children: <Widget>[
          GFButton(
            onPressed: () {},
            text: '贡献',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AI工具")),
      body: SafeArea(
        child: _buildView(),
      ),
    );
  }
}
