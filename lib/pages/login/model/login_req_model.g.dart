// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_a, lint_b

part of 'login_req_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginReqModelImpl _$$LoginReqModelImplFromJson(Map<String, dynamic> json) =>
    _$LoginReqModelImpl(
      account: json['account'] as String?,
      password: json['password'] as String?,
      code: json['code'] as String?,
      u: json['u'] as String?,
    );

Map<String, dynamic> _$$LoginReqModelImplToJson(_$LoginReqModelImpl instance) =>
    <String, dynamic>{
      'account': instance.account,
      'password': instance.password,
      'code': instance.code,
      'u': instance.u,
    };
