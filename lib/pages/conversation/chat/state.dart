import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatState {
  var drawImage = false.obs;
  TextEditingController messageController = TextEditingController();
  FocusNode messageFocusNode = FocusNode();
}
