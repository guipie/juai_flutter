import 'package:JuAI/common/utils/http.dart';
import 'package:flutter/material.dart';
import 'package:JuAI/common/services/storage.dart';
import 'package:JuAI/common/values/storage.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: constant_identifier_names
enum PlatformType { Android, IOS, Windows, Mac, Linux, Web }

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

  void upgrade(BuildContext context) {
    PlatformType type = PlatformType.Android;
    if (GetPlatform.isIOS) {
      type = PlatformType.IOS;
    } else if (GetPlatform.isMacOS) {
      type = PlatformType.Mac;
    } else if (GetPlatform.isWindows) {
      type = PlatformType.Windows;
    } else if (GetPlatform.isLinux) {
      type = PlatformType.Linux;
    } else if (GetPlatform.isWeb) {
      type = PlatformType.Web;
    }
    HttpUtil().get("/common/upgrade/" + type.name).then((value) {
      debugPrint("升级信息$value");
      if (value.data != null && value.data["Version"] != _platform?.version) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('版本升级'),
              content: const Text('内测阶段，升级频繁，每次升级都有新功能，望理解'),
              actions: <Widget>[
                FilledButton(
                  child: const Text('去升级'),
                  onPressed: () {
                    final Uri _url = Uri.parse('http://124.220.50.194');
                    launchUrl(_url);
                  },
                ),
              ],
            );
          },
        );
      }
    });
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
