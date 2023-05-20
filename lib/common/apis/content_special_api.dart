import 'package:guxin_ai/common/entities/content_special.dart';
import 'package:guxin_ai/common/utils/http.dart';

class ContentSpecialApi {
  // static Future<int> contentAdd(ContentAddReqEntity addReqEntity) async {
  //   var response = await HttpUtil().post('/content', data: addReqEntity.toJson());
  //   return response.data ?? 0;
  // }
  static Future<ContentSpecialResEntity> get(int id) async {
    var response = await HttpUtil().get('/contentSpecial/$id');
    return ContentSpecialResEntity.fromJson(response.data);
  }

  static Future<List<ContentSpecialResEntity>> getTop() async {
    var response = await HttpUtil().get('/contentSpecial/top');
    return (response.data as Iterable).map((e) => ContentSpecialResEntity.fromJson(e)).toList();
  }

  static Future<List<ContentSpecialResEntity>> getMine() async {
    var response = await HttpUtil().get('/contentSpecial/mine');
    return List<ContentSpecialResEntity>.from((response.data as Iterable).map((e) => ContentSpecialResEntity.fromJson(e)));
  }

  static Future<int> add(ContentSpecialReqEntity reqEntity) async {
    var response = await HttpUtil().post('/contentSpecial', data: reqEntity.toJson(), isLoading: true);
    return response.data;
  }
}
