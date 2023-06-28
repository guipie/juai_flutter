import 'dart:convert';

import 'package:juai/common/apis/user_api.dart';
import 'package:juai/common/utils/date.dart';
import 'package:juai/entities/user/user_gpt_token.dart';
import 'package:juai/entities/user/user_login.dart';
import 'package:juai/common/routers/routes.dart';
import 'package:juai/common/services/storage.dart';
import 'package:juai/common/utils/loading.dart';
import 'package:juai/common/values/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  // 是否登录
  final _isLogin = false.obs;
  bool get isLogin => _isLogin.value;

  // 用户 profile
  UserLoginResponseEntity _userInfo = UserLoginResponseEntity(id: 0, userName: "", nickName: "未登录", tokenNum: 0, phone: "", lastLoginDate: DateTime.now(), roleNames: "");
  Rx<UserLoginResponseEntity?> get userInfo => _userInfo.obs;
  // 令牌 token
  late UserTokenResponseEntity? _tokenInfo;
  UserTokenResponseEntity? get tokenInfo => _tokenInfo;
  int get userId => userInfo.value!.id;

  GptTokenEntity _gptTokenSetting = GptTokenEntity(count: 0, contextType: 3, lastUseDate: DateTime.now());
  Rx<GptTokenEntity> get gptTokenSettings => _gptTokenSetting.obs;
  @override
  void onInit() {
    _userInfoInit();
    debugPrint("_userInfo.lastLoginDate${_userInfo.lastLoginDate}");
    if (_isLogin.value && dateFormatYMD(_userInfo.lastLoginDate) != dateFormatYMD(DateTime.now())) _replaceToken();
    super.onInit();
  }

  void _userInfoInit() {
    var userInfoStr = StorageService.to.getString(STORAGE_USER_PROFILE_KEY);
    var tokenInfoStr = StorageService.to.getString(STORAGE_USER_TOKEN_KEY);
    if (userInfoStr.isNotEmpty && tokenInfoStr.isNotEmpty) {
      try {
        _tokenInfo = UserTokenResponseEntity.fromRawJson(tokenInfoStr);
        _userInfo = UserLoginResponseEntity.fromRawJson(userInfoStr);
        setGetGptToken(count: _userInfo.tokenNum);
        _isLogin.value = !GetUtils.isNullOrBlank(tokenInfo?.token)! && !GetUtils.isNullOrBlank(userInfo.value!.userName)!;
      } catch (e) {
        debugPrint("初始化用户出错了$e");
        _logout();
      }
    }
    debugPrint("用户是否登录成功${_isLogin.value}, IsLogin:$isLogin");
  }

  void _replaceToken() {
    UserAPI.replaceToken().then((value) {
      if (value.isOk) {
        UserStore.to.saveProfile(UserLoginResponseEntity.fromJson(value.data["userResponse"]), UserTokenResponseEntity.fromJson(value.data["tokenInfo"])).then((value) {
          _isLogin.value = true;
        });
      } else {
        _logout();
      }
    }).catchError((err) => _logout());
  }
  // // 获取 用户tokenPeizhi
  // GptTokenEntity getGetGptToken() {
  //   var gptToken = StorageService.to.getString(STORAGE_USER_GPT_TOKEN_SETTINGS);
  //   if (gptToken.isEmpty) {
  //     return GptTokenEntity(count: 0, contextType: 3, lastUseDate: DateTime.now());
  //   }
  //   debugPrint("_gptTokenSetting-GET:$gptToken");
  //   return GptTokenEntity.fromRawJson(gptToken);
  // }

  void setGetGptToken({int? count, int? contextType}) {
    var gptToken = StorageService.to.getString(STORAGE_USER_GPT_TOKEN_SETTINGS);
    debugPrint("gptToken-本地存储值:$gptToken");
    if (gptToken.isNotEmpty) {
      _gptTokenSetting = GptTokenEntity.fromRawJson(gptToken);
    }
    if (contextType != null) _gptTokenSetting.contextType = contextType;
    if (count != null) _gptTokenSetting.count = count;
    _gptTokenSetting.lastUseDate = DateTime.now();
    debugPrint("_gptTokenSetting-SET:${_gptTokenSetting.toRawJson()}");
    StorageService.to.setString(STORAGE_USER_GPT_TOKEN_SETTINGS, _gptTokenSetting.toRawJson());
  }

  // 保存 profile
  Future<void> saveProfile(UserLoginResponseEntity userLoginResponseEntity, UserTokenResponseEntity tokenResponseEntity) async {
    await StorageService.to.setString(STORAGE_USER_TOKEN_KEY, tokenResponseEntity.toRawJson());
    await StorageService.to.setString(STORAGE_USER_PROFILE_KEY, userLoginResponseEntity.toRawJson());
    _userInfoInit();
    userInfo.refresh();
  }

  Future<void> resetUserInfo(Map<dynamic, dynamic> update) async {
    var user = _userInfo.toJson();
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
    debugPrint("Get.currentRoute：${Get.currentRoute}");
    if (Get.currentRoute != Routes.settingsLogin && Get.currentRoute != Routes.settingsLoginByVocde) Get.offAllNamed(Routes.settingsLogin);
  }
}
