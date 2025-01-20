// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_a, lint_b

part of 'aimodel_res_model.dart';

// **************************************************************************
// DBGenerator
// **************************************************************************

String get createTableSql =>
    'CREATE TABLE IF NOT EXISTS ai_model_res (  id INTEGER   PRIMARY KEY AUTOINCREMENT  ,modelId TEXT   NOT NULL   UNIQUE  ,name TEXT   NOT NULL   UNIQUE  ,avatarUrl TEXT   NOT NULL    ,modelType INTEGER  NOT NULL   ,service TEXT   NOT NULL    ,serviceUrl TEXT      ,shortName TEXT      ,url TEXT      ,desc TEXT      ,createTime TIMESTAMP      DEFAULT CURRENT_TIMESTAMP ,updateTime TIMESTAMP      DEFAULT CURRENT_TIMESTAMP ,isDelete INTEGER   CHECK(isDelete=0 OR isDelete=1),inputToken INTEGER    ,outputToken INTEGER    ,inputYuan REAL    ,outputYuan REAL    ,tags TEXT      ,sequence INTEGER    )';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiModelResImpl _$$AiModelResImplFromJson(Map<String, dynamic> json) =>
    _$AiModelResImpl(
      id: (json['id'] as num).toInt(),
      modelId: json['modelId'] as String,
      name: json['name'] as String,
      avatarUrl: json['avatarUrl'] as String,
      modelType: (json['modelType'] as num).toInt(),
      service: json['service'] as String,
      serviceUrl: json['serviceUrl'] as String?,
      shortName: json['shortName'] as String?,
      url: json['url'] as String?,
      desc: json['desc'] as String?,
      createTime: json['createTime'] == null
          ? null
          : DateTime.parse(json['createTime'] as String),
      updateTime: json['updateTime'] == null
          ? null
          : DateTime.parse(json['updateTime'] as String),
      createUserId: (json['createUserId'] as num?)?.toInt(),
      updateUserId: (json['updateUserId'] as num?)?.toInt(),
      isDelete: json['isDelete'] as bool?,
      inputToken: (json['inputToken'] as num?)?.toInt(),
      outputToken: (json['outputToken'] as num?)?.toInt(),
      inputYuan: (json['inputYuan'] as num?)?.toInt(),
      outputYuan: (json['outputYuan'] as num?)?.toInt(),
      tags: json['tags'] as String?,
      sequence: (json['sequence'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AiModelResImplToJson(_$AiModelResImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'modelId': instance.modelId,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'modelType': instance.modelType,
      'service': instance.service,
      'serviceUrl': instance.serviceUrl,
      'shortName': instance.shortName,
      'url': instance.url,
      'desc': instance.desc,
      'createTime': instance.createTime?.toIso8601String(),
      'updateTime': instance.updateTime?.toIso8601String(),
      'createUserId': instance.createUserId,
      'updateUserId': instance.updateUserId,
      'isDelete': instance.isDelete,
      'inputToken': instance.inputToken,
      'outputToken': instance.outputToken,
      'inputYuan': instance.inputYuan,
      'outputYuan': instance.outputYuan,
      'tags': instance.tags,
      'sequence': instance.sequence,
    };
