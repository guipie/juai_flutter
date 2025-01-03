import '../../utils/extension/extension_json_converter.dart';
import '../../utils/util.dart';
import 'enum_base.dart';

enum ConversationEnum {
  chat,
  prompt,
  model,
  group,
}

enum ChatResStatusEnum implements EnumBase {
  chatting(0),
  error(1),
  success(2),
  auth(3);

  @override
  final int value;
  const ChatResStatusEnum(this.value);

  static bool isOk(ChatResStatusEnum status) {
    return status == ChatResStatusEnum.success || status == ChatResStatusEnum.chatting;
  }

  static bool isError(ChatResStatusEnum status) {
    return status == ChatResStatusEnum.error || status == ChatResStatusEnum.auth;
  }

  static ChatResStatusEnum fromJson(int json) {
    return ChatResStatusEnum.values.firstWhere((e) => e.value == json);
  }

  static int toJson(ChatResStatusEnum status) {
    return status.value;
  }
}

enum MsgTypeEnum { text, image, audio, video, file }
