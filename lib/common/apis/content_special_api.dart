import 'package:JuAI/entities/content/content.dart';
import 'package:JuAI/entities/content/special.dart';
import 'package:JuAI/common/utils/http.dart';
import 'package:JuAI/entities/entities.dart';
import 'package:JuAI/entities/user_base.dart';
import 'package:flutter/material.dart';

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
    var response = await HttpUtil().get("/contentSpecial/contents/$id").catchError((err) => debugPrint(err));
    return List<ContentResEntity>.from((response.data as Iterable).map((e) => ContentResEntity.fromJson(e)));
  }

  static Future<List<UserInfo>> getSpecialUsers(int id) async {
    var response = await HttpUtil().get("/contentSpecial/users/$id").catchError((err) => debugPrint(err));
    return List<UserInfo>.from((response.data as Iterable).map((e) => UserInfo.fromJson(e)));
  }

  static Future<int> getSpecialUserCnt(int id) async {
    var response = await HttpUtil().get("/contentSpecial/userCnt/$id").catchError((err) => debugPrint(err));
    return response.data;
  }

  static Future<int> joinSpecial(int id) async {
    var response = await HttpUtil().post("/contentSpecial/join/$id").catchError((err) => debugPrint(err));
    return response.data;
  }

  static Future<bool> isJoinSpecial(int id) async {
    var response = await HttpUtil().get("/contentSpecial/isJoin/$id").catchError((err) => debugPrint(err));
    return response.data;
  }
}
