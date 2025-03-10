// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prompt_res_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PromptRes _$PromptResFromJson(Map<String, dynamic> json) {
return _Prompt.fromJson(json);
}

/// @nodoc
mixin _$PromptRes {

@JuColumn(primaryKey: true, type: DbType.integer)@JsonKey(name: 'id') int get id => throw _privateConstructorUsedError;@JuColumn()@JsonKey(name: 'type') String? get type => throw _privateConstructorUsedError;@JuColumn(nullable: false)@JsonKey(name: 'title') String get title => throw _privateConstructorUsedError;@JuColumn(nullable: false)@JsonKey(name: 'prompt') String get prompt => throw _privateConstructorUsedError;@JuColumn(type: DbType.integer)@JsonKey(name: 'maxContext') int? get maxContext => throw _privateConstructorUsedError;@JuColumn()@JsonKey(name: 'promptExtend') String? get promptExtend => throw _privateConstructorUsedError;@JuColumn()@JsonKey(name: 'avatar') String? get avatar => throw _privateConstructorUsedError;@JuColumn()@JsonKey(name: 'file') String? get file => throw _privateConstructorUsedError;@JuColumn()@JsonKey(name: 'initMessage') String? get initMessage => throw _privateConstructorUsedError;@JuColumn()@JsonKey(name: 'tags') String? get tags => throw _privateConstructorUsedError;@JuColumn(nullable: false)@JsonKey(name: 'model') String get model => throw _privateConstructorUsedError;@JuColumn()@JsonKey(name: 'vendor') String? get vendor => throw _privateConstructorUsedError;@JuColumn()@JsonKey(name: 'category') String? get category => throw _privateConstructorUsedError;@JuColumn(type: DbType.bool)@JsonKey(name: 'isGroup') bool? get isGroup => throw _privateConstructorUsedError;@JuColumn(type: DbType.date)@JsonKey(name: 'createTime') DateTime? get createTime => throw _privateConstructorUsedError;






/// Serializes this PromptRes to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of PromptRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$PromptResCopyWith<PromptRes> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $PromptResCopyWith<$Res>  {
  factory $PromptResCopyWith(PromptRes value, $Res Function(PromptRes) then) = _$PromptResCopyWithImpl<$Res, PromptRes>;
@useResult
$Res call({
@JuColumn(primaryKey: true, type: DbType.integer)@JsonKey(name: 'id') int id,@JuColumn()@JsonKey(name: 'type') String? type,@JuColumn(nullable: false)@JsonKey(name: 'title') String title,@JuColumn(nullable: false)@JsonKey(name: 'prompt') String prompt,@JuColumn(type: DbType.integer)@JsonKey(name: 'maxContext') int? maxContext,@JuColumn()@JsonKey(name: 'promptExtend') String? promptExtend,@JuColumn()@JsonKey(name: 'avatar') String? avatar,@JuColumn()@JsonKey(name: 'file') String? file,@JuColumn()@JsonKey(name: 'initMessage') String? initMessage,@JuColumn()@JsonKey(name: 'tags') String? tags,@JuColumn(nullable: false)@JsonKey(name: 'model') String model,@JuColumn()@JsonKey(name: 'vendor') String? vendor,@JuColumn()@JsonKey(name: 'category') String? category,@JuColumn(type: DbType.bool)@JsonKey(name: 'isGroup') bool? isGroup,@JuColumn(type: DbType.date)@JsonKey(name: 'createTime') DateTime? createTime
});



}

