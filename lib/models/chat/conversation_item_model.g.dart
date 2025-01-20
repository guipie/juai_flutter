// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_a, lint_b

part of 'conversation_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversationItemModelImpl _$$ConversationItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ConversationItemModelImpl(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String,
      desc: json['desc'] as String?,
      avatar: json['avatar'] as String?,
      createTime: _$JsonConverterFromJson<String, DateTime>(
          json['createTime'], const DateTimeConverter().fromJson),
      lastTime: _$JsonConverterFromJson<String, DateTime>(
          json['lastTime'], const DateTimeConverter().fromJson),
      draft: json['draft'] as String?,
      isTop: _$JsonConverterFromJson<String, bool>(
          json['isTop'], const BoolConverter().fromJson),
      unReadCnt: (json['unReadCnt'] as num?)?.toInt() ?? 0,
      type: $enumDecode(_$ConversationEnumEnumMap, json['type']),
      relationId: (json['relationId'] as num?)?.toInt() ?? 0,
      model: json['model'] as String? ?? Constant.defaultModel,
      extens: json['extens'] as String?,
    );

Map<String, dynamic> _$$ConversationItemModelImplToJson(
        _$ConversationItemModelImpl instance) =>
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
      'isTop': _$JsonConverterToJson<String, bool>(
          instance.isTop, const BoolConverter().toJson),
      'unReadCnt': instance.unReadCnt,
      'type': _$ConversationEnumEnumMap[instance.type]!,
      'relationId': instance.relationId,
      'model': instance.model,
      'extens': instance.extens,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

const _$ConversationEnumEnumMap = {
  ConversationEnum.chat: 'chat',
  ConversationEnum.prompt: 'prompt',
  ConversationEnum.model: 'model',
  ConversationEnum.group: 'group',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
