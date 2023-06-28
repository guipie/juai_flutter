import 'package:juai/entities/content/content.dart';
import 'package:get/get.dart';
import 'package:juai/common/apis/content_api.dart';
import 'package:juai/pages/bbs/detail/state.dart';

class ContentDetailController extends GetxController {
  ContentDetailController();
  BbsDetailState state = BbsDetailState();
  @override
  Future<void> onInit() async {
    state.contentId = Get.arguments ?? state.contentId;
    await toDetail();
    super.onInit();
  }

  Future<ContentResEntity> toDetail() async {
    state.currentContent = await ContentAPI.contentDetail(state.contentId);
    state.title.value = state.currentContent.title;
    return state.currentContent;
  }
}
