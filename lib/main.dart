import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:juai_flutter/app/core/theme/index.dart';
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
      designSize: const Size(375, 812),
      splitScreenMode: false,
      child: const Center(
        child: Text("juai.link"),
      ),
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          title: LocaleKeys.app_name.tr,
          enableLog: kDebugMode,
          translationsKeys: AppTranslation.translations,
          locale: Get.deviceLocale,
          fallbackLocale: const Locale('zh', 'CN'),
          theme: createLightThemeData(),
          darkTheme: createDarkThemeData(),
          debugShowCheckedModeBanner: false,
          initialRoute: AppPages.initRoute,
          getPages: AppPages.routes,
          defaultTransition: Transition.rightToLeft,
          builder: EasyLoading.init(
            builder: (_, child) => MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(1.0),
              ),
              child: child!,
            ),
          ),
        );
      },
    );
  }
}
