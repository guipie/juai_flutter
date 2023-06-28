import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

enum PublishType { dongtai, article }

enum SendType { nosend, cansend, sending }

class DongtaiFile {
  String? url;
  String path;
  String? name;
  double percentage = 0.0;
  DongtaiFile({required this.path, this.url, this.name, required this.percentage});
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
  var specialId = 0;
  var specialName = "".obs;
}
