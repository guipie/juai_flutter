import 'package:JuAI/common/utils/http.dart';
import 'package:JuAI/entities/api_response.dart';
import 'package:JuAI/entities/message/chat_send_req.dart';

class ChatApis {
  static Future<ApiResponse> sendChatGPT(ChatSendReqEntity chatSendReqEntity) {
    return HttpUtil().post("/ChatGPT/stream", data: chatSendReqEntity.toJson());
  }
}
