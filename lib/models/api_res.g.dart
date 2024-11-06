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
      (json['Code'] as num).toInt(),
      json['Type'] as String,
      json['Message'] as String,
      _$nullableGenericFromJson(json['Result'], fromJsonT),
      json['Extras'],
      DateTime.parse(json['Time'] as String),
    );

Map<String, dynamic> _$ApiResToJson<T>(
  ApiRes<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'Code': instance.code,
      'Type': instance.type,
      'Message': instance.message,
      'Extras': instance.extras,
      'Time': instance.time.toIso8601String(),
      'Result': _$nullableGenericToJson(instance.result, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
