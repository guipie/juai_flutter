// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_a, lint_b

part of 'aimodel_model.dart';

// **************************************************************************
// DBGenerator
// **************************************************************************

String get createTableSql =>
    'CREATE TABLE IF NOT EXISTS ai_model (  id INTEGER   PRIMARY KEY AUTOINCREMENT  ,modelId TEXT   NOT NULL   UNIQUE  ,name TEXT   NOT NULL   UNIQUE  ,avatarUrl TEXT   NOT NULL    ,modelType TEXT   NOT NULL    ,service TEXT   NOT NULL    ,serviceUrl TEXT      ,shortName TEXT      ,url TEXT      ,desc TEXT      ,createTime TEXT      DEFAULT (datetime(\'now\',\'localtime\')) ,updateTime TEXT      DEFAULT (datetime(\'now\',\'localtime\')) ,isDelete INTEGER   CHECK(isDelete=0 OR isDelete=1),inputToken INTEGER    ,outputToken INTEGER    ,inputYuan REAL    ,outputYuan REAL    ,tags TEXT      ,sequence INTEGER    )';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AiModelImpl _$$AiModelImplFromJson(Map<String, dynamic> json) =>
    _$AiModelImpl(
      id: (json['id'] as num).toInt(),
      modelId: json['modelId'] as String,
      name: json['name'] as String,
      avatarUrl: json['avatarUrl'] as String,
      modelType: $enumDecode(_$AimodelEnumEnumMap, json['modelType']),
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
      isDelete: const BoolConverter().fromJson(json['isDelete']),
      inputToken: (json['inputToken'] as num?)?.toInt(),
      outputToken: (json['outputToken'] as num?)?.toInt(),
      inputYuan: (json['inputYuan'] as num?)?.toDouble(),
      outputYuan: (json['outputYuan'] as num?)?.toDouble(),
      tags: json['tags'] as String?,
      sequence: (json['sequence'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$AiModelImplToJson(_$AiModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'modelId': instance.modelId,
      'name': instance.name,
      'avatarUrl': instance.avatarUrl,
      'modelType': _$AimodelEnumEnumMap[instance.modelType]!,
      'service': instance.service,
      'serviceUrl': instance.serviceUrl,
      'shortName': instance.shortName,
      'url': instance.url,
      'desc': instance.desc,
      'createTime': instance.createTime?.toIso8601String(),
      'updateTime': instance.updateTime?.toIso8601String(),
      'createUserId': instance.createUserId,
      'updateUserId': instance.updateUserId,
      'isDelete': const BoolConverter().toJson(instance.isDelete),
      'inputToken': instance.inputToken,
      'outputToken': instance.outputToken,
      'inputYuan': instance.inputYuan,
      'outputYuan': instance.outputYuan,
      'tags': instance.tags,
      'sequence': instance.sequence,
    };

const _$AimodelEnumEnumMap = {
  AimodelEnum.chat: 'chat',
  AimodelEnum.image: 'image',
  AimodelEnum.text: 'text',
  AimodelEnum.other: 'other',
};
