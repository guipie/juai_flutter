import 'dart:convert';

import 'package:guxin_ai/common/apis/user_api.dart';
import 'package:guxin_ai/common/entities/user.dart';
import 'package:guxin_ai/common/routers/routes.dart';
import 'package:guxin_ai/common/services/storage.dart';
import 'package:guxin_ai/common/utils/loading.dart';
import 'package:guxin_ai/common/values/storage.dart';
import 'package:get/get.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  // 是否登录
  final _isLogin = false.obs;
  // 用户 profile
  late Rx<UserLoginResponseEntity?> _userInfo;
  // 令牌 token
  late Rx<UserTokenResponseEntity?> _tokenInfo;
  bool get isLogin => _isLogin.value;
  UserLoginResponseEntity? get userInfo => _userInfo.value;
  UserTokenResponseEntity? get tokenInfo => _tokenInfo.value;

  @override
  void onInit() {
    _userInfoInit();
    super.onInit();
  }

  void _userInfoInit() {
    var userInfoStr = StorageService.to.getString(STORAGE_USER_PROFILE_KEY);
    var tokenInfoStr = StorageService.to.getString(STORAGE_USER_TOKEN_KEY);
    if (userInfoStr.isNotEmpty && tokenInfoStr.isNotEmpty) {
      _tokenInfo = UserTokenResponseEntity.fromRawJson(tokenInfoStr).obs;
      _userInfo = UserLoginResponseEntity.fromRawJson(userInfoStr).obs;
      _isLogin.value = !GetUtils.isNullOrBlank(tokenInfo?.token)! && !GetUtils.isNullOrBlank(userInfo?.userName)!;
    }
  }

  // 获取 profile
  Future<void> getProfile() async {
    // if (token.isEmpty) return;
    // var result = await UserAPI.profile();
    // _profile(result);
    // _isLogin.value = true;
    // StorageService.to.setString(STORAGE_USER_PROFILE_KEY, jsonEncode(result));
  }

  // 保存 profile
  Future<void> saveProfile(UserLoginResponseEntity userLoginResponseEntity, UserTokenResponseEntity tokenResponseEntity) async {
    await StorageService.to.setString(STORAGE_USER_TOKEN_KEY, tokenResponseEntity.toRawJson());
    await StorageService.to.setString(STORAGE_USER_PROFILE_KEY, userLoginResponseEntity.toRawJson());
    _userInfoInit();
  }

  // 注销
  Future<void> onLogout() async {
    // if (_isLogin.value) await UserAPI.logout();
    Loading.confirm("您确认是否退出？", onConfirm: () async {
      await StorageService.to.remove(STORAGE_USER_TOKEN_KEY);
      await StorageService.to.remove(STORAGE_USER_PROFILE_KEY);
      _isLogin.value = false;
      Get.offAllNamed(Routes.settingsLogin);
    });
  }
}
