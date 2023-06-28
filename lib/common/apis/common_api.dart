import 'dart:convert';

import 'package:juai/common/utils/http.dart';

class CommonApis {
  static Future<bool> deleteQiniuPic(String key) {
    return HttpUtil().delete("/common/qiniu/file", queryParameters: {"key": key}).then((value) => value.isOk);
  }

  static Future<bool> addSuggestions(String contents, {List<String>? files}) {
    return HttpUtil().post("/common/suggestions", data: jsonEncode({"Suggestion": contents, "Files": files?.toString()}), isLoading: true).then((value) => value.isOk);
  }
}
