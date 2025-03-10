import '../../base/base.dart';
import '../../constants/enums/conversation_enum.dart';
import '../../utils/extension/extension_json_converter.dart';
part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
@JuTable(tableName: DbTables.dbChat)
class ChatModel with _$ChatModel {
  const factory ChatModel(
      {@JuColumn(primaryKey: true, type: DbType.integer) int? id,
      @JuColumn(nullable: false, type: DbType.integer) required int conversationId,
      @JuColumn(nullable: false) required String sendMsg,
      @JuColumn(nullable: false) required String receiveMsg,
      @JuColumn(nullable: false) required MsgTypeEnum msgType,
      @JuColumn(nullable: false, type: DbType.integer) required int sendId,
      @JuColumn(nullable: false, type: DbType.integer) required int receiveId,
      @JuColumn(nullable: false) required String model,
      @JuColumn() String? desc,
      @JuColumn(type: DbType.date) @DateTimeConverter() DateTime? createTime,
      @JuColumn(type: DbType.date) @DateTimeConverter() DateTime? lastTime,
      @JuColumn(nullable: false) required ConversationEnum type,
      @JuColumn(type: DbType.integer) @Default(0) int? relationId,
      @JuColumn(nullable: false) @Default(ChatResStatusEnum.error) ChatResStatusEnum status,
      @JuColumn(type: DbType.integer) @Default(0) int? reqNum,
      @JuColumn(type: DbType.integer) @Default(0) int? resNum,
      @JuColumn(type: DbType.integer) @Default(0) int? contextNum,
      @JuColumn() String? extens}) = _ChatModel;
  factory ChatModel.fromJson(Map<String, dynamic> json) => _$ChatModelFromJson(json);
  static String get tableSql => createTableSql;
}
