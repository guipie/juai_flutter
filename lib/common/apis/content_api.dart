import 'package:guxin_ai/common/entities/categories.dart';
import 'package:guxin_ai/common/entities/channels.dart';
import 'package:guxin_ai/common/entities/content.dart';
import 'package:guxin_ai/common/entities/tags.dart';
import 'package:guxin_ai/common/utils/http.dart';
import 'package:guxin_ai/common/values/storage.dart';

class ContentAPI {
  /// 翻页
  /// refresh 是否刷新
  static Future<ContentResEntity> contentList({
    int? lastId,
    bool refresh = false,
  }) async {
    var response = await HttpUtil().get(
      '/content',
      queryParameters: {"lastId": lastId},
      refresh: refresh,
      cacheDisk: (lastId ?? 0) > 0,
      cacheKey: STORAGE_INDEX_CONTENT_CACHE_KEY,
    );
    return ContentResEntity.fromJson(response.data);
  }

  static Future<int> contentAdd(ContentAddReqEntity addReqEntity) async {
    var response = await HttpUtil().post('/content', data: addReqEntity.toJson());
    return response.data ?? 0;
  }

  static Future<int> contentTagAdd(String tag) async {
    var response = await HttpUtil().post('/contentTag/' + tag);
    return response.data ?? 0;
  }

  static Future<List<Map>> contentTags() async {
    var response = await HttpUtil().get('/contentTag');
    return List<Map>.from(response.data as Iterable);
  }

  static Future<List<Map>> contentTagsMine() async {
    var response = await HttpUtil().get('/contentTag/mine');
    return List<Map>.from((response.data) as Iterable);
  }

  /// 标签列表
  static Future<List<TagResponseEntity>> tags({
    TagRequestEntity? params,
    bool cacheDisk = false,
  }) async {
    var response = await HttpUtil().get(
      '/tags',
      queryParameters: params?.toJson(),
      cacheDisk: cacheDisk,
    );
    return response.data.map<TagResponseEntity>((item) => TagResponseEntity.fromJson(item)).toList();
  }
}
