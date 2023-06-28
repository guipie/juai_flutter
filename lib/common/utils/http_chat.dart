import 'package:juai/common/utils/loading.dart';
import 'package:dart_openai/dart_openai.dart';
import 'package:juai/common/config.dart';
import 'package:flutter/foundation.dart';

class HttpChat {
  static final HttpChat _instance = HttpChat._internal();
  factory HttpChat() {
    return _instance;
  }
  HttpChat._internal() {
    OpenAI.apiKey = SERVER_CHAT_API_KEY;
    OpenAI.baseUrl = SERVER_CHAT_PROXY_API_URL;
    debugPrint("OpenAI.baseUrl:$SERVER_CHAT_PROXY_API_URL");
  }

  Stream<OpenAIStreamChatCompletionModel> chatStreamProxy(String content, {String? model}) {
    try {
      return OpenAI.instance.chat
          .createStream(
            model: model ?? "gpt-3.5-turbo",
            messages: [
              const OpenAIChatCompletionChoiceMessageModel(
                content: "You are ChatGPT, a large language model trained by OpenAI. Follow the user's instructions carefully. Respond using markdown.",
                role: OpenAIChatMessageRole.system,
              ),
              OpenAIChatCompletionChoiceMessageModel(
                content: content,
                role: OpenAIChatMessageRole.user,
              )
            ],
            maxTokens: 1000,
            temperature: 0.8,
            topP: 1,
          )
          .handleError((e) => Loading.error("出错了($e)，紧急升级修复中"));
    } on RequestFailedException catch (e) {
      throw Exception("请求出错:${e.message}【${e.statusCode}】");
    } catch (e) {
      throw Exception("初始化聊天出错$e");
    }
  }

  Future<OpenAIImageModel> chatImageProxy(String content, {int n = 1, OpenAIImageSize size = OpenAIImageSize.size512}) {
    try {
      return OpenAI.instance.image.create(
        prompt: content,
        n: 1,
        size: size,
        responseFormat: OpenAIImageResponseFormat.url,
      );
    } catch (e) {
      throw Exception("初始化聊天出错$e");
    }
  }
}
