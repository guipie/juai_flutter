import 'package:JuAI/common/apis/content_tag_api.dart';
import 'package:JuAI/common/widgets/load_data.dart';
import 'package:JuAI/pages/bbs/widgets/card_index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class TagPage extends GetView<TagController> {
  TagPage({Key? key}) : super(key: key);
  final logic = Get.find<TagController>();
  // 主视图
  Widget _buildView() {
    debugPrint("logic.taglogic.taglogic.tag" + logic.tag);
    return LoadDataWidget(
      ContentTagApi.contents(logic.tag),
      chindFunc: (data) {
        return ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return CardIndexWidget(data[index]);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TagController>(
      init: TagController(),
      id: "tag",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text(logic.tag)),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
