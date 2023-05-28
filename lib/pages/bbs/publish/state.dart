import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:JuAI/entities/content/content.dart';
import 'package:video_player/video_player.dart';

import 'widgets/article/article_edit.dart';

enum PublishType { dongtai, article }

enum SendType { nosend, cansend, sending }

class DongtaiFile {
  String? url;
  String path;
  double percentage = 0.0;
  DongtaiFile({required this.path, this.url, required this.percentage});
}
// class PublishModel {
//   PublishType type;
//   String text;
//   PublishModel(this.type, this.text);
// }

class PublishState {
  var isDrag = false.obs;
  var currentSendType = SendType.nosend.obs;
  var currentTags = <String>[].obs;
  var dongtaiPics = <DongtaiFile>[].obs;
  var dongtaiVideos = <DongtaiFile>[].obs;
  var dongtaiController = TextEditingController();
  var dongtaiFocus = FocusNode();
  var dongtaiKeyboardHeight = 0.0.obs;
  late VideoPlayerController videoController;
  var videoPlaying = false.obs;
  var articleTitleController = TextEditingController();

  var isPay = false.obs;
  var payController = TextEditingController();
}
