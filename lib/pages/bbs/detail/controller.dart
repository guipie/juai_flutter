import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:JuAI/common/apis/content_api.dart';
import 'package:JuAI/common/apis/content_comment_api.dart';
import 'package:JuAI/common/store/content.dart';
import 'package:JuAI/common/store/store.dart';
import 'package:JuAI/common/utils/loading.dart';
import 'package:JuAI/entities/content/comment.dart';
import 'package:JuAI/entities/user_base.dart';
import 'package:JuAI/pages/bbs/detail/state.dart';

class ContentDetailController extends GetxController {
  ContentDetailController();
  BbsDetailState state = BbsDetailState();
  @override
  Future<void> onInit() async {
    state.contentId = Get.arguments ?? state.contentId;
    await toDetail(state.contentId);
    super.onInit();
  }

  Future<void> toDetail(int contentId) async {
    var _content = ContentStore.to.contents.firstWhereOrNull((m) => m.id == contentId);
    if (_content == null) {
      state.currentContent = await ContentAPI.contentDetail(contentId);
    } else {
      state.currentContent = _content;
    }
  }
}
