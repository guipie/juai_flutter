import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../constants/enums/conversation_enum.dart';
import '../../../utils/extension/extension_json_converter.dart';
part 'chat_res_dto.freezed.dart';
part 'chat_res_dto.g.dart';

@freezed
class ChatResDto with _$ChatResDto {
  const factory ChatResDto({
    @JsonKey(name: 'conversationId') required int conversationId,
    @JsonKey(name: 'chatDbId') required int chatDbId,
    @JsonKey(name: 'text') String? text,
    @JsonKey(name: 'role') String? role,
    @JsonKey(name: 'reqNum') int? reqNum,
    @JsonKey(name: 'resNum') int? resNum,
    @JsonKey(name: 'msg') String? msg,
    @JsonKey(name: 'status', fromJson: ChatResStatusEnum.fromJson, toJson: ChatResStatusEnum.toJson) required ChatResStatusEnum status,
  }) = _ChatResDto;

  factory ChatResDto.fromJson(Map<String, Object?> json) => _$ChatResDtoFromJson(json);
}
