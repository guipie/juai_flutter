import '../../base/base.dart';
import '../../constants/enums/conversation_enum.dart';
import '../../utils/extension/extension_json_converter.dart';
import '../prompt/prompt_res_model.dart';

part 'conversation_model.freezed.dart';
part 'conversation_model.g.dart';

@freezed
@JuTable(tableName: DbTables.dbConversation)
class ConversationModel with _$ConversationModel {
  const factory ConversationModel({
    @JuColumn(primaryKey: true, type: DbType.integer) int? id,
    @JuColumn(nullable: false) required String title,
    @JuColumn() String? desc,
    @JuColumn() String? avatar,
    @JuColumn(type: DbType.date) @DateTimeConverter() DateTime? createTime,
    @JuColumn(type: DbType.date) @DateTimeConverter() DateTime? lastTime,
    @JuColumn() String? draft,
    @JuColumn(type: DbType.bool) @BoolConverter() bool? isTop,
    @JuColumn(type: DbType.integer, defaultValue: 0) @Default(0) int unReadCnt,
    @JuColumn(nullable: false) required ConversationEnum type,
    @JuColumn(type: DbType.text) String? promptJson,
    @JuColumn(type: DbType.text) required String model,
    @JuColumn(type: DbType.integer, defaultValue: 3) @Default(3) int maxContext,
    @JuColumn() String? extens,
  }) = _ConversationModel;
  factory ConversationModel.fromJson(Map<String, dynamic> json) => _$ConversationModelFromJson(json);
  static String get tableSql => createTableSql;
}
