import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:juai_flutter/generated/locales.g.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 128),
      splitScreenMode: false,
      child: const Center(
        child: Text("juai.link"),
      ),
      builder: (BuildContext context, Widget? child) {
        return AdaptiveTheme(
          light: ThemeData.light(useMaterial3: true),
          dark: ThemeData.dark(useMaterial3: true),
          initial: AdaptiveThemeMode.system,
          builder: (theme, darkTheme) => GetMaterialApp(
            title: LocaleKeys.app_name.tr,
            enableLog: kDebugMode,
            translationsKeys: AppTranslation.translations,
            locale: Get.deviceLocale,
            fallbackLocale: const Locale('zh', 'CN'),
            theme: theme,
            darkTheme: darkTheme,
            debugShowCheckedModeBanner: false,
            initialRoute: AppPages.initRoute,
            getPages: AppPages.routes,
            defaultTransition: Transition.rightToLeft,
          ),
        );
      },
    );
  }
}
