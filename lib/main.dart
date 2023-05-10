import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:guxin_ai/common/routers/pages.dart';
import 'package:guxin_ai/wcao/ui/theme.dart';
import 'package:flutter/material.dart';
import 'package:guxin_ai/common/langs/translation_service.dart';
import 'package:guxin_ai/common/routers/routes.dart';
import 'package:guxin_ai/common/store/config.dart';
import 'package:guxin_ai/common/utils/logger.dart';
import 'package:guxin_ai/global.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:window_manager/window_manager.dart';

import 'common/routers/observers.dart';

Future<void> main() async {
  await ScreenUtil.ensureScreenSize();
  // 必须加上这一行。
  if (GetPlatform.isDesktop) {
    await windowManager.ensureInitialized();
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
  await Global.init();
  runApp(
    ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return const MyApp();
      },
    ),
  );
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
    return GetMaterialApp(
      title: '故新AI社区',
      theme: WcaoTheme.lightTheme,
      darkTheme: WcaoTheme.darkTheme,
      builder: EasyLoading.init(),
      getPages: AppPages.routes,
      initialRoute: GetPlatform.isMobile ? Routes.bbsPublishDongtai : Routes.homePc,
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
      fallbackLocale: const Locale('en', 'US'),
      enableLog: true,
      logWriterCallback: Logger.write,
    );
  }
}
