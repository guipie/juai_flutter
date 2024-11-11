// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prompt.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PromptImpl _$$PromptImplFromJson(Map<String, dynamic> json) => _$PromptImpl(
      id: (json['id'] as num?)?.toInt(),
      type: json['type'] as String?,
      title: json['title'] as String?,
      prompt: json['prompt'] as String?,
      maxContext: (json['maxContext'] as num?)?.toInt(),
      promptExtend: json['promptExtend'] as String?,
      avatar: json['avatar'] as String?,
      file: json['file'] as String?,
      initMessage: json['initMessage'] as String?,
      tags: json['tags'] as String?,
      model: json['model'] as String?,
      vendor: json['vendor'] as String?,
      category: json['category'] as String?,
      isGroup: json['isGroup'] as bool?,
      createTime: json['createTime'] == null
          ? null
          : DateTime.parse(json['createTime'] as String),
    );

Map<String, dynamic> _$$PromptImplToJson(_$PromptImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'title': instance.title,
      'prompt': instance.prompt,
      'maxContext': instance.maxContext,
      'promptExtend': instance.promptExtend,
      'avatar': instance.avatar,
      'file': instance.file,
      'initMessage': instance.initMessage,
      'tags': instance.tags,
      'model': instance.model,
      'vendor': instance.vendor,
      'category': instance.category,
      'isGroup': instance.isGroup,
      'createTime': instance.createTime?.toIso8601String(),
    };
