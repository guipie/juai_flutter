import 'package:JuAI/entities/api_response.dart';
import 'package:JuAI/entities/content/content.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingMyHudongController extends GetxController {
  SettingMyHudongController();
  var ccontents = <ContentResEntity>[].obs;
  var likeContents = <ContentResEntity>[].obs;
  var isLoading = false;
  _initData() {
    update(["hudong"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
    _loadData();
  }

  _loadData() {
    if (!isLoading) {
      isLoading = true;
      ContentAPI.myCommentContentList(lastId: ccontents.isEmpty ? null : ccontents.last.id).then((value) {
        ccontents.addAll(value);
        isLoading = false;
      });
      ContentAPI.myLikeContentList(lastId: likeContents.isEmpty ? null : likeContents.last.id).then((value) {
        likeContents.addAll(value);
        isLoading = false;
      });
    }
  }

  bool handleScrollNotification(ScrollNotification notification) {
    final ScrollMetrics metrics = notification.metrics;
    if (metrics.pixels == metrics.maxScrollExtent) {
      _loadData();
      return true;
    }
    return false;
  }
  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
