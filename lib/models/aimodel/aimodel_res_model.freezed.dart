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

@JuColumn(primaryKey: true, type: ColumnType.integer) int get id => throw _privateConstructorUsedError;@JuColumn(nullable: false, unique: true) String get modelId => throw _privateConstructorUsedError;@JuColumn(nullable: false, unique: true) String get name => throw _privateConstructorUsedError;@JuColumn(nullable: false) String get avatarUrl => throw _privateConstructorUsedError;@JuColumn(nullable: false, type: ColumnType.integer) int get modelType => throw _privateConstructorUsedError;@JuColumn(nullable: false) String get service => throw _privateConstructorUsedError;@JuColumn() String? get serviceUrl => throw _privateConstructorUsedError;@JuColumn() String? get shortName => throw _privateConstructorUsedError;@JuColumn() String? get url => throw _privateConstructorUsedError;@JuColumn() String? get desc => throw _privateConstructorUsedError;@JuColumn(type: ColumnType.date) DateTime? get createTime => throw _privateConstructorUsedError;@JuColumn(type: ColumnType.date) DateTime? get updateTime => throw _privateConstructorUsedError; int? get createUserId => throw _privateConstructorUsedError; int? get updateUserId => throw _privateConstructorUsedError;@JuColumn(type: ColumnType.bool) bool? get isDelete => throw _privateConstructorUsedError;@JuColumn(type: ColumnType.integer) int? get inputToken => throw _privateConstructorUsedError;@JuColumn(type: ColumnType.integer) int? get outputToken => throw _privateConstructorUsedError;@JuColumn(type: ColumnType.real) int? get inputYuan => throw _privateConstructorUsedError;@JuColumn(type: ColumnType.real) int? get outputYuan => throw _privateConstructorUsedError;@JuColumn() String? get tags => throw _privateConstructorUsedError;@JuColumn(type: ColumnType.integer) int? get sequence => throw _privateConstructorUsedError;






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
@JuColumn(primaryKey: true, type: ColumnType.integer) int id,@JuColumn(nullable: false, unique: true) String modelId,@JuColumn(nullable: false, unique: true) String name,@JuColumn(nullable: false) String avatarUrl,@JuColumn(nullable: false, type: ColumnType.integer) int modelType,@JuColumn(nullable: false) String service,@JuColumn() String? serviceUrl,@JuColumn() String? shortName,@JuColumn() String? url,@JuColumn() String? desc,@JuColumn(type: ColumnType.date) DateTime? createTime,@JuColumn(type: ColumnType.date) DateTime? updateTime, int? createUserId, int? updateUserId,@JuColumn(type: ColumnType.bool) bool? isDelete,@JuColumn(type: ColumnType.integer) int? inputToken,@JuColumn(type: ColumnType.integer) int? outputToken,@JuColumn(type: ColumnType.real) int? inputYuan,@JuColumn(type: ColumnType.real) int? outputYuan,@JuColumn() String? tags,@JuColumn(type: ColumnType.integer) int? sequence
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
as DateTime?,updateTime: freezed == updateTime ? _value.updateTime : updateTime // ignore: cast_nullable_to_non_nullable
as DateTime?,createUserId: freezed == createUserId ? _value.createUserId : createUserId // ignore: cast_nullable_to_non_nullable
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
@JuColumn(primaryKey: true, type: ColumnType.integer) int id,@JuColumn(nullable: false, unique: true) String modelId,@JuColumn(nullable: false, unique: true) String name,@JuColumn(nullable: false) String avatarUrl,@JuColumn(nullable: false, type: ColumnType.integer) int modelType,@JuColumn(nullable: false) String service,@JuColumn() String? serviceUrl,@JuColumn() String? shortName,@JuColumn() String? url,@JuColumn() String? desc,@JuColumn(type: ColumnType.date) DateTime? createTime,@JuColumn(type: ColumnType.date) DateTime? updateTime, int? createUserId, int? updateUserId,@JuColumn(type: ColumnType.bool) bool? isDelete,@JuColumn(type: ColumnType.integer) int? inputToken,@JuColumn(type: ColumnType.integer) int? outputToken,@JuColumn(type: ColumnType.real) int? inputYuan,@JuColumn(type: ColumnType.real) int? outputYuan,@JuColumn() String? tags,@JuColumn(type: ColumnType.integer) int? sequence
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
as DateTime?,updateTime: freezed == updateTime ? _value.updateTime : updateTime // ignore: cast_nullable_to_non_nullable
as DateTime?,createUserId: freezed == createUserId ? _value.createUserId : createUserId // ignore: cast_nullable_to_non_nullable
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
  const _$AiModelResImpl({@JuColumn(primaryKey: true, type: ColumnType.integer) required this.id, @JuColumn(nullable: false, unique: true) required this.modelId, @JuColumn(nullable: false, unique: true) required this.name, @JuColumn(nullable: false) required this.avatarUrl, @JuColumn(nullable: false, type: ColumnType.integer) required this.modelType, @JuColumn(nullable: false) required this.service, @JuColumn() this.serviceUrl, @JuColumn() this.shortName, @JuColumn() this.url, @JuColumn() this.desc, @JuColumn(type: ColumnType.date) this.createTime, @JuColumn(type: ColumnType.date) this.updateTime, this.createUserId, this.updateUserId, @JuColumn(type: ColumnType.bool) this.isDelete, @JuColumn(type: ColumnType.integer) this.inputToken, @JuColumn(type: ColumnType.integer) this.outputToken, @JuColumn(type: ColumnType.real) this.inputYuan, @JuColumn(type: ColumnType.real) this.outputYuan, @JuColumn() this.tags, @JuColumn(type: ColumnType.integer) this.sequence});

  factory _$AiModelResImpl.fromJson(Map<String, dynamic> json) => _$$AiModelResImplFromJson(json);

