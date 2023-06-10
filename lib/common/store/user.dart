import 'dart:convert';

import 'package:JuAI/common/store/chat.dart';
import 'package:JuAI/common/store/content.dart';
import 'package:JuAI/common/store/notice.dart';
import 'package:JuAI/entities/user/user_gpt_token.dart';
import 'package:JuAI/entities/user/user_login.dart';
import 'package:JuAI/common/routers/routes.dart';
import 'package:JuAI/common/services/storage.dart';
import 'package:JuAI/common/utils/loading.dart';
import 'package:JuAI/common/values/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserStore extends GetxController {
  static UserStore get to => Get.find();

  // 是否登录
  final _isLogin = false.obs;
  bool get isLogin => _isLogin.value;

  // 用户 profile
  UserLoginResponseEntity _userInfo = UserLoginResponseEntity(id: 0, userName: "", nickName: "未登录", status: "", tokenNum: 0, phone: "", lastLoginDate: DateTime.now(), roleNames: "");
  Rx<UserLoginResponseEntity?> get userInfo => _userInfo.obs;
  // 令牌 token
  late UserTokenResponseEntity? _tokenInfo;
  UserTokenResponseEntity? get tokenInfo => _tokenInfo;
  int get userId => userInfo.value!.id;

  static GptTokenEntity _tokenEntity = GptTokenEntity(count: 0, contextType: 3, lastUseDate: DateTime.now());
  var tokenEntity = _tokenEntity.obs;
  @override
  void onInit() {
    _userInfoInit();
    super.onInit();
  }

  void _userInfoInit() {
    var userInfoStr = StorageService.to.getString(STORAGE_USER_PROFILE_KEY);
    var tokenInfoStr = StorageService.to.getString(STORAGE_USER_TOKEN_KEY);
    if (userInfoStr.isNotEmpty && tokenInfoStr.isNotEmpty) {
      try {
        _tokenInfo = UserTokenResponseEntity.fromRawJson(tokenInfoStr);
        _userInfo = UserLoginResponseEntity.fromRawJson(userInfoStr);
        setGetGptToken(_userInfo.tokenNum);
        _isLogin.value = !GetUtils.isNullOrBlank(tokenInfo?.token)! && !GetUtils.isNullOrBlank(userInfo.value!.userName)!;
      } catch (e) {
        _logout();
        debugPrint("初始化用户出错了");
        throw Exception("出错了，卸载重新安装");
      }
    }
    debugPrint("用户是否登录成功${_isLogin.value}, IsLogin:$isLogin");
  }

  // 获取 profile
  static GptTokenEntity getGetGptToken() {
    var gptToken = StorageService.to.getString(STORAGE_USER_GPT_TOKEN_SETTINGS);
    if (gptToken.isEmpty) {
      return GptTokenEntity(count: 0, contextType: 3, lastUseDate: DateTime.now());
    }
    return GptTokenEntity.fromRawJson(gptToken);
  }

  void setGetGptToken(int count, {int? contextType}) {
    _userInfo.tokenNum = count;
    var gptToken = StorageService.to.getString(STORAGE_USER_GPT_TOKEN_SETTINGS);
    if (gptToken.isNotEmpty) {
      _tokenEntity = GptTokenEntity.fromRawJson(gptToken);
    }
    _tokenEntity.contextType = contextType ?? 0;
    _tokenEntity.count = count;
    _tokenEntity.lastUseDate = DateTime.now();
    StorageService.to.setString(STORAGE_USER_GPT_TOKEN_SETTINGS, _tokenEntity.toRawJson());
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
    Get.offAllNamed(Routes.settingsLogin);
  }
}
