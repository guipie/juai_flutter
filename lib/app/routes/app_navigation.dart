import 'package:get/get.dart';

class JuRoute {
  JuRoute._();

  /// 打开新页面
  static Future<T?> push<T>(
    /// 页面路径
    String path, {
    /// 参数
    Map<String, String>? parameters,

    /// arguments
    dynamic arguments,
    bool preventDuplicates = true,
  }) async {
    // 整理参数
    // 输出URL
    return Get.toNamed<T>(
      path,
      parameters: parameters,
      arguments: arguments,
      preventDuplicates: preventDuplicates,
    );
  }

  /// offAndToNamed
  static Future<T?> offAndToNamed<T>(
    String path, {
    Map<String, String>? parameters,
    dynamic arguments,
  }) async {
    // 整理参数
    // 输出URL
    return Get.offAndToNamed<T>(
      path,
      parameters: parameters,
      arguments: arguments,
    );
  }

  static Future<T?> offAllToNamed<T>(
    String path, {
    Map<String, String>? parameters,
    dynamic arguments,
  }) async {
    // 整理参数
    // 输出URL
    return Get.offAllNamed<T>(
      path,
      parameters: parameters,
      arguments: arguments,
    );
  }

  /// 打开新页面，参数是页面实例
  static Future<T?>? to<T>(
    dynamic page, {
    dynamic arguments,
    Bindings? binding,
    bool preventDuplicates = true,
  }) {
    return Get.to<T>(
      page,
      arguments: arguments,
      binding: binding,
      preventDuplicates: preventDuplicates,
      transition: Transition.cupertino,
    );
  }

  static void back<T>({
    T? result,
    closeOverlays = false,
  }) {
    Get.back<T>(
      result: result,
      closeOverlays: closeOverlays,
    );
  }

  static void until<T>(
    String rootName,
  ) {
    Get.until((route) => Get.currentRoute == rootName);
  }
}
