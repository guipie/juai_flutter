// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_a, lint_b

part of 'chat_req_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatReqDtoImpl _$$ChatReqDtoImplFromJson(Map<String, dynamic> json) =>
    _$ChatReqDtoImpl(
      conversationId: (json['conversationId'] as num).toInt(),
      message: json['message'] as String,
      model: json['model'] as String,
      chatDbId: (json['chatDbId'] as num?)?.toInt(),
      rolePrompt: json['rolePrompt'] as String?,
      maxContext: (json['maxContext'] as num?)?.toInt(),
      useAsyncDb: json['useAsyncDb'] as bool? ?? false,
      options: json['options'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ChatReqDtoImplToJson(_$ChatReqDtoImpl instance) =>
    <String, dynamic>{
      'conversationId': instance.conversationId,
      'message': instance.message,
      'model': instance.model,
      'chatDbId': instance.chatDbId,
      'rolePrompt': instance.rolePrompt,
      'maxContext': instance.maxContext,
      'useAsyncDb': instance.useAsyncDb,
      'options': instance.options,
    };
