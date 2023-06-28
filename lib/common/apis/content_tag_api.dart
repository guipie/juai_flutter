import 'package:juai/common/utils/http.dart';
import 'package:juai/entities/content/content.dart';

class ContentTagApi {
  /* 话题相关接口 */
  static Future<int> contentTagAdd(String tag) async {
    var response = await HttpUtil().post('/contentTag/' + tag);
    return response.data ?? 0;
  }

  static Future<List<Map<dynamic, dynamic>>> topTags() async {
    var response = await HttpUtil().get('/contentTag/top');
    return (response.data as Iterable).map((e) => Map.from(e)).toList();
  }

  static Future<List<Map<dynamic, dynamic>>> myTags() async {
    var response = await HttpUtil().get('/contentTag/mine');
    return (response.data as Iterable).map((e) => Map.from(e)).toList();
  }

  static Future<List<ContentResEntity>> contents(String tagName) async {
    var response = await HttpUtil().get('/contentTag/contents', queryParameters: {"tagName": tagName});
    return (response.data as Iterable).map((e) => ContentResEntity.fromJson(e)).toList();
  }
}
