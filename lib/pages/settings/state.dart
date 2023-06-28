import 'package:juai/common/store/user.dart';
import 'package:get/get.dart';

class SettingsState {
  var totalCache = "0".obs;
  var editUser = Map.from({});
  var nickName = UserStore.to.userInfo.value!.nickName.obs;
  var avatar = UserStore.to.userInfo.value!.avatar.obs;
  var hudongNum = 0.obs;
  var contentsNum = 0.obs;
}
