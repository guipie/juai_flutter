import 'package:juai/common/store/store.dart';
import 'package:juai/pages/bbs/controller.dart';
import 'package:juai/pages/bbs/index/controller.dart';
import 'package:juai/pages/bbs_chat/controller.dart';
import 'package:juai/pages/conversation/controller.dart';
import 'package:juai/pages/home/controler.dart';
import 'package:juai/pages/settings/controler.dart';
import 'package:juai/pages/tools/controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ConversationController>(() => ConversationController());
    Get.lazyPut<ToolsController>(() => ToolsController());
    Get.lazyPut<BbsController>(() => BbsController());
    Get.put<BbsIndexController>(BbsIndexController(), tag: "BbsIndex");
    Get.lazyPut<BbsChatController>(() => BbsChatController());
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}
