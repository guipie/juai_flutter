import 'package:JuAI/common/assets.dart';
import 'package:JuAI/entities/message/chat_role.dart';
import 'package:flutter/material.dart';
import 'package:JuAI/entities/message/conversation.dart';
import 'package:get/get.dart';

class ChatState {
  var drawImage = false.obs;
  TextEditingController messageController = TextEditingController();
  FocusNode messageFocusNode = FocusNode();
}
