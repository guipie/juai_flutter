import 'package:JuAI/entities/content/content.dart';
import 'package:JuAI/common/utils/http.dart';

class ContentAPI {
  /* 内容相关接口 */
  static Future<List<ContentResEntity>> contentList({
    int? lastId,
    bool refresh = false,
  }) async {
    var response = await HttpUtil().get(
      '/content',
      queryParameters: {"lastId": lastId},
      // refresh: lastId != null,
      // cacheDisk: lastId == null,
      // cacheKey: STORAGE_INDEX_CONTENT_CACHE_KEY,
    );
    return (response.data as Iterable).map((e) => ContentResEntity.fromJson(e)).toList();
  }

  static Future<int> contentAdd(ContentAddReqEntity addReqEntity) async {
    var response = await HttpUtil().post('/content', data: addReqEntity.toJson());
    return response.data ?? 0;
  }

  static Future<ContentResEntity> contentDetail(int id) async {
    var response = await HttpUtil().get('/content/' + id.toString());
    return response.data;
  }

  static Future<bool> contentLike(int id) async {
    var response = await HttpUtil().post('/content/like/$id');
    return response.data;
  }

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
}
