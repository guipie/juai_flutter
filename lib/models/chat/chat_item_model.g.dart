// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_a, lint_b

part of 'chat_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatItemModelImpl _$$ChatItemModelImplFromJson(Map<String, dynamic> json) =>
    _$ChatItemModelImpl(
      id: (json['id'] as num?)?.toInt(),
      conversationId: (json['conversationId'] as num).toInt(),
      sendMsg: json['sendMsg'] as String,
      receiveMsg: json['receiveMsg'] as String,
      msgType: $enumDecode(_$MsgTypeEnumEnumMap, json['msgType']),
      sendId: (json['sendId'] as num).toInt(),
      receiveId: (json['receiveId'] as num).toInt(),
      desc: json['desc'] as String?,
      createTime: _$JsonConverterFromJson<String, DateTime>(
          json['createTime'], const DateTimeConverter().fromJson),
      lastTime: _$JsonConverterFromJson<String, DateTime>(
          json['lastTime'], const DateTimeConverter().fromJson),
      type: $enumDecode(_$ConversationEnumEnumMap, json['type']),
      relationId: (json['relationId'] as num?)?.toInt() ?? 0,
      status: json['status'] == null
          ? ChatResStatusEnum.error
          : ChatResStatusEnum.fromJson((json['status'] as num).toInt()),
      extens: json['extens'] as String?,
    );

Map<String, dynamic> _$$ChatItemModelImplToJson(_$ChatItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conversationId': instance.conversationId,
      'sendMsg': instance.sendMsg,
      'receiveMsg': instance.receiveMsg,
      'msgType': _$MsgTypeEnumEnumMap[instance.msgType]!,
      'sendId': instance.sendId,
      'receiveId': instance.receiveId,
      'desc': instance.desc,
      'createTime': _$JsonConverterToJson<String, DateTime>(
          instance.createTime, const DateTimeConverter().toJson),
      'lastTime': _$JsonConverterToJson<String, DateTime>(
          instance.lastTime, const DateTimeConverter().toJson),
      'type': _$ConversationEnumEnumMap[instance.type]!,
      'relationId': instance.relationId,
      'status': ChatResStatusEnum.toJson(instance.status),
      'extens': instance.extens,
    };

const _$MsgTypeEnumEnumMap = {
  MsgTypeEnum.text: 'text',
  MsgTypeEnum.image: 'image',
  MsgTypeEnum.audio: 'audio',
  MsgTypeEnum.video: 'video',
  MsgTypeEnum.file: 'file',
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
