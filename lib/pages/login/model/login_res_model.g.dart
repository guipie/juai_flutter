// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: lint_a, lint_b

part of 'login_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResModelImpl _$$LoginResModelImplFromJson(Map<String, dynamic> json) =>
    _$LoginResModelImpl(
      account: json['account'] as String?,
      nickName: json['nickName'] as String?,
      avatar: json['avatar'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      remark: json['remark'] as String?,
      sex: (json['sex'] as num?)?.toInt(),
      tokenNum: (json['tokenNum'] as num?)?.toInt(),
      payType: json['payType'] as String?,
      userId: (json['userId'] as num?)?.toInt(),
      refreshToken: json['refreshToken'] as String?,
      accessToken: json['accessToken'] as String?,
    );

Map<String, dynamic> _$$LoginResModelImplToJson(_$LoginResModelImpl instance) =>
    <String, dynamic>{
      'account': instance.account,
      'nickName': instance.nickName,
      'avatar': instance.avatar,
      'phone': instance.phone,
      'email': instance.email,
      'remark': instance.remark,
      'sex': instance.sex,
      'tokenNum': instance.tokenNum,
      'payType': instance.payType,
      'userId': instance.userId,
      'refreshToken': instance.refreshToken,
      'accessToken': instance.accessToken,
    };
