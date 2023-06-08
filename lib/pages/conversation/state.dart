import 'package:JuAI/common/store/chat.dart';
import 'package:get/get.dart';

class ConversationState {
  // title
  var roleVisible = false.obs;
  var conversations = ChatStore.to.lastChats;
}
