// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aimodel_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AiModel _$AiModelFromJson(Map<String, dynamic> json) => AiModel(
      modelId: json['ModelId'] as String,
      name: json['Name'] as String,
      shortName: json['ShortName'] as String,
      avatarUrl: json['AvatarUrl'] as String,
      modelType: (json['ModelType'] as num).toInt(),
      category: json['Category'] as String,
      maxToken: (json['MaxToken'] as num).toInt(),
      tags: json['Tags'] as String,
      desc: json['Desc'] as String,
      settings: json['Settings'] as String,
    );

Map<String, dynamic> _$AiModelToJson(AiModel instance) => <String, dynamic>{
      'ModelId': instance.modelId,
      'Name': instance.name,
      'ShortName': instance.shortName,
      'AvatarUrl': instance.avatarUrl,
      'ModelType': instance.modelType,
      'Category': instance.category,
      'MaxToken': instance.maxToken,
      'Tags': instance.tags,
      'Desc': instance.desc,
      'Settings': instance.settings,
    };
