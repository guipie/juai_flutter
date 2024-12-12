// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prompt_req_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PromptReqImpl _$$PromptReqImplFromJson(Map<String, dynamic> json) =>
    _$PromptReqImpl(
      page: (json['Page'] as num?)?.toInt() ?? 1,
      pageSize: (json['PageSize'] as num?)?.toInt() ?? 10,
      lastCreate: json['LastCreate'] == null
          ? null
          : DateTime.parse(json['LastCreate'] as String),
      searchKey: json['SearchKey'] as String?,
      category: $enumDecodeNullable(
              _$PromptReqCategoryTypeEnumMap, json['Category']) ??
          PromptReqCategoryType.all,
    );

Map<String, dynamic> _$$PromptReqImplToJson(_$PromptReqImpl instance) =>
    <String, dynamic>{
      'Page': instance.page,
      'PageSize': instance.pageSize,
      'LastCreate': instance.lastCreate?.toIso8601String(),
      'SearchKey': instance.searchKey,
      'Category': _$PromptReqCategoryTypeEnumMap[instance.category]!,
    };

const _$PromptReqCategoryTypeEnumMap = {
  PromptReqCategoryType.all: 'all',
  PromptReqCategoryType.my: 'my',
  PromptReqCategoryType.collection: 'collection',
};
