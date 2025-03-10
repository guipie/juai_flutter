// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_a, lint_b

part of 'chat_model.dart';

// **************************************************************************
// DBGenerator
// **************************************************************************

String get createTableSql =>
    'CREATE TABLE IF NOT EXISTS chat (  id INTEGER   PRIMARY KEY AUTOINCREMENT  ,conversationId INTEGER  NOT NULL   ,sendMsg TEXT   NOT NULL    ,receiveMsg TEXT   NOT NULL    ,msgType TEXT   NOT NULL    ,sendId INTEGER  NOT NULL   ,receiveId INTEGER  NOT NULL   ,model TEXT   NOT NULL    ,desc TEXT      ,createTime TEXT      DEFAULT (datetime(\'now\',\'localtime\')) ,lastTime TEXT      DEFAULT (datetime(\'now\',\'localtime\')) ,type TEXT   NOT NULL    ,relationId INTEGER    ,status TEXT   NOT NULL    ,reqNum INTEGER    ,resNum INTEGER    ,contextNum INTEGER    ,extens TEXT      )';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatModelImpl _$$ChatModelImplFromJson(Map<String, dynamic> json) =>
    _$ChatModelImpl(
      id: (json['id'] as num?)?.toInt(),
      conversationId: (json['conversationId'] as num).toInt(),
      sendMsg: json['sendMsg'] as String,
      receiveMsg: json['receiveMsg'] as String,
      msgType: $enumDecode(_$MsgTypeEnumEnumMap, json['msgType']),
      sendId: (json['sendId'] as num).toInt(),
      receiveId: (json['receiveId'] as num).toInt(),
      model: json['model'] as String,
      desc: json['desc'] as String?,
      createTime: _$JsonConverterFromJson<String, DateTime>(
          json['createTime'], const DateTimeConverter().fromJson),
      lastTime: _$JsonConverterFromJson<String, DateTime>(
          json['lastTime'], const DateTimeConverter().fromJson),
      type: $enumDecode(_$ConversationEnumEnumMap, json['type']),
      relationId: (json['relationId'] as num?)?.toInt() ?? 0,
      status: $enumDecodeNullable(_$ChatResStatusEnumEnumMap, json['status']) ??
          ChatResStatusEnum.error,
      reqNum: (json['reqNum'] as num?)?.toInt() ?? 0,
      resNum: (json['resNum'] as num?)?.toInt() ?? 0,
      contextNum: (json['contextNum'] as num?)?.toInt() ?? 0,
      extens: json['extens'] as String?,
    );

Map<String, dynamic> _$$ChatModelImplToJson(_$ChatModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'conversationId': instance.conversationId,
      'sendMsg': instance.sendMsg,
      'receiveMsg': instance.receiveMsg,
      'msgType': _$MsgTypeEnumEnumMap[instance.msgType]!,
      'sendId': instance.sendId,
      'receiveId': instance.receiveId,
      'model': instance.model,
      'desc': instance.desc,
      'createTime': _$JsonConverterToJson<String, DateTime>(
          instance.createTime, const DateTimeConverter().toJson),
      'lastTime': _$JsonConverterToJson<String, DateTime>(
          instance.lastTime, const DateTimeConverter().toJson),
      'type': _$ConversationEnumEnumMap[instance.type]!,
      'relationId': instance.relationId,
      'status': _$ChatResStatusEnumEnumMap[instance.status]!,
      'reqNum': instance.reqNum,
      'resNum': instance.resNum,
      'contextNum': instance.contextNum,
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
  ConversationEnum.group: 'group',
};

const _$ChatResStatusEnumEnumMap = {
  ChatResStatusEnum.chatting: 'chatting',
  ChatResStatusEnum.error: 'error',
  ChatResStatusEnum.success: 'success',
  ChatResStatusEnum.auth: 'auth',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
