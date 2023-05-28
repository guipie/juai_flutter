import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:JuAI/common/routers/pages.dart';
import 'package:JuAI/common/theme.dart';
import 'package:flutter/material.dart';
import 'package:JuAI/common/langs/translation_service.dart';
import 'package:JuAI/common/routers/routes.dart';
import 'package:JuAI/common/store/config.dart';
import 'package:JuAI/common/utils/logger.dart';
import 'package:JuAI/global.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:media_kit/media_kit.dart';
import 'package:window_manager/window_manager.dart';

import 'common/routers/observers.dart';

Future<void> main() async {
  await ScreenUtil.ensureScreenSize();
  await Global.init();
  // 必须加上这一行。
  if (GetPlatform.isDesktop) {
    await windowManager.ensureInitialized();
    MediaKit.ensureInitialized();
    WindowOptions windowOptions = const WindowOptions(
      center: true,
      minimumSize: Size(600, 800),
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.normal,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    // 启动页关闭
    await Future.delayed(const Duration(seconds: 3));
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return GetMaterialApp(
      title: '故新AI社区',
      theme: WcaoTheme.lightTheme,
      darkTheme: WcaoTheme.darkTheme,
      builder: EasyLoading.init(),
      getPages: AppPages.routes,
      initialRoute: GetPlatform.isMobile ? Routes.home : Routes.homePc,
      navigatorObservers: [RouteObservers()],
      // unknownRoute: AppPages.unknownRoute,
      defaultTransition: Transition.rightToLeftWithFade,
      debugShowCheckedModeBanner: false,
      translations: TranslationService(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: ConfigStore.to.languages,
      locale: ConfigStore.to.locale,
      fallbackLocale: const Locale('zh', 'CN'),
      logWriterCallback: Logger.write,
    );
  }
}
