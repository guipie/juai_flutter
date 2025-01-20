// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'aimodel_res_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AiModelRes _$AiModelResFromJson(Map<String, dynamic> json) {
return _AiModelRes.fromJson(json);
}

/// @nodoc
mixin _$AiModelRes {

@JuColumn(name: 'id', primaryKey: true) int get id => throw _privateConstructorUsedError;@JuColumn(name: 'model_id') String get modelId => throw _privateConstructorUsedError;@JuColumn(name: 'name') String get name => throw _privateConstructorUsedError;@JuColumn(name: 'avatar_url') String get avatarUrl => throw _privateConstructorUsedError;@JuColumn(name: 'model_type') int get modelType => throw _privateConstructorUsedError;@JuColumn(name: 'service') String get service => throw _privateConstructorUsedError;@JuColumn(name: 'service_url') String? get serviceUrl => throw _privateConstructorUsedError; String? get shortName => throw _privateConstructorUsedError; String? get url => throw _privateConstructorUsedError; String? get desc => throw _privateConstructorUsedError; String? get createTime => throw _privateConstructorUsedError; String? get updateTime => throw _privateConstructorUsedError; int? get createUserId => throw _privateConstructorUsedError; int? get updateUserId => throw _privateConstructorUsedError; bool? get isDelete => throw _privateConstructorUsedError; int? get inputToken => throw _privateConstructorUsedError; int? get outputToken => throw _privateConstructorUsedError; int? get inputYuan => throw _privateConstructorUsedError; int? get outputYuan => throw _privateConstructorUsedError; String? get tags => throw _privateConstructorUsedError; int? get sequence => throw _privateConstructorUsedError;






/// Serializes this AiModelRes to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of AiModelRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$AiModelResCopyWith<AiModelRes> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $AiModelResCopyWith<$Res>  {
  factory $AiModelResCopyWith(AiModelRes value, $Res Function(AiModelRes) then) = _$AiModelResCopyWithImpl<$Res, AiModelRes>;
@useResult
$Res call({
@JuColumn(name: 'id', primaryKey: true) int id,@JuColumn(name: 'model_id') String modelId,@JuColumn(name: 'name') String name,@JuColumn(name: 'avatar_url') String avatarUrl,@JuColumn(name: 'model_type') int modelType,@JuColumn(name: 'service') String service,@JuColumn(name: 'service_url') String? serviceUrl, String? shortName, String? url, String? desc, String? createTime, String? updateTime, int? createUserId, int? updateUserId, bool? isDelete, int? inputToken, int? outputToken, int? inputYuan, int? outputYuan, String? tags, int? sequence
});



}

/// @nodoc
class _$AiModelResCopyWithImpl<$Res,$Val extends AiModelRes> implements $AiModelResCopyWith<$Res> {
  _$AiModelResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of AiModelRes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? modelId = null,Object? name = null,Object? avatarUrl = null,Object? modelType = null,Object? service = null,Object? serviceUrl = freezed,Object? shortName = freezed,Object? url = freezed,Object? desc = freezed,Object? createTime = freezed,Object? updateTime = freezed,Object? createUserId = freezed,Object? updateUserId = freezed,Object? isDelete = freezed,Object? inputToken = freezed,Object? outputToken = freezed,Object? inputYuan = freezed,Object? outputYuan = freezed,Object? tags = freezed,Object? sequence = freezed,}) {
  return _then(_value.copyWith(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as int,modelId: null == modelId ? _value.modelId : modelId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _value.name : name // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _value.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,modelType: null == modelType ? _value.modelType : modelType // ignore: cast_nullable_to_non_nullable
as int,service: null == service ? _value.service : service // ignore: cast_nullable_to_non_nullable
as String,serviceUrl: freezed == serviceUrl ? _value.serviceUrl : serviceUrl // ignore: cast_nullable_to_non_nullable
as String?,shortName: freezed == shortName ? _value.shortName : shortName // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _value.url : url // ignore: cast_nullable_to_non_nullable
as String?,desc: freezed == desc ? _value.desc : desc // ignore: cast_nullable_to_non_nullable
as String?,createTime: freezed == createTime ? _value.createTime : createTime // ignore: cast_nullable_to_non_nullable
as String?,updateTime: freezed == updateTime ? _value.updateTime : updateTime // ignore: cast_nullable_to_non_nullable
as String?,createUserId: freezed == createUserId ? _value.createUserId : createUserId // ignore: cast_nullable_to_non_nullable
as int?,updateUserId: freezed == updateUserId ? _value.updateUserId : updateUserId // ignore: cast_nullable_to_non_nullable
as int?,isDelete: freezed == isDelete ? _value.isDelete : isDelete // ignore: cast_nullable_to_non_nullable
as bool?,inputToken: freezed == inputToken ? _value.inputToken : inputToken // ignore: cast_nullable_to_non_nullable
as int?,outputToken: freezed == outputToken ? _value.outputToken : outputToken // ignore: cast_nullable_to_non_nullable
as int?,inputYuan: freezed == inputYuan ? _value.inputYuan : inputYuan // ignore: cast_nullable_to_non_nullable
as int?,outputYuan: freezed == outputYuan ? _value.outputYuan : outputYuan // ignore: cast_nullable_to_non_nullable
as int?,tags: freezed == tags ? _value.tags : tags // ignore: cast_nullable_to_non_nullable
as String?,sequence: freezed == sequence ? _value.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int?,
  )as $Val);
}

}