/// @nodoc
class _$PromptResCopyWithImpl<$Res,$Val extends PromptRes> implements $PromptResCopyWith<$Res> {
  _$PromptResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of PromptRes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = freezed,Object? title = null,Object? prompt = null,Object? maxContext = freezed,Object? promptExtend = freezed,Object? avatar = freezed,Object? file = freezed,Object? initMessage = freezed,Object? tags = freezed,Object? model = null,Object? vendor = freezed,Object? category = freezed,Object? isGroup = freezed,Object? createTime = freezed,}) {
  return _then(_value.copyWith(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as int,type: freezed == type ? _value.type : type // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _value.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,maxContext: freezed == maxContext ? _value.maxContext : maxContext // ignore: cast_nullable_to_non_nullable
as int?,promptExtend: freezed == promptExtend ? _value.promptExtend : promptExtend // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _value.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,file: freezed == file ? _value.file : file // ignore: cast_nullable_to_non_nullable
as String?,initMessage: freezed == initMessage ? _value.initMessage : initMessage // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _value.tags : tags // ignore: cast_nullable_to_non_nullable
as String?,model: null == model ? _value.model : model // ignore: cast_nullable_to_non_nullable
as String,vendor: freezed == vendor ? _value.vendor : vendor // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _value.category : category // ignore: cast_nullable_to_non_nullable
as String?,isGroup: freezed == isGroup ? _value.isGroup : isGroup // ignore: cast_nullable_to_non_nullable
as bool?,createTime: freezed == createTime ? _value.createTime : createTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  )as $Val);
}

}


/// @nodoc
abstract class _$$PromptImplCopyWith<$Res> implements $PromptResCopyWith<$Res> {
  factory _$$PromptImplCopyWith(_$PromptImpl value, $Res Function(_$PromptImpl) then) = __$$PromptImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
@JuColumn(primaryKey: true, type: DbType.integer)@JsonKey(name: 'id') int id,@JuColumn()@JsonKey(name: 'type') String? type,@JuColumn(nullable: false)@JsonKey(name: 'title') String title,@JuColumn(nullable: false)@JsonKey(name: 'prompt') String prompt,@JuColumn(type: DbType.integer)@JsonKey(name: 'maxContext') int? maxContext,@JuColumn()@JsonKey(name: 'promptExtend') String? promptExtend,@JuColumn()@JsonKey(name: 'avatar') String? avatar,@JuColumn()@JsonKey(name: 'file') String? file,@JuColumn()@JsonKey(name: 'initMessage') String? initMessage,@JuColumn()@JsonKey(name: 'tags') String? tags,@JuColumn(nullable: false)@JsonKey(name: 'model') String model,@JuColumn()@JsonKey(name: 'vendor') String? vendor,@JuColumn()@JsonKey(name: 'category') String? category,@JuColumn(type: DbType.bool)@JsonKey(name: 'isGroup') bool? isGroup,@JuColumn(type: DbType.date)@JsonKey(name: 'createTime') DateTime? createTime
});



}

