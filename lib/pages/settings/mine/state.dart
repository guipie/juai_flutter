import 'package:JuAI/entities/content/content.dart';
import 'package:JuAI/entities/content/special.dart';
import 'package:JuAI/entities/user/user_base.dart';
import 'package:get/get.dart';

class SettingsMineHomeState {
  var contents = <ContentResEntity>[].obs;
  var specials = <SpecialResEntity>[].obs;
  var currentType = "all".obs;
  var homeInfo = UserFollowHome(nickName: "加载中.", id: 0, followedNum: 0, toBeFollowedNum: 0, videoNum: 0, articleNum: 0, dongtaiNum: 0, specialNum: 0).obs;
}
