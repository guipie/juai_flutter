import 'package:JuAI/common/apis/content_special_api.dart';
import 'package:JuAI/common/theme.dart';
import 'package:JuAI/common/widgets/bottommost.dart';
import 'package:JuAI/common/widgets/image_cache.dart';
import 'package:JuAI/common/widgets/load_data.dart';
import 'package:JuAI/pages/bbs/widgets/card_index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class SpecialPage extends StatelessWidget {
  SpecialPage({Key? key}) : super(key: key);
  final _ = Get.find<SpecialController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("圈子")),
      body: SafeArea(
        child: Column(
          children: [
            LoadDataWidget(
              SpecialApi.get(_.specialId),
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
                      padding: EdgeInsets.only(left: 13),
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: WcaoTheme.placeholder),
                          text: "创建于：2020-12-22",
                          children: [
                            TextSpan(text: "        "),
                            TextSpan(text: "成员："),
                            TextSpan(text: "24", style: TextStyle(color: Color.fromARGB(255, 3, 56, 231))),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: _.contents.isNotEmpty
                  ? Obx(
                      () => ListView.builder(
                        itemCount: _.contents.length,
                        itemBuilder: (context, index) {
                          return CardIndexWidget(_.contents[index]);
                        },
                      ),
                    )
                  : BottommostWidget(false),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
