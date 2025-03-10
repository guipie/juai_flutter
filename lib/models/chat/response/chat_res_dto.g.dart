// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_a, lint_b

part of 'chat_res_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatResDtoImpl _$$ChatResDtoImplFromJson(Map<String, dynamic> json) =>
    _$ChatResDtoImpl(
      conversationId: (json['conversationId'] as num).toInt(),
      chatDbId: (json['chatDbId'] as num).toInt(),
      text: json['text'] as String?,
      role: json['role'] as String?,
      reqNum: (json['reqNum'] as num?)?.toInt(),
      resNum: (json['resNum'] as num?)?.toInt(),
      msg: json['msg'] as String?,
      status: $enumDecode(_$ChatResStatusEnumEnumMap, json['status']),
    );

Map<String, dynamic> _$$ChatResDtoImplToJson(_$ChatResDtoImpl instance) =>
    <String, dynamic>{
      'conversationId': instance.conversationId,
      'chatDbId': instance.chatDbId,
      'text': instance.text,
      'role': instance.role,
      'reqNum': instance.reqNum,
      'resNum': instance.resNum,
      'msg': instance.msg,
      'status': _$ChatResStatusEnumEnumMap[instance.status]!,
    };

const _$ChatResStatusEnumEnumMap = {
  ChatResStatusEnum.chatting: 'chatting',
  ChatResStatusEnum.error: 'error',
  ChatResStatusEnum.success: 'success',
  ChatResStatusEnum.auth: 'auth',
};
