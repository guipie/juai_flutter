import 'dart:core';

import 'package:get/get.dart';
import 'package:JuAI/common/apis/content_special_api.dart';
import 'package:JuAI/entities/content/content.dart';
import 'package:JuAI/entities/content/special.dart';
import 'package:JuAI/common/index.dart';
import 'package:JuAI/common/store/store.dart';

class ContentStore extends GetxController {
  static ContentStore get to => Get.find();
  late List<Map<dynamic, dynamic>> topTags;
  late List<SpecialResEntity> specials;
  var contents = <ContentResEntity>[].obs;
  @override
  void onInit() {
    if (UserStore.to.isLogin) {
      contentInit();
    }
    super.onInit();
  }

  void contentInit() {
    ContentAPI.topTags().then((value) => topTags = value);
    SpecialApi.getTop().then((value) => specials = value);
    getContents();
  }

  void getContents({Function? complete, bool isNext = false}) {
    int? lastId;
    if (contents.isEmpty || !isNext) {
      lastId = null;
    } else {
      lastId = contents.last.id;
    }
    ContentAPI.contentList(refresh: true, lastId: lastId).then((value) {
      if (contents.isEmpty || !isNext) {
        contents.value = value;
      } else {
        contents.addAll(value);
      }
      complete?.call();
    }).catchError(
      (err) {
        complete?.call();
      },
    );
  }
}