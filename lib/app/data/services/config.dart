import 'package:get/get.dart';

/// 主要存放一些项目配置参数
/// 请求域名配置（dev、product.）
/// 主题，语言包...
class ConfigService extends GetxService {
  static ConfigService get to => Get.find();
}
