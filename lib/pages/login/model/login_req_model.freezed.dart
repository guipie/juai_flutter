// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_req_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginReqModel _$LoginReqModelFromJson(Map<String, dynamic> json) {
  return _LoginReqModel.fromJson(json);
}

/// @nodoc
mixin _$LoginReqModel {
  String? get account => throw _privateConstructorUsedError;
  String? get password => throw _privateConstructorUsedError;
  String? get code => throw _privateConstructorUsedError;
  String? get u => throw _privateConstructorUsedError;

  /// Serializes this LoginReqModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LoginReqModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LoginReqModelCopyWith<LoginReqModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginReqModelCopyWith<$Res> {
  factory $LoginReqModelCopyWith(
          LoginReqModel value, $Res Function(LoginReqModel) then) =
      _$LoginReqModelCopyWithImpl<$Res, LoginReqModel>;
  @useResult
  $Res call({String? account, String? password, String? code, String? u});
}

/// @nodoc
class _$LoginReqModelCopyWithImpl<$Res, $Val extends LoginReqModel>
    implements $LoginReqModelCopyWith<$Res> {
  _$LoginReqModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LoginReqModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = freezed,
    Object? password = freezed,
    Object? code = freezed,
    Object? u = freezed,
  }) {
    return _then(_value.copyWith(
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      u: freezed == u
          ? _value.u
          : u // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginReqModelImplCopyWith<$Res>
    implements $LoginReqModelCopyWith<$Res> {
  factory _$$LoginReqModelImplCopyWith(
          _$LoginReqModelImpl value, $Res Function(_$LoginReqModelImpl) then) =
      __$$LoginReqModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? account, String? password, String? code, String? u});
}

/// @nodoc
class __$$LoginReqModelImplCopyWithImpl<$Res>
    extends _$LoginReqModelCopyWithImpl<$Res, _$LoginReqModelImpl>
    implements _$$LoginReqModelImplCopyWith<$Res> {
  __$$LoginReqModelImplCopyWithImpl(
      _$LoginReqModelImpl _value, $Res Function(_$LoginReqModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of LoginReqModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? account = freezed,
    Object? password = freezed,
    Object? code = freezed,
    Object? u = freezed,
  }) {
    return _then(_$LoginReqModelImpl(
      account: freezed == account
          ? _value.account
          : account // ignore: cast_nullable_to_non_nullable
              as String?,
      password: freezed == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String?,
      code: freezed == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String?,
      u: freezed == u
          ? _value.u
          : u // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginReqModelImpl implements _LoginReqModel {
  const _$LoginReqModelImpl({this.account, this.password, this.code, this.u});

  factory _$LoginReqModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginReqModelImplFromJson(json);

  @override
  final String? account;
  @override
  final String? password;
  @override
  final String? code;
  @override
  final String? u;

  @override
  String toString() {
    return 'LoginReqModel(account: $account, password: $password, code: $code, u: $u)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginReqModelImpl &&
            (identical(other.account, account) || other.account == account) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.code, code) || other.code == code) &&
            (identical(other.u, u) || other.u == u));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, account, password, code, u);

  /// Create a copy of LoginReqModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginReqModelImplCopyWith<_$LoginReqModelImpl> get copyWith =>
      __$$LoginReqModelImplCopyWithImpl<_$LoginReqModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginReqModelImplToJson(
      this,
    );
  }
}

abstract class _LoginReqModel implements LoginReqModel {
  const factory _LoginReqModel(
      {final String? account,
      final String? password,
      final String? code,
      final String? u}) = _$LoginReqModelImpl;

  factory _LoginReqModel.fromJson(Map<String, dynamic> json) =
      _$LoginReqModelImpl.fromJson;

  @override
  String? get account;
  @override
  String? get password;
  @override
  String? get code;
  @override
  String? get u;

  /// Create a copy of LoginReqModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoginReqModelImplCopyWith<_$LoginReqModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
