// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ConversationModelImpl _$$ConversationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ConversationModelImpl(
      id: (json['Id'] as num?)?.toInt(),
      name: json['Name'] as String?,
      avatar: json['Avatar'] as String?,
      desc: json['Desc'] as String?,
      create: json['Create'] == null
          ? null
          : DateTime.parse(json['Create'] as String),
      lastTime: json['LastTime'] == null
          ? null
          : DateTime.parse(json['LastTime'] as String),
      isUnReadCnt: (json['IsUnReadCnt'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ConversationModelImplToJson(
        _$ConversationModelImpl instance) =>
    <String, dynamic>{
      'Id': instance.id,
      'Name': instance.name,
      'Avatar': instance.avatar,
      'Desc': instance.desc,
      'Create': instance.create?.toIso8601String(),
      'LastTime': instance.lastTime?.toIso8601String(),
      'IsUnReadCnt': instance.isUnReadCnt,
    };
