import 'package:JuAI/pages/conversation/state.dart';
import 'package:get/get.dart';

class ConversationController extends GetxController {
  ConversationController();

  final state = ConversationState();

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
