// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConversationItemModel _$ConversationItemModelFromJson(
    Map<String, dynamic> json) {
  return _ConversationItemModel.fromJson(json);
}

/// @nodoc
mixin _$ConversationItemModel {
  int? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String? get desc => throw _privateConstructorUsedError;
  String? get avatar => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get createTime => throw _privateConstructorUsedError;
  @DateTimeConverter()
  DateTime? get lastTime => throw _privateConstructorUsedError;
  String? get draft => throw _privateConstructorUsedError;
  @BoolConverter()
  bool? get isTop => throw _privateConstructorUsedError;
  int get unReadCnt => throw _privateConstructorUsedError;
  ConversationEnum get type => throw _privateConstructorUsedError;
  int get relationId => throw _privateConstructorUsedError;
  String get model => throw _privateConstructorUsedError;
  String? get extens => throw _privateConstructorUsedError;

  /// Serializes this ConversationItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ConversationItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ConversationItemModelCopyWith<ConversationItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConversationItemModelCopyWith<$Res> {
  factory $ConversationItemModelCopyWith(ConversationItemModel value,
          $Res Function(ConversationItemModel) then) =
      _$ConversationItemModelCopyWithImpl<$Res, ConversationItemModel>;
  @useResult
  $Res call(
      {int? id,
      String title,
      String? desc,
      String? avatar,
      @DateTimeConverter() DateTime? createTime,
      @DateTimeConverter() DateTime? lastTime,
      String? draft,
      @BoolConverter() bool? isTop,
      int unReadCnt,
      ConversationEnum type,
      int relationId,
      String model,
      String? extens});
}

/// @nodoc
class _$ConversationItemModelCopyWithImpl<$Res,
        $Val extends ConversationItemModel>
    implements $ConversationItemModelCopyWith<$Res> {
  _$ConversationItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ConversationItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? desc = freezed,
    Object? avatar = freezed,
    Object? createTime = freezed,
    Object? lastTime = freezed,
    Object? draft = freezed,
    Object? isTop = freezed,
    Object? unReadCnt = null,
    Object? type = null,
    Object? relationId = null,
    Object? model = null,
    Object? extens = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      createTime: freezed == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastTime: freezed == lastTime
          ? _value.lastTime
          : lastTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      draft: freezed == draft
          ? _value.draft
          : draft // ignore: cast_nullable_to_non_nullable
              as String?,
      isTop: freezed == isTop
          ? _value.isTop
          : isTop // ignore: cast_nullable_to_non_nullable
              as bool?,
      unReadCnt: null == unReadCnt
          ? _value.unReadCnt
          : unReadCnt // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ConversationEnum,
      relationId: null == relationId
          ? _value.relationId
          : relationId // ignore: cast_nullable_to_non_nullable
              as int,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      extens: freezed == extens
          ? _value.extens
          : extens // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ConversationItemModelImplCopyWith<$Res>
    implements $ConversationItemModelCopyWith<$Res> {
  factory _$$ConversationItemModelImplCopyWith(
          _$ConversationItemModelImpl value,
          $Res Function(_$ConversationItemModelImpl) then) =
      __$$ConversationItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? id,
      String title,
      String? desc,
      String? avatar,
      @DateTimeConverter() DateTime? createTime,
      @DateTimeConverter() DateTime? lastTime,
      String? draft,
      @BoolConverter() bool? isTop,
      int unReadCnt,
      ConversationEnum type,
      int relationId,
      String model,
      String? extens});
}

