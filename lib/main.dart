import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:window_manager/window_manager.dart';

import 'base.dart';
import 'base/riverpod/provider_log.dart';
import 'initial.dart';
import 'pages/splash_page.dart';
import 'utils/hive_box.dart';

ProviderContainer? globalRef;
void main() async {
  await Initial.init();
  await S.load(getLocaleByCode(HiveBox().globalLanguageCode));
  if (F.windows) {
    debugPrint('IsWindows: ${F.windows}');
    // 必须加上这一行。
    await windowManager.ensureInitialized();
    var windowOptions = const WindowOptions(
      size: Size(980, 640),
      minimumSize: Size(600, 400),
      center: true,
      backgroundColor: Colors.transparent,
      skipTaskbar: false,
      titleBarStyle: TitleBarStyle.normal,
    );
    await windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
  globalRef = ProviderContainer(
    observers: [
      ProviderLogger(),
    ],
  );
  runApp(
    UncontrolledProviderScope(
      container: globalRef!,
      child: const MyApp(),
    ),
  );
  if (Platform.isAndroid) {
    var style = const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var globalLanguage = ref.watch(globalLanguageProvider);
    var primaryColor = ref.watch(primaryColorProvider);
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          key: ValueKey(globalLanguage),
          navigatorKey: F.navigatorKey,
          title: S.current.app_name,
          localeResolutionCallback: (Locale? locale, Iterable<Locale> supportedLocales) {
            if (locale != null) {
              return locale;
            }
            return supportedLocales.first;
          },
          debugShowCheckedModeBanner: false,
          theme: ref.watch(themeProvider).theme(primaryColor),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          home: const SplashPage(),
          locale: getLocaleByCode(globalLanguage),
          builder: (context, child) {
            return FlutterEasyLoading(
                child: ScrollConfiguration(
              behavior: const ScrollPhysicsConfig(),
              child: child ?? Container(),
            ));
          },
        );
      },
      child: const Text('聚AI,一个就够了'),
    );
  }
}

/// 全局滚动配置，默认全部使用iOS的BouncingScrollPhysics效果
class ScrollPhysicsConfig extends ScrollBehavior {
  const ScrollPhysicsConfig();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.android:
        return const BouncingScrollPhysics();
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return const ClampingScrollPhysics();
      default:
        return const BouncingScrollPhysics();
    }
  }
}
