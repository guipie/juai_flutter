import 'package:freezed_annotation/freezed_annotation.dart';
part 'chat_req_dto.freezed.dart';
part 'chat_req_dto.g.dart';

@freezed
class ChatReqDto with _$ChatReqDto {
  const factory ChatReqDto({
    required int conversationId,
    required String message,
    required String model,
    int? chatDbId,
    String? rolePrompt,
    int? maxContext,
    @Default(false) bool useAsyncDb,
    Map<String, dynamic>? options,
  }) = _ChatReqDto;

  factory ChatReqDto.fromJson(Map<String, dynamic> json) => _$ChatReqDtoFromJson(json);
}
