// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'conversation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ConversationModel _$ConversationModelFromJson(Map<String, dynamic> json) {
return _ConversationModel.fromJson(json);
}

/// @nodoc
mixin _$ConversationModel {

@JuColumn(primaryKey: true, type: DbType.integer) int? get id => throw _privateConstructorUsedError;@JuColumn(nullable: false) String get title => throw _privateConstructorUsedError;@JuColumn() String? get desc => throw _privateConstructorUsedError;@JuColumn() String? get avatar => throw _privateConstructorUsedError;@JuColumn(type: DbType.date)@DateTimeConverter() DateTime? get createTime => throw _privateConstructorUsedError;@JuColumn(type: DbType.date)@DateTimeConverter() DateTime? get lastTime => throw _privateConstructorUsedError;@JuColumn() String? get draft => throw _privateConstructorUsedError;@JuColumn(type: DbType.bool)@BoolConverter() bool? get isTop => throw _privateConstructorUsedError;@JuColumn(type: DbType.integer, defaultValue: 0) int get unReadCnt => throw _privateConstructorUsedError;@JuColumn(nullable: false) ConversationEnum get type => throw _privateConstructorUsedError;@JuColumn(type: DbType.text) String? get promptJson => throw _privateConstructorUsedError;@JuColumn(type: DbType.text) String get model => throw _privateConstructorUsedError;@JuColumn(type: DbType.integer, defaultValue: 3) int get maxContext => throw _privateConstructorUsedError;@JuColumn() String? get extens => throw _privateConstructorUsedError;






/// Serializes this ConversationModel to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of ConversationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$ConversationModelCopyWith<ConversationModel> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $ConversationModelCopyWith<$Res>  {
  factory $ConversationModelCopyWith(ConversationModel value, $Res Function(ConversationModel) then) = _$ConversationModelCopyWithImpl<$Res, ConversationModel>;
@useResult
$Res call({
@JuColumn(primaryKey: true, type: DbType.integer) int? id,@JuColumn(nullable: false) String title,@JuColumn() String? desc,@JuColumn() String? avatar,@JuColumn(type: DbType.date)@DateTimeConverter() DateTime? createTime,@JuColumn(type: DbType.date)@DateTimeConverter() DateTime? lastTime,@JuColumn() String? draft,@JuColumn(type: DbType.bool)@BoolConverter() bool? isTop,@JuColumn(type: DbType.integer, defaultValue: 0) int unReadCnt,@JuColumn(nullable: false) ConversationEnum type,@JuColumn(type: DbType.text) String? promptJson,@JuColumn(type: DbType.text) String model,@JuColumn(type: DbType.integer, defaultValue: 3) int maxContext,@JuColumn() String? extens
});



}

/// @nodoc
class _$ConversationModelCopyWithImpl<$Res,$Val extends ConversationModel> implements $ConversationModelCopyWith<$Res> {
  _$ConversationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of ConversationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = null,Object? desc = freezed,Object? avatar = freezed,Object? createTime = freezed,Object? lastTime = freezed,Object? draft = freezed,Object? isTop = freezed,Object? unReadCnt = null,Object? type = null,Object? promptJson = freezed,Object? model = null,Object? maxContext = null,Object? extens = freezed,}) {
  return _then(_value.copyWith(
id: freezed == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,desc: freezed == desc ? _value.desc : desc // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _value.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,createTime: freezed == createTime ? _value.createTime : createTime // ignore: cast_nullable_to_non_nullable
as DateTime?,lastTime: freezed == lastTime ? _value.lastTime : lastTime // ignore: cast_nullable_to_non_nullable
as DateTime?,draft: freezed == draft ? _value.draft : draft // ignore: cast_nullable_to_non_nullable
as String?,isTop: freezed == isTop ? _value.isTop : isTop // ignore: cast_nullable_to_non_nullable
as bool?,unReadCnt: null == unReadCnt ? _value.unReadCnt : unReadCnt // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _value.type : type // ignore: cast_nullable_to_non_nullable
as ConversationEnum,promptJson: freezed == promptJson ? _value.promptJson : promptJson // ignore: cast_nullable_to_non_nullable
as String?,model: null == model ? _value.model : model // ignore: cast_nullable_to_non_nullable
as String,maxContext: null == maxContext ? _value.maxContext : maxContext // ignore: cast_nullable_to_non_nullable
as int,extens: freezed == extens ? _value.extens : extens // ignore: cast_nullable_to_non_nullable
as String?,
  )as $Val);
}

}


