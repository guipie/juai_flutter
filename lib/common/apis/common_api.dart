import 'package:JuAI/common/utils/http.dart';

class CommonApis {
  static Future<bool> deleteQiniuPic(String key) {
    return HttpUtil().delete("/common/qiniu/file", queryParameters: {"key": key}).then((value) => value.isOk);
  }
}
