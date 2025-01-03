// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversationItemModelImpl _$$ConversationItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ConversationItemModelImpl(
      id: (json['Id'] as num?)?.toInt(),
      title: json['Title'] as String,
      desc: json['Desc'] as String?,
      avatar: json['Avatar'] as String?,
      createTime: _$JsonConverterFromJson<String, DateTime>(
          json['CreateTime'], const DateTimeConverter().fromJson),
      lastTime: _$JsonConverterFromJson<String, DateTime>(
          json['LastTime'], const DateTimeConverter().fromJson),
      draft: json['Draft'] as String?,
      isTop: _$JsonConverterFromJson<String, bool>(
          json['IsTop'], const BoolConverter().fromJson),
      unReadCnt: (json['UnReadCnt'] as num?)?.toInt() ?? 0,
      type: $enumDecode(_$ConversationEnumEnumMap, json['Type']),
      relationId: (json['RelationId'] as num?)?.toInt() ?? 0,
      model: json['Model'] as String? ?? Constant.defaultModel,
      extens: json['Extens'] as String?,
    );

Map<String, dynamic> _$$ConversationItemModelImplToJson(
        _$ConversationItemModelImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Title': instance.title,
      'Desc': instance.desc,
      'Avatar': instance.avatar,
      'CreateTime': _$JsonConverterToJson<String, DateTime>(
          instance.createTime, const DateTimeConverter().toJson),
      'LastTime': _$JsonConverterToJson<String, DateTime>(
          instance.lastTime, const DateTimeConverter().toJson),
      'Draft': instance.draft,
      'IsTop': _$JsonConverterToJson<String, bool>(
          instance.isTop, const BoolConverter().toJson),
      'UnReadCnt': instance.unReadCnt,
      'Type': _$ConversationEnumEnumMap[instance.type]!,
      'RelationId': instance.relationId,
      'Model': instance.model,
      'Extens': instance.extens,
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
