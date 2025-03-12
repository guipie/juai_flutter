// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_a, lint_b

part of 'prompt_req_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PromptReqImpl _$$PromptReqImplFromJson(Map<String, dynamic> json) =>
    _$PromptReqImpl(
      pageSize: (json['pageSize'] as num?)?.toInt() ?? 10,
      lastCreate: json['lastCreate'] == null
          ? null
          : DateTime.parse(json['lastCreate'] as String),
      searchKey: json['searchKey'] as String?,
      category: $enumDecodeNullable(
              _$PromptReqCategoryTypeEnumMap, json['category']) ??
          PromptReqCategoryType.all,
    );

Map<String, dynamic> _$$PromptReqImplToJson(_$PromptReqImpl instance) =>
    <String, dynamic>{
      'pageSize': instance.pageSize,
      'lastCreate': instance.lastCreate?.toIso8601String(),
      'searchKey': instance.searchKey,
      'category': _$PromptReqCategoryTypeEnumMap[instance.category],
    };

const _$PromptReqCategoryTypeEnumMap = {
  PromptReqCategoryType.all: 'all',
  PromptReqCategoryType.my: 'my',
  PromptReqCategoryType.collection: 'collection',
};
