import 'package:JuAI/common/utils/http.dart';
import 'package:JuAI/entities/message/chat_message.dart';

class NoticeApis {
  static Future<List<ChatMessageEntity>> getAllChat() async {
    var data = await HttpUtil().get("/Signalr/pull/chat").then((value) => value.data);
    return (data as Iterable).map((e) => ChatMessageEntity.fromRawJson(e)).toList();
  }

  static Future<List> getAllNotice() {
    return HttpUtil().get("/notice").then((value) => value.data);
  }
}
