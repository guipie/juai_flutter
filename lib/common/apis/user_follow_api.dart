import 'package:JuAI/common/utils/http.dart';
import 'package:JuAI/entities/user/user_base.dart';

class UserFollowApi {
  static Future<List<UserInfo>> getFollowUsers(int lastId) async {
    var data = await HttpUtil().post('/Follow');
    return (data.data as Iterable).map((e) => UserInfo.fromJson(e)).toList();
  }

  static Future<bool> isFollowed(int userId) async {
    var data = await HttpUtil().get('/Follow/followed/$userId');
    return data.data;
  }

  static Future<bool> followed(int userId) async {
    var data = await HttpUtil().post('/Follow/followed/$userId');
    return data.data;
  }

  static Future<UserFollowHome> getFollowUserHome(int userId) async {
    var data = await HttpUtil().get('/Follow/user/home/$userId');
    return UserFollowHome.fromJson(data.data);
  }
}
