// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'page_req.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PageReqImpl _$$PageReqImplFromJson(Map<String, dynamic> json) =>
    _$PageReqImpl(
      page: (json['Page'] as num?)?.toInt() ?? 1,
      pageSize: (json['PageSize'] as num?)?.toInt() ?? 50,
      lastCreate: json['LastCreate'] == null
          ? null
          : DateTime.parse(json['LastCreate'] as String),
      searchKey: json['SearchKey'] as String?,
    );

Map<String, dynamic> _$$PageReqImplToJson(_$PageReqImpl instance) =>
    <String, dynamic>{
      'Page': instance.page,
      'PageSize': instance.pageSize,
      'LastCreate': instance.lastCreate?.toIso8601String(),
      'SearchKey': instance.searchKey,
    };
