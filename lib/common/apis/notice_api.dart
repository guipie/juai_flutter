import 'package:JuAI/common/utils/http.dart';

class NoticeApis {
  static Future<List> getAllNotice() {
    return HttpUtil().get("/notice").then((value) => value.data);
  }
}
