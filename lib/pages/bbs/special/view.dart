import 'package:JuAI/common/apis/content_special_api.dart';
import 'package:JuAI/common/theme.dart';
import 'package:JuAI/common/utils/date.dart';
import 'package:JuAI/common/widgets/bottommost.dart';
import 'package:JuAI/common/widgets/image_cache.dart';
import 'package:JuAI/common/widgets/load_data.dart';
import 'package:JuAI/pages/bbs/widgets/card_index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class SpecialPage extends GetView<SpecialController> {
  SpecialPage({Key? key}) : super(key: key);
  final logic = Get.find<SpecialController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("圈子")),
      body: SafeArea(
        child: Column(
          children: [
            LoadDataWidget(
              logic.getSpecialDetail(),
              chindFunc: (val) => SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: ImageCacheWidget(
                        val.coverImage,
                        width: 80,
                      ),
                      title: Text(val.title),
                      subtitle: Text(val.summary, maxLines: 2, overflow: TextOverflow.ellipsis),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 13),
                      child: Obx(
                        () => RichText(
                          text: TextSpan(
                            style: TextStyle(color: WcaoTheme.placeholder),
                            text: "创建于：" + dateFormatYMD(val.createTime),
                            children: [
                              const TextSpan(text: "        "),
                              const TextSpan(text: "成员："),
                              TextSpan(
                                text: logic.userCnt.value.toString(),
                                style: const TextStyle(color: Color.fromARGB(255, 3, 56, 231)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Obx(
                () => logic.contents.isNotEmpty
                    ? ListView.builder(
                        itemCount: logic.contents.length,
                        itemBuilder: (context, index) {
                          return CardIndexWidget(logic.contents[index]);
                        },
                      )
                    : const BottommostWidget(false),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FilledButton.icon(
        onPressed: () => logic.toJoin(),
        icon: const Icon(Icons.add, color: Colors.white),
        label: Obx(
          () => Text(
            logic.isJoin.value ? "发布" : "加入",
            style: TextStyle(fontSize: WcaoTheme.fsL, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
