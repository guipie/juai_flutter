// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiRes<T> _$ApiResFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiRes<T>(
      (json['code'] as num).toInt(),
      json['type'] as String,
      json['message'] as String,
      fromJsonT(json['result']),
    );

Map<String, dynamic> _$ApiResToJson<T>(
  ApiRes<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'type': instance.type,
      'message': instance.message,
      'result': toJsonT(instance.result),
    };

ApiListRes<T> _$ApiListResFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiListRes<T>(
      (json['code'] as num).toInt(),
      json['type'] as String,
      json['message'] as String,
      (json['result'] as List<dynamic>).map(fromJsonT).toList(),
    );

Map<String, dynamic> _$ApiListResToJson<T>(
  ApiListRes<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'code': instance.code,
      'type': instance.type,
      'message': instance.message,
      'result': instance.result.map(toJsonT).toList(),
    };
