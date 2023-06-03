import 'dart:convert';

import 'package:JuAI/entities/user_login.dart';
import 'package:JuAI/common/routers/routes.dart';
import 'package:JuAI/common/services/storage.dart';
import 'package:JuAI/common/utils/loading.dart';
import 'package:JuAI/common/values/storage.dart';
import 'package:get/get.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  // 是否登录
  final _isLogin = false.obs;
  // 用户 profile
  UserLoginResponseEntity _userInfo = UserLoginResponseEntity(id: 0, userName: "", nickName: "未登录", status: "", tokenNum: 0, phone: "", lastLoginDate: DateTime.now(), roleNames: "");
  // 令牌 token
  late UserTokenResponseEntity? _tokenInfo;
  bool get isLogin => _isLogin.value;
  Rx<UserLoginResponseEntity?> get userInfo => _userInfo.obs;
  UserTokenResponseEntity? get tokenInfo => _tokenInfo;
  int get userId => userInfo.value!.id;
  @override
  void onInit() {
    _userInfoInit();
    super.onInit();
  }

  void _userInfoInit() {
    var userInfoStr = StorageService.to.getString(STORAGE_USER_PROFILE_KEY);
    var tokenInfoStr = StorageService.to.getString(STORAGE_USER_TOKEN_KEY);
    if (userInfoStr.isNotEmpty && tokenInfoStr.isNotEmpty) {
      _tokenInfo = UserTokenResponseEntity.fromRawJson(tokenInfoStr);
      _userInfo = UserLoginResponseEntity.fromRawJson(userInfoStr);
      _isLogin.value = !GetUtils.isNullOrBlank(tokenInfo?.token)! && !GetUtils.isNullOrBlank(userInfo.value!.userName)!;
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
    userInfo.refresh();
  }

  Future<void> resetUserInfo(Map<dynamic, dynamic> update) async {
    var user = _userInfo!.toJson();
    for (var key in user.keys) {
      if (update.keys.contains(key)) {
        user[key] = update[key];
      }
    }
    await StorageService.to.setString(STORAGE_USER_PROFILE_KEY, json.encode(user));
    _userInfoInit();
  }

  // 注销
  Future<void> onLogout({isMust = false}) async {
    // if (_isLogin.value) await UserAPI.logout();
    if (isMust) {
      _logout();
    } else {
      Loading.confirm("您确认是否退出？", onConfirm: () async {
        _logout();
      });
    }
  }

  _logout() async {
    await StorageService.to.remove(STORAGE_USER_TOKEN_KEY);
    await StorageService.to.remove(STORAGE_USER_PROFILE_KEY);
    _isLogin.value = false;
    Get.offAllNamed(Routes.settingsLogin);
  }
}
