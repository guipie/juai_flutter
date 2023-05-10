import 'package:guxin_ai/pages/bbs/controller.dart';
import 'package:guxin_ai/pages/bbs_chat/controller.dart';
import 'package:guxin_ai/pages/conversation/controller.dart';
import 'package:guxin_ai/pages/home/controler.dart';
import 'package:guxin_ai/pages/tools/controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ConversationController>(() => ConversationController());
    Get.lazyPut<ToolsController>(() => ToolsController());
    Get.lazyPut<BbsController>(() => BbsController());
    Get.lazyPut<BbsChatController>(() => BbsChatController());
  }
}
