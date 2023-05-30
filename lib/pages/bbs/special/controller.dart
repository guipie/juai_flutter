import 'package:JuAI/common/apis/content_special_api.dart';
import 'package:JuAI/common/routers/routes.dart';
import 'package:JuAI/entities/content/content.dart';
import 'package:JuAI/entities/content/special.dart';
import 'package:get/get.dart';

class SpecialController extends GetxController {
  SpecialController();
  var specialId = 0;
  late SpecialResEntity detail;
  var contents = <ContentResEntity>[].obs;
  var userCnt = 0.obs;
  var isJoin = false.obs;
  @override
  Future<void> onInit() async {
    specialId = Get.arguments;
    await _getContents(true);
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

  _getContents(bool isFirst) async {
    var list = await SpecialApi.getSpecialContents(specialId);
    if (isFirst) {
      contents.value = list;
    } else {
      contents.addAll(list);
    }
  }

  toJoin() {
    if (isJoin.value) {
      Get.toNamed(Routes.bbsPublishDongtai, arguments: Map.from({"specialId": specialId, "specialName": detail.title}));
    } else {
      SpecialApi.joinSpecial(specialId).then((value) => isJoin.value = value > 0);
    }
  }
  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
