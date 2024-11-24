import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_req_model.freezed.dart';
part 'login_req_model.g.dart';

@freezed
class LoginReqModel with _$LoginReqModel {
  const factory LoginReqModel({
    String? account,
    String? password,
    String? code,
    String? u,
  }) = _LoginReqModel;

  factory LoginReqModel.fromJson(Map<String, Object?> json) => _$LoginReqModelFromJson(json);
}
