import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ChatState {
  var drawImage = false.obs;
  TextEditingController messageController = TextEditingController();
  FocusNode messageFocusNode = FocusNode();
  var loadStatus = LoadStatus.canLoading.obs;
}