/// @nodoc
abstract class _$$ConversationModelImplCopyWith<$Res> implements $ConversationModelCopyWith<$Res> {
  factory _$$ConversationModelImplCopyWith(_$ConversationModelImpl value, $Res Function(_$ConversationModelImpl) then) = __$$ConversationModelImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
@JuColumn(primaryKey: true, type: DbType.integer) int? id,@JuColumn(nullable: false) String title,@JuColumn() String? desc,@JuColumn() String? avatar,@JuColumn(type: DbType.date)@DateTimeConverter() DateTime? createTime,@JuColumn(type: DbType.date)@DateTimeConverter() DateTime? lastTime,@JuColumn() String? draft,@JuColumn(type: DbType.bool)@BoolConverter() bool? isTop,@JuColumn(type: DbType.integer, defaultValue: 0) int unReadCnt,@JuColumn(nullable: false) ConversationEnum type,@JuColumn(type: DbType.text) String? promptJson,@JuColumn(type: DbType.text) String model,@JuColumn(type: DbType.integer, defaultValue: 3) int maxContext,@JuColumn() String? extens
});



}

/// @nodoc
class __$$ConversationModelImplCopyWithImpl<$Res> extends _$ConversationModelCopyWithImpl<$Res, _$ConversationModelImpl> implements _$$ConversationModelImplCopyWith<$Res> {
  __$$ConversationModelImplCopyWithImpl(_$ConversationModelImpl _value, $Res Function(_$ConversationModelImpl) _then)
      : super(_value, _then);


/// Create a copy of ConversationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = null,Object? desc = freezed,Object? avatar = freezed,Object? createTime = freezed,Object? lastTime = freezed,Object? draft = freezed,Object? isTop = freezed,Object? unReadCnt = null,Object? type = null,Object? promptJson = freezed,Object? model = null,Object? maxContext = null,Object? extens = freezed,}) {
  return _then(_$ConversationModelImpl(
id: freezed == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: null == title ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,desc: freezed == desc ? _value.desc : desc // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _value.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,createTime: freezed == createTime ? _value.createTime : createTime // ignore: cast_nullable_to_non_nullable
as DateTime?,lastTime: freezed == lastTime ? _value.lastTime : lastTime // ignore: cast_nullable_to_non_nullable
as DateTime?,draft: freezed == draft ? _value.draft : draft // ignore: cast_nullable_to_non_nullable
as String?,isTop: freezed == isTop ? _value.isTop : isTop // ignore: cast_nullable_to_non_nullable
as bool?,unReadCnt: null == unReadCnt ? _value.unReadCnt : unReadCnt // ignore: cast_nullable_to_non_nullable
as int,type: null == type ? _value.type : type // ignore: cast_nullable_to_non_nullable
as ConversationEnum,promptJson: freezed == promptJson ? _value.promptJson : promptJson // ignore: cast_nullable_to_non_nullable
as String?,model: null == model ? _value.model : model // ignore: cast_nullable_to_non_nullable
as String,maxContext: null == maxContext ? _value.maxContext : maxContext // ignore: cast_nullable_to_non_nullable
as int,extens: freezed == extens ? _value.extens : extens // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$ConversationModelImpl  with DiagnosticableTreeMixin implements _ConversationModel {
  const _$ConversationModelImpl({@JuColumn(primaryKey: true, type: DbType.integer) this.id, @JuColumn(nullable: false) required this.title, @JuColumn() this.desc, @JuColumn() this.avatar, @JuColumn(type: DbType.date)@DateTimeConverter() this.createTime, @JuColumn(type: DbType.date)@DateTimeConverter() this.lastTime, @JuColumn() this.draft, @JuColumn(type: DbType.bool)@BoolConverter() this.isTop, @JuColumn(type: DbType.integer, defaultValue: 0) this.unReadCnt = 0, @JuColumn(nullable: false) required this.type, @JuColumn(type: DbType.text) this.promptJson, @JuColumn(type: DbType.text) required this.model, @JuColumn(type: DbType.integer, defaultValue: 3) this.maxContext = 3, @JuColumn() this.extens});

  factory _$ConversationModelImpl.fromJson(Map<String, dynamic> json) => _$$ConversationModelImplFromJson(json);

@override@JuColumn(primaryKey: true, type: DbType.integer) final  int? id;
@override@JuColumn(nullable: false) final  String title;
@override@JuColumn() final  String? desc;
@override@JuColumn() final  String? avatar;
@override@JuColumn(type: DbType.date)@DateTimeConverter() final  DateTime? createTime;
@override@JuColumn(type: DbType.date)@DateTimeConverter() final  DateTime? lastTime;
@override@JuColumn() final  String? draft;
@override@JuColumn(type: DbType.bool)@BoolConverter() final  bool? isTop;
@override@JsonKey()@JuColumn(type: DbType.integer, defaultValue: 0) final  int unReadCnt;
@override@JuColumn(nullable: false) final  ConversationEnum type;
@override@JuColumn(type: DbType.text) final  String? promptJson;
@override@JuColumn(type: DbType.text) final  String model;
@override@JsonKey()@JuColumn(type: DbType.integer, defaultValue: 3) final  int maxContext;
@override@JuColumn() final  String? extens;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ConversationModel(id: $id, title: $title, desc: $desc, avatar: $avatar, createTime: $createTime, lastTime: $lastTime, draft: $draft, isTop: $isTop, unReadCnt: $unReadCnt, type: $type, promptJson: $promptJson, model: $model, maxContext: $maxContext, extens: $extens)';
}

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  super.debugFillProperties(properties);
  properties
    ..add(DiagnosticsProperty('type', 'ConversationModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('desc', desc))..add(DiagnosticsProperty('avatar', avatar))..add(DiagnosticsProperty('createTime', createTime))..add(DiagnosticsProperty('lastTime', lastTime))..add(DiagnosticsProperty('draft', draft))..add(DiagnosticsProperty('isTop', isTop))..add(DiagnosticsProperty('unReadCnt', unReadCnt))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('promptJson', promptJson))..add(DiagnosticsProperty('model', model))..add(DiagnosticsProperty('maxContext', maxContext))..add(DiagnosticsProperty('extens', extens));
}



/// Create a copy of ConversationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$ConversationModelImplCopyWith<_$ConversationModelImpl> get copyWith => __$$ConversationModelImplCopyWithImpl<_$ConversationModelImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$ConversationModelImplToJson(this, );
}
}


abstract class _ConversationModel implements ConversationModel {
  const factory _ConversationModel({@JuColumn(primaryKey: true, type: DbType.integer) final  int? id, @JuColumn(nullable: false) required final  String title, @JuColumn() final  String? desc, @JuColumn() final  String? avatar, @JuColumn(type: DbType.date)@DateTimeConverter() final  DateTime? createTime, @JuColumn(type: DbType.date)@DateTimeConverter() final  DateTime? lastTime, @JuColumn() final  String? draft, @JuColumn(type: DbType.bool)@BoolConverter() final  bool? isTop, @JuColumn(type: DbType.integer, defaultValue: 0) final  int unReadCnt, @JuColumn(nullable: false) required final  ConversationEnum type, @JuColumn(type: DbType.text) final  String? promptJson, @JuColumn(type: DbType.text) required final  String model, @JuColumn(type: DbType.integer, defaultValue: 3) final  int maxContext, @JuColumn() final  String? extens}) = _$ConversationModelImpl;
  

  factory _ConversationModel.fromJson(Map<String, dynamic> json) = _$ConversationModelImpl.fromJson;

@override@JuColumn(primaryKey: true, type: DbType.integer) int? get id;@override@JuColumn(nullable: false) String get title;@override@JuColumn() String? get desc;@override@JuColumn() String? get avatar;@override@JuColumn(type: DbType.date)@DateTimeConverter() DateTime? get createTime;@override@JuColumn(type: DbType.date)@DateTimeConverter() DateTime? get lastTime;@override@JuColumn() String? get draft;@override@JuColumn(type: DbType.bool)@BoolConverter() bool? get isTop;@override@JuColumn(type: DbType.integer, defaultValue: 0) int get unReadCnt;@override@JuColumn(nullable: false) ConversationEnum get type;@override@JuColumn(type: DbType.text) String? get promptJson;@override@JuColumn(type: DbType.text) String get model;@override@JuColumn(type: DbType.integer, defaultValue: 3) int get maxContext;@override@JuColumn() String? get extens;
/// Create a copy of ConversationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$ConversationModelImplCopyWith<_$ConversationModelImpl> get copyWith => throw _privateConstructorUsedError;

}
