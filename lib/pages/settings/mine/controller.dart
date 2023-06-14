import 'package:JuAI/common/apis/content_special_api.dart';
import 'package:JuAI/entities/api_response.dart';
import 'package:JuAI/common/apis/user_extend_api.dart';
import 'package:JuAI/common/apis/user_follow_api.dart';
import 'package:JuAI/common/store/store.dart';
import 'package:JuAI/pages/settings/mine/state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsMineHomeController extends GetxController {
  final state = SettingsMineHomeState();
  var dialogController = TextEditingController();
  var userId = 0;
  var isLoading = false.obs;
  @override
  void onInit() {
    userId = Get.arguments ?? UserStore.to.userId;
    UserFollowApi.getFollowUserHome(userId).then((value) => state.homeInfo.value = value);
    getUserContents();
    SpecialApi.getMine().then((value) => state.specials.value = value);
    super.onInit();
  }

  void getUserContents({bool isFirst = false}) {
    if (!isLoading.value) {
      isLoading.value = true;
      var lastId = state.contents.isEmpty ? null : state.contents.last.id;
      if (isFirst) lastId = null;
      ContentAPI.userContentList(userId, type: state.currentType.value, lastId: lastId).then((value) {
        if (lastId == null) {
          state.contents.clear();
        }
        state.contents.addAll(value);
        isLoading.value = false;
      });
    }
  }

  toAddTag() {
    Get.defaultDialog(
      title: "",
      titlePadding: EdgeInsets.zero,
      onConfirm: () {
        if (dialogController.text.trim().isNotEmpty) {
          UserExtendApi.updateInsertTag(dialogController.text.trim()).then((value) {
            state.homeInfo.value.tag = value;
            state.homeInfo.refresh();
          });
          Get.back();
        }
      },
      textConfirm: "确定",
      textCancel: "取消",
      content: TextField(
        controller: dialogController,
        decoration: const InputDecoration(hintText: "添加属于自己的标签"),
      ),
    );
  }

  delTag(val) {
    UserExtendApi.delTag(val).then((value) {
      state.homeInfo.value.tag = value;
      state.homeInfo.refresh();
    });
  }

  bool handleScrollNotification(ScrollNotification notification) {
    final ScrollMetrics metrics = notification.metrics;
    if (metrics.pixels == metrics.maxScrollExtent) {
      getUserContents();
      return true;
    }
    return false;
  }
}
