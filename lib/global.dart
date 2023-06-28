import 'package:juai/common/store/notice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:juai/common/services/storage.dart';
import 'package:juai/common/store/chat.dart';
import 'package:juai/common/store/config.dart';
import 'package:juai/common/store/content.dart';
import 'package:juai/common/store/user.dart';
import 'package:juai/common/utils/db_sqlite.dart';
import 'package:juai/common/utils/loading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

/// 全局静态数据
class Global {
  /// 初始化
  static Future init() async {
    var widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    setSystemUi();
    setSqlite();
    Loading();
    await Get.putAsync<StorageService>(() => StorageService().init());
    Get.put<ConfigStore>(ConfigStore());
    Get.put<UserStore>(UserStore());
    // loginedInit();
  }

  //如果需要登录后才初始化的放在这里面。
  static void loginedInit() {
    if (UserStore.to.isLogin) {
      Get.put<NoticeStore>(NoticeStore());
      Get.put<ChatStore>(ChatStore());
      Get.put<ContentStore>(ContentStore());
    }
  }

  static void setSystemUi() {
    if (GetPlatform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }

  static Future<void> setSqlite() async {
    if (!GetPlatform.isMobile) {
      // Initialize FFI
      sqfliteFfiInit();
      // Change the default factory
      databaseFactory = databaseFactoryFfi;
    }
    DbSqlite.internal();
  }
}
