import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../const.dart';
import '../generated/l10n.dart';
import '../utils/hive_box.dart';
import '../utils/sp_util.dart';

enum SupportedLanguage {
  zh('zh'),
  en('en'),
  ja('ja'),
  ko('ko');

  final String code;

  const SupportedLanguage(this.code);
}

List<String> getSupportedLanguage() {
  return SupportedLanguage.values.map((e) => e.code).toList();
}

Locale getLocaleByDefaultCode() {
  var code = HiveBox().globalLanguageCode;
  var resultCode = code;
  if (code == 'auto') {
    var defLan = WidgetsBinding.instance.window.locale.languageCode;
    if (getSupportedLanguage().contains(defLan)) {
      resultCode = defLan;
    } else {
      if (defLan.startsWith('zh')) {
        resultCode = 'zh';
      }
    }
  }

  return S.delegate.supportedLocales.firstWhere((element) => element.languageCode == resultCode, orElse: () => WidgetsBinding.instance.window.locale);
}

Locale getLocaleByCode(String code) {
  var resultCode = code;
  if (code == 'auto') {
    var defLan = WidgetsBinding.instance.window.locale.languageCode;
    if (getSupportedLanguage().contains(defLan)) {
      resultCode = defLan;
    } else {
      if (defLan.startsWith('zh')) {
        resultCode = 'zh';
      }
    }
  }

  return S.delegate.supportedLocales.firstWhere((element) => element.languageCode == resultCode, orElse: () => WidgetsBinding.instance.window.locale);
}

Map<String, String> getLocaleLanguages() {
  var code = getLocaleByDefaultCode().languageCode;

  if (code == SupportedLanguage.en.code) {
    return supportedEnglishLanguages;
  }

  if (code == SupportedLanguage.zh.code) {
    return supportedLanguages;
  }

  if (code == SupportedLanguage.ko.code) {
    return supportedKoLanguages;
  }
  if (code == SupportedLanguage.ja.code) {
    return supportedJapaneseLanguages;
  }

  return supportedEnglishLanguages;
}

String getLocaleNameByCode(String code) {
  if (code == 'auto') {
    return 'Auto';
  }

  switch (code) {
    case 'en':
      return 'English';
    case 'ja':
      return '日本語';
    case 'zh':
      return '简体中文';
    case 'ko':
      return '한국인';
  }
  return 'English';
}

final globalLanguageProvider = StateNotifierProvider<GlobalLanguageModel, String>((ref) {
  return GlobalLanguageModel(HiveBox().globalLanguageCode);
});

class GlobalLanguageModel extends StateNotifier<String> {
  GlobalLanguageModel(super.state);

  String get globalLanguage => getLocaleNameByCode(state);

  Locale get getLocale => getLocaleByCode(state);

  void change(String t) {
    if (t == state) return;
    state = t;
    HiveBox().appConfig.put(HiveBox.cAppConfigGlobalLanguageCode, t);
    S.load(getLocaleByCode(state));
  }
}

final primaryColorProvider = StateNotifierProvider<PrimaryColorNotify, Color>((ref) {
  return PrimaryColorNotify(Color(int.parse(HiveBox().primaryColor, radix: 16)));
});

class PrimaryColorNotify extends StateNotifier<Color> {
  PrimaryColorNotify(super.state);

  void change(Color t) {
    if (t == state) return;
    state = t;
    HiveBox().appConfig.put(HiveBox.cAppConfigPrimaryColor, t.value.toRadixString(16));
  }

  Color get color => state;
}

final themeProvider = StateNotifierProvider<ThemeViewModel, BaseTheme>((ref) {
  return ThemeViewModel(LightTheme());
});

enum ThemeType {
  light,
  dark,
  system;

  static ThemeType getType(int type) {
    switch (type) {
      case 0:
        return ThemeType.light;
      case 1:
        return ThemeType.dark;
      case 2:
        return ThemeType.system;
      default:
        return ThemeType.light;
    }
  }
}

