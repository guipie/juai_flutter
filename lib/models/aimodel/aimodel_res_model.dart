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
    @JuColumn(name: 'id', primaryKey: true) required int id,
    @JuColumn(name: 'model_id') required String modelId,
    @JuColumn(name: 'name') required String name,
    @JuColumn(name: 'avatar_url') required String avatarUrl,
    @JuColumn(name: 'model_type') required int modelType,
    @JuColumn(name: 'service') required String service,
    @JuColumn(name: 'service_url') String? serviceUrl,
    String? shortName,
    String? url,
    String? desc,
    String? createTime,
    String? updateTime,
    int? createUserId,
    int? updateUserId,
    bool? isDelete,
    int? inputToken,
    int? outputToken,
    int? inputYuan,
    int? outputYuan,
    String? tags,
    int? sequence,
  }) = _AiModelRes;

  factory AiModelRes.fromJson(Map<String, Object?> json) => _$AiModelResFromJson(json);
}

class AiModelSort {
  String key;
  List<AiModelRes> models;
  AiModelSort({required this.key, required this.models});
}
