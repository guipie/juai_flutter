// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prompt_req_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PromptReq _$PromptReqFromJson(Map<String, dynamic> json) {
  return _PromptReq.fromJson(json);
}

/// @nodoc
mixin _$PromptReq {
  int get page => throw _privateConstructorUsedError;
  int get pageSize => throw _privateConstructorUsedError;
  DateTime? get lastCreate => throw _privateConstructorUsedError;
  String? get searchKey => throw _privateConstructorUsedError;
  PromptReqCategoryType get category => throw _privateConstructorUsedError;

  /// Serializes this PromptReq to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PromptReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromptReqCopyWith<PromptReq> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromptReqCopyWith<$Res> {
  factory $PromptReqCopyWith(PromptReq value, $Res Function(PromptReq) then) =
      _$PromptReqCopyWithImpl<$Res, PromptReq>;
  @useResult
  $Res call(
      {int page,
      int pageSize,
      DateTime? lastCreate,
      String? searchKey,
      PromptReqCategoryType category});
}

/// @nodoc
class _$PromptReqCopyWithImpl<$Res, $Val extends PromptReq>
    implements $PromptReqCopyWith<$Res> {
  _$PromptReqCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PromptReq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? pageSize = null,
    Object? lastCreate = freezed,
    Object? searchKey = freezed,
    Object? category = null,
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as PromptReqCategoryType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PromptReqImplCopyWith<$Res>
    implements $PromptReqCopyWith<$Res> {
  factory _$$PromptReqImplCopyWith(
          _$PromptReqImpl value, $Res Function(_$PromptReqImpl) then) =
      __$$PromptReqImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int page,
      int pageSize,
      DateTime? lastCreate,
      String? searchKey,
      PromptReqCategoryType category});
}

/// @nodoc
class __$$PromptReqImplCopyWithImpl<$Res>
    extends _$PromptReqCopyWithImpl<$Res, _$PromptReqImpl>
    implements _$$PromptReqImplCopyWith<$Res> {
  __$$PromptReqImplCopyWithImpl(
      _$PromptReqImpl _value, $Res Function(_$PromptReqImpl) _then)
      : super(_value, _then);

  /// Create a copy of PromptReq
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? pageSize = null,
    Object? lastCreate = freezed,
    Object? searchKey = freezed,
    Object? category = null,
  }) {
    return _then(_$PromptReqImpl(
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
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as PromptReqCategoryType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PromptReqImpl with DiagnosticableTreeMixin implements _PromptReq {
  const _$PromptReqImpl(
      {this.page = 1,
      this.pageSize = 10,
      this.lastCreate,
      this.searchKey,
      this.category = PromptReqCategoryType.all});

  factory _$PromptReqImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromptReqImplFromJson(json);

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
  @JsonKey()
  final PromptReqCategoryType category;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'PromptReq(page: $page, pageSize: $pageSize, lastCreate: $lastCreate, searchKey: $searchKey, category: $category)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'PromptReq'))
      ..add(DiagnosticsProperty('page', page))
      ..add(DiagnosticsProperty('pageSize', pageSize))
      ..add(DiagnosticsProperty('lastCreate', lastCreate))
      ..add(DiagnosticsProperty('searchKey', searchKey))
      ..add(DiagnosticsProperty('category', category));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromptReqImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.pageSize, pageSize) ||
                other.pageSize == pageSize) &&
            (identical(other.lastCreate, lastCreate) ||
                other.lastCreate == lastCreate) &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, page, pageSize, lastCreate, searchKey, category);

  /// Create a copy of PromptReq
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PromptReqImplCopyWith<_$PromptReqImpl> get copyWith =>
      __$$PromptReqImplCopyWithImpl<_$PromptReqImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PromptReqImplToJson(
      this,
    );
  }
}

abstract class _PromptReq implements PromptReq {
  const factory _PromptReq(
      {final int page,
      final int pageSize,
      final DateTime? lastCreate,
      final String? searchKey,
      final PromptReqCategoryType category}) = _$PromptReqImpl;

  factory _PromptReq.fromJson(Map<String, dynamic> json) =
      _$PromptReqImpl.fromJson;

  @override
  int get page;
  @override
  int get pageSize;
  @override
  DateTime? get lastCreate;
  @override
  String? get searchKey;
  @override
  PromptReqCategoryType get category;

  /// Create a copy of PromptReq
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PromptReqImplCopyWith<_$PromptReqImpl> get copyWith =>
      throw _privateConstructorUsedError;
}