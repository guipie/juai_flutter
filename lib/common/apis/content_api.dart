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

  static Future<List<ContentResEntity>> myContentList({
    int? lastId,
    bool refresh = false,
  }) async {
    var response = await HttpUtil().get(
      '/content/mine',
      queryParameters: {"lastId": lastId},
      // refresh: lastId != null,
      // cacheDisk: lastId == null,
      // cacheKey: STORAGE_INDEX_CONTENT_CACHE_KEY,
    );
    return (response.data as Iterable).map((e) => ContentResEntity.fromJson(e)).toList();
  }

  static Future<List<ContentResEntity>> myCommentContentList({
    int? lastId,
    bool refresh = false,
  }) async {
    var response = await HttpUtil().get(
      '/content/mine/comment',
      queryParameters: {"lastId": lastId},
    );
    return (response.data as Iterable).map((e) => ContentResEntity.fromJson(e)).toList();
  }

  static Future<List<ContentResEntity>> myLikeContentList({
    int? lastId,
    bool refresh = false,
  }) async {
    var response = await HttpUtil().get(
      '/content/mine/like',
      queryParameters: {"lastId": lastId},
    );
    return (response.data as Iterable).map((e) => ContentResEntity.fromJson(e)).toList();
  }

  static Future<List<ContentResEntity>> userContentList(
    int userId, {
    String type = "all",
    int? lastId,
  }) async {
    var url = '/content/$userId';
    if (type != "all") url += "/" + type;
    var response = await HttpUtil().get(
      url,
      queryParameters: {"lastId": lastId},
    );
    return (response.data as Iterable).map((e) => ContentResEntity.fromJson(e)).toList();
  }

  static Future<int> contentAdd(ContentAddReqEntity addReqEntity) async {
    var response = await HttpUtil().post('/content', data: addReqEntity.toJson());
    return response.data ?? 0;
  }

  static Future<ContentResEntity> contentDetail(int id) async {
    var response = await HttpUtil().get('/content/detail/$id');
    return ContentResEntity.fromJson(response.data);
  }

  static Future<bool> contentLike(int id) async {
    var response = await HttpUtil().post('/content/like/$id');
    return response.data;
  }
}
