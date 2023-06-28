import 'dart:core';

import 'package:juai/common/apis/content_tag_api.dart';
import 'package:get/get.dart';
import 'package:juai/common/apis/content_special_api.dart';
import 'package:juai/entities/content/special.dart';

class ContentStore extends GetxController {
  static ContentStore get to => Get.find();
  List<Map<dynamic, dynamic>> topTags = <Map<dynamic, dynamic>>[];
  List<SpecialResEntity> specials = <SpecialResEntity>[];
  @override
  void onInit() {
    ContentTagApi.topTags().then((value) => topTags = value);
    SpecialApi.getTop().then((value) => specials = value);
    super.onInit();
  }
  // Future<List<ContentResEntity>> getContents({bool isFirst = false}) {
  //   debugPrint("上拉，加载最新");
  //   int? lastId = (isFirst || contents.isEmpty) ? null : contents.last.id;
  //   return ContentAPI.contentList(refresh: true, lastId: lastId).then(
  //     (value) {
  //       if (isFirst) contents.clear();
  //       contents.addAll(value);
  //       return contents;
  //     },
  //   ).catchError(
  //     (err) {
  //       debugPrint("getContents:$err");
  //       Loading.error("加载出错了");
  //       return <ContentResEntity>[].obs;
  //     },
  //   );
  // }
}
