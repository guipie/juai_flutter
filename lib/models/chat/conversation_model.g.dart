// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_a, lint_b

part of 'conversation_model.dart';

// **************************************************************************
// DBGenerator
// **************************************************************************

String get createTableSql =>
    'CREATE TABLE IF NOT EXISTS conversation (  id INTEGER   PRIMARY KEY AUTOINCREMENT  ,title TEXT   NOT NULL    ,desc TEXT      ,avatar TEXT      ,createTime TEXT      DEFAULT (datetime(\'now\',\'localtime\')) ,lastTime TEXT      DEFAULT (datetime(\'now\',\'localtime\')) ,draft TEXT      ,isTop INTEGER   CHECK(isTop=0 OR isTop=1),unReadCnt INTEGER    ,type TEXT   NOT NULL    ,promptJson TEXT      ,model TEXT      ,maxContext INTEGER    ,extens TEXT      )';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversationModelImpl _$$ConversationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ConversationModelImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String,
      desc: json['desc'] as String?,
      avatar: json['avatar'] as String?,
      createTime: _$JsonConverterFromJson<String, DateTime>(
          json['createTime'], const DateTimeConverter().fromJson),
      lastTime: _$JsonConverterFromJson<String, DateTime>(
          json['lastTime'], const DateTimeConverter().fromJson),
      draft: json['draft'] as String?,
      isTop: const BoolConverter().fromJson(json['isTop']),
      unReadCnt: (json['unReadCnt'] as num?)?.toInt() ?? 0,
      type: $enumDecode(_$ConversationEnumEnumMap, json['type']),
      promptJson: json['promptJson'] as String?,
      model: json['model'] as String,
      maxContext: (json['maxContext'] as num?)?.toInt() ?? 3,
      extens: json['extens'] as String?,
    );

Map<String, dynamic> _$$ConversationModelImplToJson(
        _$ConversationModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'desc': instance.desc,
      'avatar': instance.avatar,
      'createTime': _$JsonConverterToJson<String, DateTime>(
          instance.createTime, const DateTimeConverter().toJson),
      'lastTime': _$JsonConverterToJson<String, DateTime>(
          instance.lastTime, const DateTimeConverter().toJson),
      'draft': instance.draft,
      'isTop': const BoolConverter().toJson(instance.isTop),
      'unReadCnt': instance.unReadCnt,
      'type': _$ConversationEnumEnumMap[instance.type]!,
      'promptJson': instance.promptJson,
      'model': instance.model,
      'maxContext': instance.maxContext,
      'extens': instance.extens,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$ConversationEnumEnumMap = {
  ConversationEnum.chat: 'chat',
  ConversationEnum.group: 'group',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
