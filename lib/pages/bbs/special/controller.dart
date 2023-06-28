import 'package:juai/common/apis/content_special_api.dart';
import 'package:juai/common/utils/base_page/base_page_controller.dart';
import 'package:juai/common/utils/base_page/base_page_params.dart';
import 'package:juai/entities/content/content.dart';
import 'package:juai/entities/content/special.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:juai/pages/bbs/special/state.dart';

class SpecialController extends PagingController<ContentResEntity, SpecialState> {
  SpecialController();
  var specialId = 0;
  late SpecialResEntity detail;
  var userCnt = 0.obs;
  var isJoin = false.obs;
  @override
  void onInit() {
    specialId = Get.arguments;
    SpecialApi.getSpecialUserCnt(specialId).then((value) => userCnt.value = value);
    SpecialApi.isJoinSpecial(specialId).then((value) => isJoin.value = value);
    super.onInit();
  }

  Future<SpecialResEntity> getSpecialDetail() async {
    return SpecialApi.get(specialId).then((value) {
      detail = value;
      return value;
    });
  }

  toJoinOrPublish({String? route}) async {
    if (isJoin.value) {
      var result = await Get.toNamed(route!, arguments: {"specialId": specialId, "specialName": detail.title});
      debugPrint("result,result:$result");
      if (result != null && result > 0) refreshController.requestRefresh();
    } else {
      SpecialApi.joinSpecial(specialId).then((value) => isJoin.value = value > 0);
    }
  }

  @override
  SpecialState getState() => SpecialState();

  @override
  Future<List<ContentResEntity>?> loadData(PagingParams pagingParams) {
    return SpecialApi.getSpecialContents(specialId, pagingParams.lastId);
  }
  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
