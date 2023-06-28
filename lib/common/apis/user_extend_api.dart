import 'package:juai/common/utils/http.dart';

class UserExtendApi {
  static Future<bool> updateInsert(Map<String, dynamic> data) async {
    var result = await HttpUtil().post('/UserExtend', data: data);
    return result.isOk;
  }

  static Future<List<dynamic>> updateInsertTag(String tag) async {
    var result = await HttpUtil().put('/UserExtend/tag', queryParameters: {"tag": tag});
    return result.data;
  }

  static Future<List<dynamic>> delTag(String tag) async {
    var result = await HttpUtil().delete('/UserExtend/tag', queryParameters: {"tag": tag});
    return result.data;
  }
}