BaseTheme _getThemeByType(int themeType) {
  switch (themeType) {
    case 0:
      return LightTheme();
    case 1:
      return DarkTheme();
    case 2:
      var brightness = SchedulerBinding.instance.platformDispatcher.platformBrightness;
      var isDarkMode = brightness == Brightness.dark;
      if (isDarkMode) {
        return DarkTheme();
      }
      return LightTheme();
    default:
      return LightTheme();
  }
}

class ThemeViewModel extends StateNotifier<BaseTheme> {
  ThemeViewModel(super.state) {
    var type = SpUtil.getInt(spLightTheme, defValue: ThemeType.system.index);
    state = _getThemeByType(type);
  }
  ThemeType get type => ThemeType.getType(SpUtil.getInt(spLightTheme, defValue: ThemeType.system.index));
  bool get isDarkMode => type == ThemeType.dark;
  void change(int t) {
    state = _getThemeByType(t);
    SpUtil.putInt(
      spLightTheme,
      t,
    );
  }
}

abstract class BaseTheme {
  FluentThemeData theme(Color primaryColor);

  Color xff00ff();

  Color timeColor();

  Color secondBgColor();

  Color secondColor();

  Color pinedBgColor();

  Color unPinedBgColor();

  Color divideBgColor();

  Color defaultBgColor();

  Color userSendMessageTextColor();

  ///  fontSize 最小文字
  double fsXs = 10;

  /// fontSize sm 次要文字
  double fsSm = 12;

  /// fontSize base
  double fsBase = 14;

  /// fontSize l 小标题
  double fsL = 16;

  /// fontSize xl 标题
  double fsXl = 18;
  double fsXll = 24;
  double fsXlll = 36;

  static BaseTheme of(WidgetRef ref) {
    return ref.watch(themeProvider);
  }
}

class LightTheme extends BaseTheme {
  @override
  FluentThemeData theme(Color primaryColor) {
    return FluentThemeData(
      accentColor: primaryColor.toAccentColor(),
      visualDensity: VisualDensity.standard,
      scaffoldBackgroundColor: Colors.grey[30],
      cardColor: const Color(0xffF8F8FF),
      iconTheme: IconThemeData(color: Colors.grey[120], size: 24, opacity: 0.8),
      dividerTheme: const DividerThemeData(
        thickness: 0.5,
        horizontalMargin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Color(0Xffeef1e8),
        ),
      ),
    );
  }

  @override
  Color xff00ff() {
    return const Color(0xffff00ff);
  }

  @override
  Color secondBgColor() {
    return const Color(0Xfffcfff5);
  }

  @override
  Color secondColor() {
    return const Color(0Xff70716d);
  }

  @override
  Color userSendMessageTextColor() {
    return Colors.white;
  }

  @override
  Color pinedBgColor() {
    return const Color(0xffEDEDED);
  }

  @override
  Color unPinedBgColor() {
    return Colors.white;
  }

  @override
  Color divideBgColor() {
    return const Color(0Xffeef1e8);
  }

  @override
  Color timeColor() {
    return const Color(0xff5B5B5B);
  }

  @override
  Color defaultBgColor() {
    return Colors.white;
  }
}

class DarkTheme extends BaseTheme {
  @override
  FluentThemeData theme(Color primaryColor) {
    return FluentThemeData(
      brightness: Brightness.dark,
      accentColor: Colors.green,
      visualDensity: VisualDensity.standard,
      scaffoldBackgroundColor: Colors.grey[200],
      dividerTheme: const DividerThemeData(
        horizontalMargin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Color(0xff191919),
        ),
      ),
    );
  }

  @override
  Color xff00ff() {
    return const Color(0xff00ff00);
  }

  @override
  Color secondBgColor() {
    return const Color(0Xff1c1c1b);
  }

  @override
  Color secondColor() {
    return const Color(0Xfffcfff5);
  }

  @override
  Color userSendMessageTextColor() {
    return const Color(0xff03130A);
  }

  @override
  Color pinedBgColor() {
    return const Color(0xff202020);
  }

  @override
  Color unPinedBgColor() {
    return const Color(0xff191919);
  }

  @override
  Color divideBgColor() {
    return const Color(0xff191919);
  }

  @override
  Color timeColor() {
    return const Color(0xff5B5B5B);
  }

  @override
  Color defaultBgColor() {
    return Colors.black;
  }
}
