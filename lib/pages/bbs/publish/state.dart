import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

enum PublishType { dongtai, article }

class PublishModel {
  PublishType type;
  String text;
  PublishModel(this.type, this.text);
}

class PublishState {
  var currentTags = <String>[].obs;
  var dongtaiPics = <FileImage>[].obs;
  var dongtaiVideos = <File>[].obs;
}
