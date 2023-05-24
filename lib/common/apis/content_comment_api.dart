import 'package:guxin_ai/entities/content/comment.dart';
import 'package:guxin_ai/common/utils/http.dart';

class ContentCommentApi {
  static Future<List<CommentRes>> getNewest(int contentId) async {
    var response = await HttpUtil().get('/ContentComment/Newest/$contentId');
    return (response.data as Iterable).map((e) => CommentRes.fromJson(e)).toList();
  }

  static Future<int> add(CommentReq req) async {
    var response = await HttpUtil().post('/ContentComment', data: req.toJson());
    return response.data;
  }
}
