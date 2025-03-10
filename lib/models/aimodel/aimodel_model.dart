import 'package:annotations/src/db_annotation.dart';

import '../../base/base.dart';
import '../../constants/enums/aimodel_enum.dart';
import '../../utils/extension/extension_json_converter.dart';

part 'aimodel_model.freezed.dart';
part 'aimodel_model.g.dart';

@freezed
@JuTable(tableName: DbTables.dbModel)
class AiModel with _$AiModel {
  const factory AiModel({
    @JuColumn(primaryKey: true, type: DbType.integer) required int id,
    @JuColumn(nullable: false, unique: true) required String modelId,
    @JuColumn(nullable: false, unique: true) required String name,
    @JuColumn(nullable: false) required String avatarUrl,
    @JuColumn(nullable: false) required AimodelEnum modelType,
    @JuColumn(nullable: false) required String service,
    @JuColumn() String? serviceUrl,
    @JuColumn() String? shortName,
    @JuColumn() String? url,
    @JuColumn() String? desc,
    @JuColumn(type: DbType.date) DateTime? createTime,
    @JuColumn(type: DbType.date) DateTime? updateTime,
    int? createUserId,
    int? updateUserId,
    @JuColumn(type: DbType.bool) @BoolConverter() bool? isDelete,
    @JuColumn(type: DbType.integer) int? inputToken,
    @JuColumn(type: DbType.integer) int? outputToken,
    @JuColumn(type: DbType.real) double? inputYuan,
    @JuColumn(type: DbType.real) double? outputYuan,
    @JuColumn() String? tags,
    @JuColumn(type: DbType.integer) int? sequence,
  }) = _AiModel;
  factory AiModel.fromJson(Map<String, Object?> json) => _$AiModelFromJson(json);
  static String get tableSql => createTableSql;
}

class AiModelSort {
  String key;
  List<AiModel> models;
  AiModelSort({required this.key, required this.models});
}
