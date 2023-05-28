import 'package:JuAI/pages/bbs/controller.dart';
import 'package:JuAI/pages/bbs_chat/controller.dart';
import 'package:JuAI/pages/conversation/controller.dart';
import 'package:JuAI/pages/home/controler.dart';
import 'package:JuAI/pages/settings/controler.dart';
import 'package:JuAI/pages/tools/controller.dart';
import 'package:get/get.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ConversationController>(() => ConversationController());
    Get.lazyPut<ToolsController>(() => ToolsController());
    Get.lazyPut<BbsController>(() => BbsController());
    Get.lazyPut<BbsChatController>(() => BbsChatController());
    Get.lazyPut<SettingsController>(() => SettingsController());
  }
}
