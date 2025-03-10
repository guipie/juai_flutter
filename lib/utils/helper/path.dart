import 'package:path_provider/path_provider.dart';

import '../../base/base.dart';

class PathHelper {
  late final String cachePath;
  late final String documentsPath;
  late final String supportPath;

  init() async {
    try {
      cachePath = (await getApplicationCacheDirectory()).path.replaceAll('\\', '/');
    } catch (e) {
      cachePath = '';
    }

    try {
      documentsPath = (await getApplicationDocumentsDirectory()).path.replaceAll('\\', '/');
    } catch (e) {
      documentsPath = '';
    }

    try {
      supportPath = (await getApplicationSupportDirectory()).path.replaceAll('\\', '/');
    } catch (e) {
      supportPath = '';
    }
    // 确保 .juai 目录存在
    try {
      await Directory(getHomePath).create(recursive: true);
    } catch (e) {
      ('创建 $getHomePath 目录失败: $e').e();
    }
  }

  String get getHomePath {
    if (Platform.isMacOS || Platform.isLinux) {
      return '${Platform.environment['HOME'] ?? ''}/.juai'.replaceAll('\\', '/');
    } else if (Platform.isWindows) {
      return '${Platform.environment['UserProfile'] ?? ''}/.juai'.replaceAll('\\', '/');
    } else if (F.mobile) {
      return '$documentsPath/.juai'.replaceAll('\\', '/');
    }

    return '.juai';
  }

  String get getLogfilePath {
    return '$getHomePath/juai.log';
  }

  String get getCachePath {
    return getHomePath;
  }

  /// 单例
  static final PathHelper _instance = PathHelper._internal();
  PathHelper._internal();

  factory PathHelper() {
    return _instance;
  }

  Map<String, String> toMap() {
    return {
      'cachePath': cachePath,
      'cachePathReal': getCachePath,
      'documentsPath': documentsPath,
      'supportPath': supportPath,
      'homePath': getHomePath,
      'logfilePath': getLogfilePath,
    };
  }
}
