import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base/base.dart';
part 'prompt_res_model.freezed.dart';
part 'prompt_res_model.g.dart';

@freezed
@JuTable(tableName: DbTables.dbPrompt)
class PromptRes with _$PromptRes {
  factory PromptRes({
    @JuColumn(primaryKey: true, type: DbType.integer) @JsonKey(name: 'id') required int id,
    @JuColumn() @JsonKey(name: 'type') String? type,
    @JuColumn(nullable: false) @JsonKey(name: 'title') required String title,
    @JuColumn(nullable: false) @JsonKey(name: 'prompt') required String prompt,
    @JuColumn(type: DbType.integer) @JsonKey(name: 'maxContext') int? maxContext,
    @JuColumn() @JsonKey(name: 'promptExtend') String? promptExtend,
    @JuColumn() @JsonKey(name: 'avatar') String? avatar,
    @JuColumn() @JsonKey(name: 'file') String? file,
    @JuColumn() @JsonKey(name: 'initMessage') String? initMessage,
    @JuColumn() @JsonKey(name: 'tags') String? tags,
    @JuColumn(nullable: false) @JsonKey(name: 'model') required String model,
    @JuColumn() @JsonKey(name: 'vendor') String? vendor,
    @JuColumn() @JsonKey(name: 'category') String? category,
    @JuColumn(type: DbType.bool) @JsonKey(name: 'isGroup') bool? isGroup,
    @JuColumn(type: DbType.date) @JsonKey(name: 'createTime') DateTime? createTime,
  }) = _Prompt;
  factory PromptRes.fromJson(Map<String, dynamic> json) => _$PromptResFromJson(json);
  static String get tableSql => createTableSql;
}
