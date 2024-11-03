// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_res.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiRes<T> _$ApiResFromJson<T>(Map<String, dynamic> json) => ApiRes<T>(
      (json['code'] as num).toInt(),
      json['type'] as String,
      json['message'] as String,
      ApiRes._apiResFromJson(json['Result'] as Object),
    );
