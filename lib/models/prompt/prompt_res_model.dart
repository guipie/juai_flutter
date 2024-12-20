import 'package:freezed_annotation/freezed_annotation.dart';
part 'prompt_res_model.freezed.dart';
part 'prompt_res_model.g.dart';

@freezed
class PromptRes with _$PromptRes {
  factory PromptRes({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'type') String? type,
    @JsonKey(name: 'title') String? title,
    @JsonKey(name: 'prompt') String? prompt,
    @JsonKey(name: 'maxContext') int? maxContext,
    @JsonKey(name: 'promptExtend') String? promptExtend,
    @JsonKey(name: 'avatar') String? avatar,
    @JsonKey(name: 'file') String? file,
    @JsonKey(name: 'initMessage') String? initMessage,
    @JsonKey(name: 'tags') String? tags,
    @JsonKey(name: 'model') String? model,
    @JsonKey(name: 'vendor') String? vendor,
    @JsonKey(name: 'category') String? category,
    @JsonKey(name: 'isGroup') bool? isGroup,
    @JsonKey(name: 'createTime') DateTime? createTime,
  }) = _Prompt;

  factory PromptRes.fromJson(Map<String, dynamic> json) => _$PromptResFromJson(json);
}
