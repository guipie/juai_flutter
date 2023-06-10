import 'package:JuAI/common/utils/http.dart';
import 'package:JuAI/entities/api_response.dart';
import 'package:JuAI/entities/message/chat_prompt.dart';
import 'package:JuAI/entities/message/chat_send_req.dart';

class ChatApis {
  static Future<ApiResponse> sendChatGPT(ChatSendReqEntity chatSendReqEntity) {
    return HttpUtil().post("/ChatGPT/stream", data: chatSendReqEntity.toJson()).catchError((err) => throw Exception(err));
  }

  static Future<ApiResponse> sendChatGPTImage(ChatSendImageReqEntity chatSendImageReqEntity) {
    return HttpUtil().post("/ChatGPT/image", data: chatSendImageReqEntity.toJson()).catchError((err) => throw Exception(err));
  }

  static Future<List<ChatPromptEntity>> getChatPrompts() async {
    var response = await HttpUtil().get("/ChatGPT/prompts");
    return (response.data as Iterable).map((e) => ChatPromptEntity.fromJson(e)).toList();
  }
}
