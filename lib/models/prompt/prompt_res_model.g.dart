// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_a, lint_b

part of 'prompt_res_model.dart';

// **************************************************************************
// DBGenerator
// **************************************************************************

String get createTableSql =>
    'CREATE TABLE IF NOT EXISTS prompt (  id INTEGER   PRIMARY KEY AUTOINCREMENT  ,type TEXT      ,title TEXT   NOT NULL    ,prompt TEXT   NOT NULL    ,maxContext INTEGER    ,promptExtend TEXT      ,avatar TEXT      ,file TEXT      ,initMessage TEXT      ,tags TEXT      ,model TEXT   NOT NULL    ,vendor TEXT      ,category TEXT      ,isGroup INTEGER   CHECK(isGroup=0 OR isGroup=1),createTime TEXT      DEFAULT (datetime(\'now\',\'localtime\')) )';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PromptImpl _$$PromptImplFromJson(Map<String, dynamic> json) => _$PromptImpl(
      id: (json['id'] as num).toInt(),
      type: json['type'] as String?,
      title: json['title'] as String,
      prompt: json['prompt'] as String,
      maxContext: (json['maxContext'] as num?)?.toInt(),
      promptExtend: json['promptExtend'] as String?,
      avatar: json['avatar'] as String?,
      file: json['file'] as String?,
      initMessage: json['initMessage'] as String?,
      tags: json['tags'] as String?,
      model: json['model'] as String,
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
