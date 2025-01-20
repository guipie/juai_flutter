import 'package:annotations/src/db_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base/base.dart';

part 'aimodel_res_model.freezed.dart';
part 'aimodel_res_model.g.dart';

@freezed
@JuTable(dbName: 'ai_model_res')
class AiModelRes with _$AiModelRes {
  const factory AiModelRes({
    @JuColumn(primaryKey: true, type: ColumnType.integer) required int id,
    @JuColumn(nullable: false, unique: true) required String modelId,
    @JuColumn(nullable: false, unique: true) required String name,
    @JuColumn(nullable: false) required String avatarUrl,
    @JuColumn(nullable: false, type: ColumnType.integer) required int modelType,
    @JuColumn(nullable: false) required String service,
    @JuColumn() String? serviceUrl,
    @JuColumn() String? shortName,
    @JuColumn() String? url,
    @JuColumn() String? desc,
    @JuColumn(type: ColumnType.date) DateTime? createTime,
    @JuColumn(type: ColumnType.date) DateTime? updateTime,
    int? createUserId,
    int? updateUserId,
    @JuColumn(type: ColumnType.bool) bool? isDelete,
    @JuColumn(type: ColumnType.integer) int? inputToken,
    @JuColumn(type: ColumnType.integer) int? outputToken,
    @JuColumn(type: ColumnType.real) int? inputYuan,
    @JuColumn(type: ColumnType.real) int? outputYuan,
    @JuColumn() String? tags,
    @JuColumn(type: ColumnType.integer) int? sequence,
  }) = _AiModelRes;

  factory AiModelRes.fromJson(Map<String, Object?> json) => _$AiModelResFromJson(json);
}

class AiModelSort {
  String key;
  List<AiModelRes> models;
  AiModelSort({required this.key, required this.models});
}