@override@JuColumn(primaryKey: true, type: ColumnType.integer) final  int id;
@override@JuColumn(nullable: false, unique: true) final  String modelId;
@override@JuColumn(nullable: false, unique: true) final  String name;
@override@JuColumn(nullable: false) final  String avatarUrl;
@override@JuColumn(nullable: false, type: ColumnType.integer) final  int modelType;
@override@JuColumn(nullable: false) final  String service;
@override@JuColumn() final  String? serviceUrl;
@override@JuColumn() final  String? shortName;
@override@JuColumn() final  String? url;
@override@JuColumn() final  String? desc;
@override@JuColumn(type: ColumnType.date) final  DateTime? createTime;
@override@JuColumn(type: ColumnType.date) final  DateTime? updateTime;
@override final  int? createUserId;
@override final  int? updateUserId;
@override@JuColumn(type: ColumnType.bool) final  bool? isDelete;
@override@JuColumn(type: ColumnType.integer) final  int? inputToken;
@override@JuColumn(type: ColumnType.integer) final  int? outputToken;
@override@JuColumn(type: ColumnType.real) final  int? inputYuan;
@override@JuColumn(type: ColumnType.real) final  int? outputYuan;
@override@JuColumn() final  String? tags;
@override@JuColumn(type: ColumnType.integer) final  int? sequence;

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
  const factory _AiModelRes({@JuColumn(primaryKey: true, type: ColumnType.integer) required final  int id, @JuColumn(nullable: false, unique: true) required final  String modelId, @JuColumn(nullable: false, unique: true) required final  String name, @JuColumn(nullable: false) required final  String avatarUrl, @JuColumn(nullable: false, type: ColumnType.integer) required final  int modelType, @JuColumn(nullable: false) required final  String service, @JuColumn() final  String? serviceUrl, @JuColumn() final  String? shortName, @JuColumn() final  String? url, @JuColumn() final  String? desc, @JuColumn(type: ColumnType.date) final  DateTime? createTime, @JuColumn(type: ColumnType.date) final  DateTime? updateTime, final  int? createUserId, final  int? updateUserId, @JuColumn(type: ColumnType.bool) final  bool? isDelete, @JuColumn(type: ColumnType.integer) final  int? inputToken, @JuColumn(type: ColumnType.integer) final  int? outputToken, @JuColumn(type: ColumnType.real) final  int? inputYuan, @JuColumn(type: ColumnType.real) final  int? outputYuan, @JuColumn() final  String? tags, @JuColumn(type: ColumnType.integer) final  int? sequence}) = _$AiModelResImpl;
  

  factory _AiModelRes.fromJson(Map<String, dynamic> json) = _$AiModelResImpl.fromJson;

@override@JuColumn(primaryKey: true, type: ColumnType.integer) int get id;@override@JuColumn(nullable: false, unique: true) String get modelId;@override@JuColumn(nullable: false, unique: true) String get name;@override@JuColumn(nullable: false) String get avatarUrl;@override@JuColumn(nullable: false, type: ColumnType.integer) int get modelType;@override@JuColumn(nullable: false) String get service;@override@JuColumn() String? get serviceUrl;@override@JuColumn() String? get shortName;@override@JuColumn() String? get url;@override@JuColumn() String? get desc;@override@JuColumn(type: ColumnType.date) DateTime? get createTime;@override@JuColumn(type: ColumnType.date) DateTime? get updateTime;@override int? get createUserId;@override int? get updateUserId;@override@JuColumn(type: ColumnType.bool) bool? get isDelete;@override@JuColumn(type: ColumnType.integer) int? get inputToken;@override@JuColumn(type: ColumnType.integer) int? get outputToken;@override@JuColumn(type: ColumnType.real) int? get inputYuan;@override@JuColumn(type: ColumnType.real) int? get outputYuan;@override@JuColumn() String? get tags;@override@JuColumn(type: ColumnType.integer) int? get sequence;
/// Create a copy of AiModelRes
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$AiModelResImplCopyWith<_$AiModelResImpl> get copyWith => throw _privateConstructorUsedError;

}
