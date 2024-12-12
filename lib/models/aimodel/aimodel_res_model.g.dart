// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aimodel_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiModelRes _$AiModelResFromJson(Map<String, dynamic> json) => AiModelRes(
      id: (json['id'] as num).toInt(),
      modelId: json['modelId'] as String,
      name: json['name'] as String,
      shortName: json['shortName'] as String,
      avatarUrl: json['avatarUrl'] as String,
      modelType: (json['modelType'] as num).toInt(),
      category: json['category'] as String,
      maxToken: (json['maxToken'] as num).toInt(),
      tags: json['tags'] as String?,
      desc: json['desc'] as String?,
      settings: json['settings'] as String?,
    );

Map<String, dynamic> _$AiModelResToJson(AiModelRes instance) =>
    <String, dynamic>{
      'id': instance.id,
      'modelId': instance.modelId,
      'name': instance.name,
      'shortName': instance.shortName,
      'avatarUrl': instance.avatarUrl,
      'modelType': instance.modelType,
      'category': instance.category,
      'maxToken': instance.maxToken,
      'tags': instance.tags,
      'desc': instance.desc,
      'settings': instance.settings,
    };