/// @nodoc
class __$$PromptImplCopyWithImpl<$Res> extends _$PromptResCopyWithImpl<$Res, _$PromptImpl> implements _$$PromptImplCopyWith<$Res> {
  __$$PromptImplCopyWithImpl(_$PromptImpl _value, $Res Function(_$PromptImpl) _then)
      : super(_value, _then);


/// Create a copy of PromptRes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = freezed,Object? title = null,Object? prompt = null,Object? maxContext = freezed,Object? promptExtend = freezed,Object? avatar = freezed,Object? file = freezed,Object? initMessage = freezed,Object? tags = freezed,Object? model = null,Object? vendor = freezed,Object? category = freezed,Object? isGroup = freezed,Object? createTime = freezed,}) {
  return _then(_$PromptImpl(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as int,type: freezed == type ? _value.type : type // ignore: cast_nullable_to_non_nullable
as String?,title: null == title ? _value.title : title // ignore: cast_nullable_to_non_nullable
as String,prompt: null == prompt ? _value.prompt : prompt // ignore: cast_nullable_to_non_nullable
as String,maxContext: freezed == maxContext ? _value.maxContext : maxContext // ignore: cast_nullable_to_non_nullable
as int?,promptExtend: freezed == promptExtend ? _value.promptExtend : promptExtend // ignore: cast_nullable_to_non_nullable
as String?,avatar: freezed == avatar ? _value.avatar : avatar // ignore: cast_nullable_to_non_nullable
as String?,file: freezed == file ? _value.file : file // ignore: cast_nullable_to_non_nullable
as String?,initMessage: freezed == initMessage ? _value.initMessage : initMessage // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _value.tags : tags // ignore: cast_nullable_to_non_nullable
as String?,model: null == model ? _value.model : model // ignore: cast_nullable_to_non_nullable
as String,vendor: freezed == vendor ? _value.vendor : vendor // ignore: cast_nullable_to_non_nullable
as String?,category: freezed == category ? _value.category : category // ignore: cast_nullable_to_non_nullable
as String?,isGroup: freezed == isGroup ? _value.isGroup : isGroup // ignore: cast_nullable_to_non_nullable
as bool?,createTime: freezed == createTime ? _value.createTime : createTime // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$PromptImpl  with DiagnosticableTreeMixin implements _Prompt {
   _$PromptImpl({@JuColumn(primaryKey: true, type: DbType.integer)@JsonKey(name: 'id') required this.id, @JuColumn()@JsonKey(name: 'type') this.type, @JuColumn(nullable: false)@JsonKey(name: 'title') required this.title, @JuColumn(nullable: false)@JsonKey(name: 'prompt') required this.prompt, @JuColumn(type: DbType.integer)@JsonKey(name: 'maxContext') this.maxContext, @JuColumn()@JsonKey(name: 'promptExtend') this.promptExtend, @JuColumn()@JsonKey(name: 'avatar') this.avatar, @JuColumn()@JsonKey(name: 'file') this.file, @JuColumn()@JsonKey(name: 'initMessage') this.initMessage, @JuColumn()@JsonKey(name: 'tags') this.tags, @JuColumn(nullable: false)@JsonKey(name: 'model') required this.model, @JuColumn()@JsonKey(name: 'vendor') this.vendor, @JuColumn()@JsonKey(name: 'category') this.category, @JuColumn(type: DbType.bool)@JsonKey(name: 'isGroup') this.isGroup, @JuColumn(type: DbType.date)@JsonKey(name: 'createTime') this.createTime});

  factory _$PromptImpl.fromJson(Map<String, dynamic> json) => _$$PromptImplFromJson(json);

@override@JuColumn(primaryKey: true, type: DbType.integer)@JsonKey(name: 'id') final  int id;
@override@JuColumn()@JsonKey(name: 'type') final  String? type;
@override@JuColumn(nullable: false)@JsonKey(name: 'title') final  String title;
@override@JuColumn(nullable: false)@JsonKey(name: 'prompt') final  String prompt;
@override@JuColumn(type: DbType.integer)@JsonKey(name: 'maxContext') final  int? maxContext;
@override@JuColumn()@JsonKey(name: 'promptExtend') final  String? promptExtend;
@override@JuColumn()@JsonKey(name: 'avatar') final  String? avatar;
@override@JuColumn()@JsonKey(name: 'file') final  String? file;
@override@JuColumn()@JsonKey(name: 'initMessage') final  String? initMessage;
@override@JuColumn()@JsonKey(name: 'tags') final  String? tags;
@override@JuColumn(nullable: false)@JsonKey(name: 'model') final  String model;
@override@JuColumn()@JsonKey(name: 'vendor') final  String? vendor;
@override@JuColumn()@JsonKey(name: 'category') final  String? category;
@override@JuColumn(type: DbType.bool)@JsonKey(name: 'isGroup') final  bool? isGroup;
@override@JuColumn(type: DbType.date)@JsonKey(name: 'createTime') final  DateTime? createTime;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'PromptRes(id: $id, type: $type, title: $title, prompt: $prompt, maxContext: $maxContext, promptExtend: $promptExtend, avatar: $avatar, file: $file, initMessage: $initMessage, tags: $tags, model: $model, vendor: $vendor, category: $category, isGroup: $isGroup, createTime: $createTime)';
}

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  super.debugFillProperties(properties);
  properties
    ..add(DiagnosticsProperty('type', 'PromptRes'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('prompt', prompt))..add(DiagnosticsProperty('maxContext', maxContext))..add(DiagnosticsProperty('promptExtend', promptExtend))..add(DiagnosticsProperty('avatar', avatar))..add(DiagnosticsProperty('file', file))..add(DiagnosticsProperty('initMessage', initMessage))..add(DiagnosticsProperty('tags', tags))..add(DiagnosticsProperty('model', model))..add(DiagnosticsProperty('vendor', vendor))..add(DiagnosticsProperty('category', category))..add(DiagnosticsProperty('isGroup', isGroup))..add(DiagnosticsProperty('createTime', createTime));
}



/// Create a copy of PromptRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$PromptImplCopyWith<_$PromptImpl> get copyWith => __$$PromptImplCopyWithImpl<_$PromptImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$PromptImplToJson(this, );
}
}


