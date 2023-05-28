import 'package:JuAI/entities/content/comment.dart';
import 'package:JuAI/common/utils/http.dart';

class ContentCommentApi {
  static Future<List<CommentRes>> getNewest(int contentId) async {
    var response = await HttpUtil().get('/ContentComment/Newest/$contentId');
    return (response.data as Iterable).map((e) => CommentRes.fromJson(e)).toList();
  }

  static Future<int> add(CommentReq req) async {
    var response = await HttpUtil().post('/ContentComment', data: req.toJson());
    return response.data;
  }

  static Future<bool> clike(int ccomment) async {
    var response = await HttpUtil().put('/ContentComment/like/$ccomment');
    return response.data;
  }
}
