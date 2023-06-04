import 'package:JuAI/common/store/chat.dart';
import 'package:JuAI/entities/message/chat_role.dart';
import 'package:get/get.dart';

class ConversationState {
  // title
  var roleVisible = false.obs;
  var conversations = ChatStore.to.lastConversions;
  var chatRoles = <ChatRoleEntity>[];
}
