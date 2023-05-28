import 'package:JuAI/entities/content/content.dart';
import 'package:JuAI/entities/content/special.dart';
import 'package:JuAI/common/utils/http.dart';

class SpecialApi {
  // static Future<int> contentAdd(ContentAddReqEntity addReqEntity) async {
  //   var response = await HttpUtil().post('/content', data: addReqEntity.toJson());
  //   return response.data ?? 0;
  // }
  static Future<SpecialResEntity> get(int id) async {
    var response = await HttpUtil().get('/contentSpecial/$id');
    return SpecialResEntity.fromJson(response.data);
  }

  static Future<List<SpecialResEntity>> getTop() async {
    var response = await HttpUtil().get('/contentSpecial/top');
    return (response.data as Iterable).map((e) => SpecialResEntity.fromJson(e)).toList();
  }

  static Future<List<SpecialResEntity>> getMine() async {
    var response = await HttpUtil().get('/contentSpecial/mine');
    return List<SpecialResEntity>.from((response.data as Iterable).map((e) => SpecialResEntity.fromJson(e)));
  }

  static Future<int> add(SpecialReqEntity reqEntity) async {
    var response = await HttpUtil().post('/contentSpecial', data: reqEntity.toJson(), isLoading: true);
    return response.data;
  }

  static Future<List<ContentResEntity>> getSpecialContents(int id) async {
    var response = await HttpUtil().get("/contentSpecial/contents/$id");
    return List<ContentResEntity>.from((response.data as Iterable).map((e) => ContentResEntity.fromJson(e)));
  }
}
