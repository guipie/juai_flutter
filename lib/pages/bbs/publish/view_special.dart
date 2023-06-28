import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:juai/common/theme.dart';
import 'package:juai/pages/bbs/publish/widgets/select_special.dart';

import 'controller_special.dart';

class PublishSpecialPage extends StatelessWidget {
  PublishSpecialPage({Key? key}) : super(key: key);
  final logic = Get.find<PublishSpecialController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('创建圈子'),
        actions: [
          const SelectSpecialWidget(),
          const SizedBox(
            width: 20,
          ),
          GFButton(
            onPressed: () => logic.saveSpecial(),
            text: "发布",
            color: GFColors.WARNING,
            shape: GFButtonShape.pills,
            size: GFSize.SMALL,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              maxLength: 10,
              controller: logic.titleController,
              decoration: const InputDecoration(
                labelText: '圈子名称',
              ),
              maxLengthEnforcement: MaxLengthEnforcement.none,
            ),
            const SizedBox(height: 20),
            TextField(
              maxLength: 200,
              maxLines: 4,
              controller: logic.summaryConroller,
              decoration: const InputDecoration(
                labelText: '圈子描述',
              ),
              maxLengthEnforcement: MaxLengthEnforcement.none,
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () => logic.openSpecialImage(),
              child: Container(
                height: 200,
                width: 200,
                color: Colors.grey.withOpacity(0.3),
                child: Obx(
                  () => Stack(
                    alignment: AlignmentDirectional.center,
                    children: [
                      logic.currentCover.isNotEmpty
                          ? Image.file(
                              File(logic.currentCover.value),
                              fit: BoxFit.fill,
                              width: 200,
                            )
                          : Icon(
                              Icons.add_a_photo,
                              size: 50,
                              color: Colors.grey.withOpacity(0.7),
                            ),
                      if (!logic.currentCover.isNotEmpty)
                        Positioned(
                          child: Text(
                            "圈子封面",
                            style: TextStyle(
                              color: WcaoTheme.placeholder,
                              fontSize: WcaoTheme.fsL,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          bottom: 1,
                        )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Obx(
                  () => Checkbox(
                      value: logic.isPay.value,
                      onChanged: (value) {
                        logic.isPay.value = !logic.isPay.value;
                      }),
                ),
                const Text('圈子是否付费'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
