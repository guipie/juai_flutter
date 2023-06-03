import 'package:JuAI/entities/content/content.dart';
import 'package:get/get.dart';
import 'package:JuAI/common/apis/content_api.dart';
import 'package:JuAI/common/store/content.dart';
import 'package:JuAI/pages/bbs/detail/state.dart';

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
    var _content = ContentStore.to.contents.firstWhereOrNull((m) => m.id == state.contentId);
    if (_content == null) {
      state.currentContent = await ContentAPI.contentDetail(state.contentId);
    } else {
      state.currentContent = _content;
    }
    return state.currentContent;
  }
}
