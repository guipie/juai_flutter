import 'package:JuAI/common/routers/routes.dart';
import 'package:JuAI/common/widgets/load_data.dart';
import 'package:JuAI/pages/widgets/follow_btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:JuAI/common/utils/utils.dart';
import 'package:JuAI/entities/content/content.dart';
import 'package:JuAI/common/widgets/avatar.dart';
import 'package:JuAI/pages/bbs/detail/controller.dart';
import 'package:JuAI/pages/bbs/detail/widgets/comment_widget.dart';
import 'package:JuAI/pages/bbs/publish/widgets/article/read_only_page.dart';
import 'package:JuAI/pages/bbs/widgets/card_dongtai_images.dart';
import 'package:JuAI/pages/bbs/widgets/card_dongtai_video.dart';

class BbsDetailPage extends StatelessWidget {
  BbsDetailPage({super.key});
  final logic = Get.find<ContentDetailController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("详情"),
      ),
      body: LoadDataWidget(
        logic.toDetail(),
        chindFunc: (detail) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    selected: true,
                    leading: InkWell(
                      onTap: () => Get.toNamed(Routes.settingsMineHome, arguments: detail.createId),
                      child: avatar(avatarUrl: detail.avatar),
                    ),
                    title: Text(
                      detail.createNick!,
                      style: TextStyle(fontSize: 16.0, color: Theme.of(context).colorScheme.onSurface),
                    ),
                    subtitle: Text(
                      "发布于" + DateTimeLine(detail.createTime),
                      style: TextStyle(fontSize: 12.0, color: Theme.of(context).colorScheme.onSurfaceVariant),
                    ),
                    trailing: FollowFillButtonWidget(detail.createId),
                  ),
                  if (detail.category != BaCategory.Article) Text(detail.content),
                  if (detail.category == BaCategory.Image && detail.files.isNotEmpty) CardDongtaiImagesWidget(detail),
                  if (detail.category == BaCategory.Video && detail.files.isNotEmpty) CardDongtaiVideoWidget(detail.files.first),
                  if (detail.category == BaCategory.Article) ReadOnlyPage(source: detail.content),
                  const Divider(),
                  const SizedBox(height: 8.0),
                  CommentWidget(detail.id),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
