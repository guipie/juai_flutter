// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'page_req.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PageReq _$PageReqFromJson(Map<String, dynamic> json) {
  return _PageReq.fromJson(json);
}

/// @nodoc
mixin _$PageReq {
  int get page => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  DateTime? get lastCreate => throw _privateConstructorUsedError;
  String? get searchKey => throw _privateConstructorUsedError;

  /// Serializes this PageReq to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PageReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PageReqCopyWith<PageReq> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PageReqCopyWith<$Res> {
  factory $PageReqCopyWith(PageReq value, $Res Function(PageReq) then) =
      _$PageReqCopyWithImpl<$Res, PageReq>;
  @useResult
  $Res call({int page, int pageSize, DateTime? lastCreate, String? searchKey});
}

/// @nodoc
class _$PageReqCopyWithImpl<$Res, $Val extends PageReq>
    implements $PageReqCopyWith<$Res> {
  _$PageReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PageReq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? pageSize = null,
    Object? lastCreate = freezed,
    Object? searchKey = freezed,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      lastCreate: freezed == lastCreate
          ? _value.lastCreate
          : lastCreate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      searchKey: freezed == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PageReqImplCopyWith<$Res> implements $PageReqCopyWith<$Res> {
  factory _$$PageReqImplCopyWith(
          _$PageReqImpl value, $Res Function(_$PageReqImpl) then) =
      __$$PageReqImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int page, int pageSize, DateTime? lastCreate, String? searchKey});
}

/// @nodoc
class __$$PageReqImplCopyWithImpl<$Res>
    extends _$PageReqCopyWithImpl<$Res, _$PageReqImpl>
    implements _$$PageReqImplCopyWith<$Res> {
  __$$PageReqImplCopyWithImpl(
      _$PageReqImpl _value, $Res Function(_$PageReqImpl) _then)
      : super(_value, _then);

  /// Create a copy of PageReq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? pageSize = null,
    Object? lastCreate = freezed,
    Object? searchKey = freezed,
  }) {
    return _then(_$PageReqImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      pageSize: null == pageSize
          ? _value.pageSize
          : pageSize // ignore: cast_nullable_to_non_nullable
              as int,
      lastCreate: freezed == lastCreate
          ? _value.lastCreate
          : lastCreate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      searchKey: freezed == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PageReqImpl with DiagnosticableTreeMixin implements _PageReq {
  _$PageReqImpl(
      {this.page = 1, this.pageSize = 50, this.lastCreate, this.searchKey});

  factory _$PageReqImpl.fromJson(Map<String, dynamic> json) =>
      _$$PageReqImplFromJson(json);

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int pageSize;
  @override
  final DateTime? lastCreate;
  @override
  final String? searchKey;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PageReq(page: $page, pageSize: $pageSize, lastCreate: $lastCreate, searchKey: $searchKey)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PageReq'))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('pageSize', pageSize))
      ..add(DiagnosticsProperty('lastCreate', lastCreate))
      ..add(DiagnosticsProperty('searchKey', searchKey));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PageReqImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.lastCreate, lastCreate) ||
                other.lastCreate == lastCreate) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, page, pageSize, lastCreate, searchKey);

  /// Create a copy of PageReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PageReqImplCopyWith<_$PageReqImpl> get copyWith =>
      __$$PageReqImplCopyWithImpl<_$PageReqImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PageReqImplToJson(
      this,
    );
  }
}

abstract class _PageReq implements PageReq {
  factory _PageReq(
      {final int page,
      final int pageSize,
      final DateTime? lastCreate,
      final String? searchKey}) = _$PageReqImpl;

  factory _PageReq.fromJson(Map<String, dynamic> json) = _$PageReqImpl.fromJson;

  @override
  int get page;
  @override
  int get pageSize;
  @override
  DateTime? get lastCreate;
  @override
  String? get searchKey;

  /// Create a copy of PageReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PageReqImplCopyWith<_$PageReqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
