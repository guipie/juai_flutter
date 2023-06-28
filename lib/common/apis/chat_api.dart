import 'package:juai/common/utils/http.dart';
import 'package:juai/entities/api_response.dart';
import 'package:juai/entities/message/chat_prompt.dart';
import 'package:juai/entities/message/chat_send_req.dart';
import 'package:juai/entities/message/conversation.dart';

class ChatApis {
  static Future<ApiResponse> addConversation(ConversationLast last) {
    var data = last.toJson();
    data.addEntries({"Id": last.conversationId}.entries);
    return HttpUtil().post("/ChatGPT/conversation", data: data).catchError((err) => throw Exception(err));
  }

  static Future<ApiResponse> sendChatGPT(ChatSendReqEntity chatSendReqEntity) {
    return HttpUtil().post("/ChatGPT/stream", data: chatSendReqEntity.toJson()).catchError((err) => throw Exception(err));
  }

  static Future<ApiResponse> sendChatGPTImage(ChatSendImageReqEntity chatSendImageReqEntity) {
    return HttpUtil().post("/ChatGPT/image", data: chatSendImageReqEntity.toJson()).catchError((err) => throw Exception(err));
  }

  static Future<ApiResponse> delConversation(int conversationId) {
    return HttpUtil().delete("/ChatGPT/conversation/$conversationId").catchError((err) => throw Exception(err));
  }

  static Future<List<ChatPromptEntity>> getChatPrompts() async {
    var response = await HttpUtil().get("/ChatGPT/prompts");
    return (response.data as Iterable).map((e) => ChatPromptEntity.fromJson(e)).toList();
  }
}