/// @nodoc
class __$$ConversationItemModelImplCopyWithImpl<$Res>
    extends _$ConversationItemModelCopyWithImpl<$Res,
        _$ConversationItemModelImpl>
    implements _$$ConversationItemModelImplCopyWith<$Res> {
  __$$ConversationItemModelImplCopyWithImpl(_$ConversationItemModelImpl _value,
      $Res Function(_$ConversationItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ConversationItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? desc = freezed,
    Object? avatar = freezed,
    Object? createTime = freezed,
    Object? lastTime = freezed,
    Object? draft = freezed,
    Object? isTop = freezed,
    Object? unReadCnt = null,
    Object? type = null,
    Object? relationId = null,
    Object? model = null,
    Object? extens = freezed,
  }) {
    return _then(_$ConversationItemModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      desc: freezed == desc
          ? _value.desc
          : desc // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      createTime: freezed == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastTime: freezed == lastTime
          ? _value.lastTime
          : lastTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      draft: freezed == draft
          ? _value.draft
          : draft // ignore: cast_nullable_to_non_nullable
              as String?,
      isTop: freezed == isTop
          ? _value.isTop
          : isTop // ignore: cast_nullable_to_non_nullable
              as bool?,
      unReadCnt: null == unReadCnt
          ? _value.unReadCnt
          : unReadCnt // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ConversationEnum,
      relationId: null == relationId
          ? _value.relationId
          : relationId // ignore: cast_nullable_to_non_nullable
              as int,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      extens: freezed == extens
          ? _value.extens
          : extens // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ConversationItemModelImpl
    with DiagnosticableTreeMixin
    implements _ConversationItemModel {
  const _$ConversationItemModelImpl(
      {this.id,
      required this.title,
      this.desc,
      this.avatar,
      @DateTimeConverter() this.createTime,
      @DateTimeConverter() this.lastTime,
      this.draft,
      @BoolConverter() this.isTop,
      this.unReadCnt = 0,
      required this.type,
      this.relationId = 0,
      this.model = Constant.defaultModel,
      this.extens});

  factory _$ConversationItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ConversationItemModelImplFromJson(json);

  @override
  final int? id;
  @override
  final String title;
  @override
  final String? desc;
  @override
  final String? avatar;
  @override
  @DateTimeConverter()
  final DateTime? createTime;
  @override
  @DateTimeConverter()
  final DateTime? lastTime;
  @override
  final String? draft;
  @override
  @BoolConverter()
  final bool? isTop;
  @override
  @JsonKey()
  final int unReadCnt;
  @override
  final ConversationEnum type;
  @override
  @JsonKey()
  final int relationId;
  @override
  @JsonKey()
  final String model;
  @override
  final String? extens;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ConversationItemModel(id: $id, title: $title, desc: $desc, avatar: $avatar, createTime: $createTime, lastTime: $lastTime, draft: $draft, isTop: $isTop, unReadCnt: $unReadCnt, type: $type, relationId: $relationId, model: $model, extens: $extens)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ConversationItemModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('desc', desc))
      ..add(DiagnosticsProperty('avatar', avatar))
      ..add(DiagnosticsProperty('createTime', createTime))
      ..add(DiagnosticsProperty('lastTime', lastTime))
      ..add(DiagnosticsProperty('draft', draft))
      ..add(DiagnosticsProperty('isTop', isTop))
      ..add(DiagnosticsProperty('unReadCnt', unReadCnt))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('relationId', relationId))
      ..add(DiagnosticsProperty('model', model))
      ..add(DiagnosticsProperty('extens', extens));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ConversationItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.desc, desc) || other.desc == desc) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.createTime, createTime) ||
                other.createTime == createTime) &&
            (identical(other.lastTime, lastTime) ||
                other.lastTime == lastTime) &&
            (identical(other.draft, draft) || other.draft == draft) &&
            (identical(other.isTop, isTop) || other.isTop == isTop) &&
            (identical(other.unReadCnt, unReadCnt) ||
                other.unReadCnt == unReadCnt) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.relationId, relationId) ||
                other.relationId == relationId) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.extens, extens) || other.extens == extens));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      desc,
      avatar,
      createTime,
      lastTime,
      draft,
      isTop,
      unReadCnt,
      type,
      relationId,
      model,
      extens);

  /// Create a copy of ConversationItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ConversationItemModelImplCopyWith<_$ConversationItemModelImpl>
      get copyWith => __$$ConversationItemModelImplCopyWithImpl<
          _$ConversationItemModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ConversationItemModelImplToJson(
      this,
    );
  }
}

abstract class _ConversationItemModel implements ConversationItemModel {
  const factory _ConversationItemModel(
      {final int? id,
      required final String title,
      final String? desc,
      final String? avatar,
      @DateTimeConverter() final DateTime? createTime,
      @DateTimeConverter() final DateTime? lastTime,
      final String? draft,
      @BoolConverter() final bool? isTop,
      final int unReadCnt,
      required final ConversationEnum type,
      final int relationId,
      final String model,
      final String? extens}) = _$ConversationItemModelImpl;

  factory _ConversationItemModel.fromJson(Map<String, dynamic> json) =
      _$ConversationItemModelImpl.fromJson;

  @override
  int? get id;
  @override
  String get title;
  @override
  String? get desc;
  @override
  String? get avatar;
  @override
  @DateTimeConverter()
  DateTime? get createTime;
  @override
  @DateTimeConverter()
  DateTime? get lastTime;
  @override
  String? get draft;
  @override
  @BoolConverter()
  bool? get isTop;
  @override
  int get unReadCnt;
  @override
  ConversationEnum get type;
  @override
  int get relationId;
  @override
  String get model;
  @override
  String? get extens;

  /// Create a copy of ConversationItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ConversationItemModelImplCopyWith<_$ConversationItemModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
