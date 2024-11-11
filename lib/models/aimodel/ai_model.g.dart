// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ai_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiModel _$AiModelFromJson(Map<String, dynamic> json) => AiModel(
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

Map<String, dynamic> _$AiModelToJson(AiModel instance) => <String, dynamic>{
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