/// @nodoc
abstract class _$$AiModelResImplCopyWith<$Res> implements $AiModelResCopyWith<$Res> {
  factory _$$AiModelResImplCopyWith(_$AiModelResImpl value, $Res Function(_$AiModelResImpl) then) = __$$AiModelResImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
@JuColumn(name: 'id', primaryKey: true) int id,@JuColumn(name: 'model_id') String modelId,@JuColumn(name: 'name') String name,@JuColumn(name: 'avatar_url') String avatarUrl,@JuColumn(name: 'model_type') int modelType,@JuColumn(name: 'service') String service,@JuColumn(name: 'service_url') String? serviceUrl, String? shortName, String? url, String? desc, String? createTime, String? updateTime, int? createUserId, int? updateUserId, bool? isDelete, int? inputToken, int? outputToken, int? inputYuan, int? outputYuan, String? tags, int? sequence
});



}

/// @nodoc
class __$$AiModelResImplCopyWithImpl<$Res> extends _$AiModelResCopyWithImpl<$Res, _$AiModelResImpl> implements _$$AiModelResImplCopyWith<$Res> {
  __$$AiModelResImplCopyWithImpl(_$AiModelResImpl _value, $Res Function(_$AiModelResImpl) _then)
      : super(_value, _then);


/// Create a copy of AiModelRes
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? modelId = null,Object? name = null,Object? avatarUrl = null,Object? modelType = null,Object? service = null,Object? serviceUrl = freezed,Object? shortName = freezed,Object? url = freezed,Object? desc = freezed,Object? createTime = freezed,Object? updateTime = freezed,Object? createUserId = freezed,Object? updateUserId = freezed,Object? isDelete = freezed,Object? inputToken = freezed,Object? outputToken = freezed,Object? inputYuan = freezed,Object? outputYuan = freezed,Object? tags = freezed,Object? sequence = freezed,}) {
  return _then(_$AiModelResImpl(
id: null == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as int,modelId: null == modelId ? _value.modelId : modelId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _value.name : name // ignore: cast_nullable_to_non_nullable
as String,avatarUrl: null == avatarUrl ? _value.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String,modelType: null == modelType ? _value.modelType : modelType // ignore: cast_nullable_to_non_nullable
as int,service: null == service ? _value.service : service // ignore: cast_nullable_to_non_nullable
as String,serviceUrl: freezed == serviceUrl ? _value.serviceUrl : serviceUrl // ignore: cast_nullable_to_non_nullable
as String?,shortName: freezed == shortName ? _value.shortName : shortName // ignore: cast_nullable_to_non_nullable
as String?,url: freezed == url ? _value.url : url // ignore: cast_nullable_to_non_nullable
as String?,desc: freezed == desc ? _value.desc : desc // ignore: cast_nullable_to_non_nullable
as String?,createTime: freezed == createTime ? _value.createTime : createTime // ignore: cast_nullable_to_non_nullable
as String?,updateTime: freezed == updateTime ? _value.updateTime : updateTime // ignore: cast_nullable_to_non_nullable
as String?,createUserId: freezed == createUserId ? _value.createUserId : createUserId // ignore: cast_nullable_to_non_nullable
as int?,updateUserId: freezed == updateUserId ? _value.updateUserId : updateUserId // ignore: cast_nullable_to_non_nullable
as int?,isDelete: freezed == isDelete ? _value.isDelete : isDelete // ignore: cast_nullable_to_non_nullable
as bool?,inputToken: freezed == inputToken ? _value.inputToken : inputToken // ignore: cast_nullable_to_non_nullable
as int?,outputToken: freezed == outputToken ? _value.outputToken : outputToken // ignore: cast_nullable_to_non_nullable
as int?,inputYuan: freezed == inputYuan ? _value.inputYuan : inputYuan // ignore: cast_nullable_to_non_nullable
as int?,outputYuan: freezed == outputYuan ? _value.outputYuan : outputYuan // ignore: cast_nullable_to_non_nullable
as int?,tags: freezed == tags ? _value.tags : tags // ignore: cast_nullable_to_non_nullable
as String?,sequence: freezed == sequence ? _value.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$AiModelResImpl  with DiagnosticableTreeMixin implements _AiModelRes {
  const _$AiModelResImpl({@JuColumn(name: 'id', primaryKey: true) required this.id, @JuColumn(name: 'model_id') required this.modelId, @JuColumn(name: 'name') required this.name, @JuColumn(name: 'avatar_url') required this.avatarUrl, @JuColumn(name: 'model_type') required this.modelType, @JuColumn(name: 'service') required this.service, @JuColumn(name: 'service_url') this.serviceUrl, this.shortName, this.url, this.desc, this.createTime, this.updateTime, this.createUserId, this.updateUserId, this.isDelete, this.inputToken, this.outputToken, this.inputYuan, this.outputYuan, this.tags, this.sequence});

  factory _$AiModelResImpl.fromJson(Map<String, dynamic> json) => _$$AiModelResImplFromJson(json);

@override@JuColumn(name: 'id', primaryKey: true) final  int id;
@override@JuColumn(name: 'model_id') final  String modelId;
@override@JuColumn(name: 'name') final  String name;
@override@JuColumn(name: 'avatar_url') final  String avatarUrl;
@override@JuColumn(name: 'model_type') final  int modelType;
@override@JuColumn(name: 'service') final  String service;
@override@JuColumn(name: 'service_url') final  String? serviceUrl;
@override final  String? shortName;
@override final  String? url;
@override final  String? desc;
@override final  String? createTime;
@override final  String? updateTime;
@override final  int? createUserId;
@override final  int? updateUserId;
@override final  bool? isDelete;
@override final  int? inputToken;
@override final  int? outputToken;
@override final  int? inputYuan;
@override final  int? outputYuan;
@override final  String? tags;
@override final  int? sequence;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'AiModelRes(id: $id, modelId: $modelId, name: $name, avatarUrl: $avatarUrl, modelType: $modelType, service: $service, serviceUrl: $serviceUrl, shortName: $shortName, url: $url, desc: $desc, createTime: $createTime, updateTime: $updateTime, createUserId: $createUserId, updateUserId: $updateUserId, isDelete: $isDelete, inputToken: $inputToken, outputToken: $outputToken, inputYuan: $inputYuan, outputYuan: $outputYuan, tags: $tags, sequence: $sequence)';
}

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  super.debugFillProperties(properties);
  properties
    ..add(DiagnosticsProperty('type', 'AiModelRes'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('modelId', modelId))..add(DiagnosticsProperty('name', name))..add(DiagnosticsProperty('avatarUrl', avatarUrl))..add(DiagnosticsProperty('modelType', modelType))..add(DiagnosticsProperty('service', service))..add(DiagnosticsProperty('serviceUrl', serviceUrl))..add(DiagnosticsProperty('shortName', shortName))..add(DiagnosticsProperty('url', url))..add(DiagnosticsProperty('desc', desc))..add(DiagnosticsProperty('createTime', createTime))..add(DiagnosticsProperty('updateTime', updateTime))..add(DiagnosticsProperty('createUserId', createUserId))..add(DiagnosticsProperty('updateUserId', updateUserId))..add(DiagnosticsProperty('isDelete', isDelete))..add(DiagnosticsProperty('inputToken', inputToken))..add(DiagnosticsProperty('outputToken', outputToken))..add(DiagnosticsProperty('inputYuan', inputYuan))..add(DiagnosticsProperty('outputYuan', outputYuan))..add(DiagnosticsProperty('tags', tags))..add(DiagnosticsProperty('sequence', sequence));
}



/// Create a copy of AiModelRes
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$AiModelResImplCopyWith<_$AiModelResImpl> get copyWith => __$$AiModelResImplCopyWithImpl<_$AiModelResImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$AiModelResImplToJson(this, );
}
}


abstract class _AiModelRes implements AiModelRes {
  const factory _AiModelRes({@JuColumn(name: 'id', primaryKey: true) required final  int id, @JuColumn(name: 'model_id') required final  String modelId, @JuColumn(name: 'name') required final  String name, @JuColumn(name: 'avatar_url') required final  String avatarUrl, @JuColumn(name: 'model_type') required final  int modelType, @JuColumn(name: 'service') required final  String service, @JuColumn(name: 'service_url') final  String? serviceUrl, final  String? shortName, final  String? url, final  String? desc, final  String? createTime, final  String? updateTime, final  int? createUserId, final  int? updateUserId, final  bool? isDelete, final  int? inputToken, final  int? outputToken, final  int? inputYuan, final  int? outputYuan, final  String? tags, final  int? sequence}) = _$AiModelResImpl;
  

  factory _AiModelRes.fromJson(Map<String, dynamic> json) = _$AiModelResImpl.fromJson;

@override@JuColumn(name: 'id', primaryKey: true) int get id;@override@JuColumn(name: 'model_id') String get modelId;@override@JuColumn(name: 'name') String get name;@override@JuColumn(name: 'avatar_url') String get avatarUrl;@override@JuColumn(name: 'model_type') int get modelType;@override@JuColumn(name: 'service') String get service;@override@JuColumn(name: 'service_url') String? get serviceUrl;@override String? get shortName;@override String? get url;@override String? get desc;@override String? get createTime;@override String? get updateTime;@override int? get createUserId;@override int? get updateUserId;@override bool? get isDelete;@override int? get inputToken;@override int? get outputToken;@override int? get inputYuan;@override int? get outputYuan;@override String? get tags;@override int? get sequence;
/// Create a copy of AiModelRes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$AiModelResImplCopyWith<_$AiModelResImpl> get copyWith => throw _privateConstructorUsedError;

}