abstract class _Prompt implements PromptRes {
   factory _Prompt({@JuColumn(primaryKey: true, type: DbType.integer)@JsonKey(name: 'id') required final  int id, @JuColumn()@JsonKey(name: 'type') final  String? type, @JuColumn(nullable: false)@JsonKey(name: 'title') required final  String title, @JuColumn(nullable: false)@JsonKey(name: 'prompt') required final  String prompt, @JuColumn(type: DbType.integer)@JsonKey(name: 'maxContext') final  int? maxContext, @JuColumn()@JsonKey(name: 'promptExtend') final  String? promptExtend, @JuColumn()@JsonKey(name: 'avatar') final  String? avatar, @JuColumn()@JsonKey(name: 'file') final  String? file, @JuColumn()@JsonKey(name: 'initMessage') final  String? initMessage, @JuColumn()@JsonKey(name: 'tags') final  String? tags, @JuColumn(nullable: false)@JsonKey(name: 'model') required final  String model, @JuColumn()@JsonKey(name: 'vendor') final  String? vendor, @JuColumn()@JsonKey(name: 'category') final  String? category, @JuColumn(type: DbType.bool)@JsonKey(name: 'isGroup') final  bool? isGroup, @JuColumn(type: DbType.date)@JsonKey(name: 'createTime') final  DateTime? createTime}) = _$PromptImpl;
  

  factory _Prompt.fromJson(Map<String, dynamic> json) = _$PromptImpl.fromJson;

@override@JuColumn(primaryKey: true, type: DbType.integer)@JsonKey(name: 'id') int get id;@override@JuColumn()@JsonKey(name: 'type') String? get type;@override@JuColumn(nullable: false)@JsonKey(name: 'title') String get title;@override@JuColumn(nullable: false)@JsonKey(name: 'prompt') String get prompt;@override@JuColumn(type: DbType.integer)@JsonKey(name: 'maxContext') int? get maxContext;@override@JuColumn()@JsonKey(name: 'promptExtend') String? get promptExtend;@override@JuColumn()@JsonKey(name: 'avatar') String? get avatar;@override@JuColumn()@JsonKey(name: 'file') String? get file;@override@JuColumn()@JsonKey(name: 'initMessage') String? get initMessage;@override@JuColumn()@JsonKey(name: 'tags') String? get tags;@override@JuColumn(nullable: false)@JsonKey(name: 'model') String get model;@override@JuColumn()@JsonKey(name: 'vendor') String? get vendor;@override@JuColumn()@JsonKey(name: 'category') String? get category;@override@JuColumn(type: DbType.bool)@JsonKey(name: 'isGroup') bool? get isGroup;@override@JuColumn(type: DbType.date)@JsonKey(name: 'createTime') DateTime? get createTime;
/// Create a copy of PromptRes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$PromptImplCopyWith<_$PromptImpl> get copyWith => throw _privateConstructorUsedError;

}
