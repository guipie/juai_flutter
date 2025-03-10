import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_res_model.freezed.dart';
part 'login_res_model.g.dart';

@freezed
class LoginResModel with _$LoginResModel {
  const factory LoginResModel({
    @JsonKey(name: 'account') String? account,
    @JsonKey(name: 'nickName') String? nickName,
    @JsonKey(name: 'avatar') String? avatar,
    @JsonKey(name: 'phone') String? phone,
    @JsonKey(name: 'email') String? email,
    @JsonKey(name: 'remark') String? remark,
    @JsonKey(name: 'sex') int? sex,
    @JsonKey(name: 'tokenNum') int? tokenNum,
    @JsonKey(name: 'payType') String? payType,
    @JsonKey(name: 'userId') int? userId,
    @JsonKey(name: 'refreshToken') String? refreshToken,
    @JsonKey(name: 'accessToken') String? accessToken,
  }) = _LoginResModel;
  factory LoginResModel.fromJson(Map<String, Object?> json) => _$LoginResModelFromJson(json);
}
