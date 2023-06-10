import 'package:JuAI/entities/content/content.dart';
import 'package:JuAI/entities/user/user_base.dart';
import 'package:get/get.dart';

class SettingsMineHomeState {
  var items = <ContentResEntity>[].obs;
  var homeInfo = UserFollowHome(nickName: "加载中.", id: 0, followedNum: 0, toBeFollowedNum: 0).obs;
}
