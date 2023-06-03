import 'package:flutter/material.dart';
import 'package:JuAI/common/services/storage.dart';
import 'package:JuAI/common/values/storage.dart';
import 'package:get/get.dart';
import 'package:package_info/package_info.dart';

class ConfigStore extends GetxController {
  static ConfigStore get to => Get.find();

  bool isFirstOpen = false;
  PackageInfo? _platform;
  String get version => _platform?.version ?? '-';
  bool get isRelease => const bool.fromEnvironment("dart.vm.product");
  Locale locale = const Locale('zh', 'CN');
  List<Locale> languages = [
    const Locale('zh', 'CN'),
    const Locale('en', 'US'),
  ];
  var isDarkMode = Get.isDarkMode.obs;
  @override
  void onInit() {
    super.onInit();
    isFirstOpen = StorageService.to.getBool(STORAGE_DEVICE_FIRST_OPEN_KEY);
    getPlatform();
    saveAlreadyOpen();
  }

  Future<void> getPlatform() async {
    _platform = await PackageInfo.fromPlatform();
  }

  // 标记用户已打开APP
  Future<bool> saveAlreadyOpen() {
    return StorageService.to.setBool(STORAGE_DEVICE_FIRST_OPEN_KEY, true);
  }

  void onInitLocale() {
    var langCode = StorageService.to.getString(STORAGE_LANGUAGE_CODE);
    if (langCode.isEmpty) return;
    var index = languages.indexWhere((element) {
      return element.languageCode == langCode;
    });
    if (index < 0) return;
    locale = languages[index];
  }

  void onLocaleUpdate(Locale value) {
    locale = value;
    Get.updateLocale(value);
    StorageService.to.setString(STORAGE_LANGUAGE_CODE, value.languageCode);
  }

  void onDarkModeChage() {
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.light : ThemeMode.dark);
    isDarkMode.value = !isDarkMode.value;
  }
}
