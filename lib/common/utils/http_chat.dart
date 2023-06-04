import 'package:dart_openai/dart_openai.dart';
import 'package:JuAI/common/config.dart';

class HttpChat {
  static final HttpChat _instance = HttpChat._internal();
  factory HttpChat() {
    return _instance;
  }

  HttpChat._internal() {
    OpenAI.apiKey = SERVER_CHAT_API_KEY;
    OpenAI.baseUrl = SERVER_CHAT_PROXY_API_URL;
  }

  Stream<OpenAIStreamChatCompletionModel> chatStreamProxy(String content, {String? model}) {
    try {
      return OpenAI.instance.chat.createStream(
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
      );
    } catch (e) {
      throw Exception("初始化聊天出错$e");
    }
  }
}
