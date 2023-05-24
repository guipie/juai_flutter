import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:guxin_ai/common/theme.dart';
import 'package:guxin_ai/common/utils/utils.dart';
import 'package:guxin_ai/entities/content/content.dart';
import 'package:guxin_ai/common/widgets/avatar.dart';
import 'package:guxin_ai/pages/bbs/detail/controller.dart';
import 'package:guxin_ai/pages/bbs/publish/widgets/article/read_only_page.dart';
import 'package:guxin_ai/pages/bbs/widgets/card_dongtai_images.dart';
import 'package:guxin_ai/pages/bbs/widgets/card_dongtai_video.dart';

class BbsDetailPage extends StatelessWidget {
  BbsDetailPage({super.key});
  final logic = Get.find<ContentDetailController>();
  @override
  Widget build(BuildContext context) {
    final detail = logic.state.currentContent;
    return Scaffold(
      appBar: AppBar(
        title: Text(detail.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                selected: true,
                leading: avatar(avatarUrl: detail.avatar),
                title: Text(
                  detail.createNick ?? "匿名作者",
                  style: TextStyle(fontSize: 16.0, color: Theme.of(context).colorScheme.onSurface),
                ),
                subtitle: Text(
                  "发布于" + DateTimeLine(detail.createTime),
                  style: TextStyle(fontSize: 12.0, color: Theme.of(context).colorScheme.onSurfaceVariant),
                ),
                trailing: 1 == 2
                    ? OutlinedButton(onPressed: () {}, child: const Text("关注"))
                    : FilledButton(
                        onPressed: () {},
                        child: const Text("已关注"),
                      ),
              ),
              if (detail.category == BaCategory.Image && detail.files.isNotEmpty) CardDongtaiImagesWidget(detail),
              if (detail.category == BaCategory.Video && detail.files.isNotEmpty) CardDongtaiVideoWidget(detail.files.first),
              if (detail.category == BaCategory.Text) Text(detail.content),
              if (detail.category == BaCategory.Article) ReadOnlyPage(source: detail.content),
              const Divider(),
              const SizedBox(height: 8.0),
              Obx(
                () => TextField(
                  focusNode: logic.state.commentFocus,
                  controller: logic.state.commentController,
                  decoration: InputDecoration(
                    hintText: logic.state.replyUserInfo.value.id == 0 ? '优质评论' : '回复' + logic.state.replyUserInfo.value.nickName,
                    border: const OutlineInputBorder(),
                    suffix: logic.state.replyUserInfo.value.id > 0 || logic.state.commentController.text.isNotEmpty
                        ? IconButton(
                            onPressed: () => logic.removeAll(),
                            icon: const Icon(
                              Icons.close_outlined,
                              size: 16,
                            ),
                          )
                        : null,
                  ),
                ),
              ),
              const SizedBox(height: 8.0),
              SizedBox(
                width: double.infinity,
                child: Wrap(
                  alignment: WrapAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () => logic.addComment(),
                      child: const Text('添加评论'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: logic.state.comments.length,
                  itemBuilder: (context, index) {
                    var item = logic.state.comments[index];
                    return InkWell(
                      onTap: () {},
                      hoverColor: Theme.of(context).colorScheme.onSecondary,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            crossAxisAlignment: WrapCrossAlignment.center,
                            spacing: 8,
                            children: [
                              avatar(avatarUrl: item.avatar, radius: 18),
                              Text(
                                item.createNick,
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              if (item.replyId != null && item.replyId! > 0 && item.replyUser != null)
                                RichText(
                                  text: TextSpan(
                                    style: const TextStyle(color: Colors.blue),
                                    children: [
                                      const TextSpan(text: "回复:"),
                                      TextSpan(text: item.replyUser!.nickName),
                                    ],
                                  ),
                                ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 45),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(item.comment),
                                SizedBox(
                                  width: double.infinity,
                                  child: Wrap(
                                    alignment: WrapAlignment.end,
                                    children: [
                                      Text(DateTimeStrLine(item.createTime)),
                                      const SizedBox(width: 20),
                                      InkWell(
                                        child: const Text("回复"),
                                        onTap: () => logic.toReply(context, item.createNick, item.createId),
                                      ),
                                      const SizedBox(width: 20),
                                      InkWell(
                                        onTap: () {},
                                        child: const Icon(
                                          Icons.favorite_border_outlined,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
