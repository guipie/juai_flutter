import '../../base/base.dart';
import '../../constants/enums/conversation_enum.dart';
import '../../utils/extension/extension_json_converter.dart';
part 'chat_item_model.freezed.dart';
part 'chat_item_model.g.dart';

@freezed
class ChatItemModel with _$ChatItemModel {
  const factory ChatItemModel({
    int? id,
    required int conversationId,
    required String sendMsg,
    required String receiveMsg,
    required MsgTypeEnum msgType,
    required int sendId,
    required int receiveId,
    String? desc,
    @DateTimeConverter() DateTime? createTime,
    @DateTimeConverter() DateTime? lastTime,
    required ConversationEnum type,
    @Default(0) int? relationId,
    @JsonKey(name: 'status', fromJson: ChatResStatusEnum.fromJson, toJson: ChatResStatusEnum.toJson) @Default(ChatResStatusEnum.error) ChatResStatusEnum status,
    String? extens,
  }) = _ChatItemModel;
  factory ChatItemModel.fromJson(Map<String, dynamic> json) => _$ChatItemModelFromJson(json);
}
