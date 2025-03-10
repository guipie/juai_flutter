// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatModel _$ChatModelFromJson(Map<String, dynamic> json) {
return _ChatModel.fromJson(json);
}

/// @nodoc
mixin _$ChatModel {

@JuColumn(primaryKey: true, type: DbType.integer) int? get id => throw _privateConstructorUsedError;@JuColumn(nullable: false, type: DbType.integer) int get conversationId => throw _privateConstructorUsedError;@JuColumn(nullable: false) String get sendMsg => throw _privateConstructorUsedError;@JuColumn(nullable: false) String get receiveMsg => throw _privateConstructorUsedError;@JuColumn(nullable: false) MsgTypeEnum get msgType => throw _privateConstructorUsedError;@JuColumn(nullable: false, type: DbType.integer) int get sendId => throw _privateConstructorUsedError;@JuColumn(nullable: false, type: DbType.integer) int get receiveId => throw _privateConstructorUsedError;@JuColumn(nullable: false) String get model => throw _privateConstructorUsedError;@JuColumn() String? get desc => throw _privateConstructorUsedError;@JuColumn(type: DbType.date)@DateTimeConverter() DateTime? get createTime => throw _privateConstructorUsedError;@JuColumn(type: DbType.date)@DateTimeConverter() DateTime? get lastTime => throw _privateConstructorUsedError;@JuColumn(nullable: false) ConversationEnum get type => throw _privateConstructorUsedError;@JuColumn(type: DbType.integer) int? get relationId => throw _privateConstructorUsedError;@JuColumn(nullable: false) ChatResStatusEnum get status => throw _privateConstructorUsedError;@JuColumn(type: DbType.integer) int? get reqNum => throw _privateConstructorUsedError;@JuColumn(type: DbType.integer) int? get resNum => throw _privateConstructorUsedError;@JuColumn(type: DbType.integer) int? get contextNum => throw _privateConstructorUsedError;@JuColumn() String? get extens => throw _privateConstructorUsedError;






/// Serializes this ChatModel to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of ChatModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$ChatModelCopyWith<ChatModel> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $ChatModelCopyWith<$Res>  {
  factory $ChatModelCopyWith(ChatModel value, $Res Function(ChatModel) then) = _$ChatModelCopyWithImpl<$Res, ChatModel>;
@useResult
$Res call({
@JuColumn(primaryKey: true, type: DbType.integer) int? id,@JuColumn(nullable: false, type: DbType.integer) int conversationId,@JuColumn(nullable: false) String sendMsg,@JuColumn(nullable: false) String receiveMsg,@JuColumn(nullable: false) MsgTypeEnum msgType,@JuColumn(nullable: false, type: DbType.integer) int sendId,@JuColumn(nullable: false, type: DbType.integer) int receiveId,@JuColumn(nullable: false) String model,@JuColumn() String? desc,@JuColumn(type: DbType.date)@DateTimeConverter() DateTime? createTime,@JuColumn(type: DbType.date)@DateTimeConverter() DateTime? lastTime,@JuColumn(nullable: false) ConversationEnum type,@JuColumn(type: DbType.integer) int? relationId,@JuColumn(nullable: false) ChatResStatusEnum status,@JuColumn(type: DbType.integer) int? reqNum,@JuColumn(type: DbType.integer) int? resNum,@JuColumn(type: DbType.integer) int? contextNum,@JuColumn() String? extens
});



}

/// @nodoc
class _$ChatModelCopyWithImpl<$Res,$Val extends ChatModel> implements $ChatModelCopyWith<$Res> {
  _$ChatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of ChatModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? conversationId = null,Object? sendMsg = null,Object? receiveMsg = null,Object? msgType = null,Object? sendId = null,Object? receiveId = null,Object? model = null,Object? desc = freezed,Object? createTime = freezed,Object? lastTime = freezed,Object? type = null,Object? relationId = freezed,Object? status = null,Object? reqNum = freezed,Object? resNum = freezed,Object? contextNum = freezed,Object? extens = freezed,}) {
  return _then(_value.copyWith(
id: freezed == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as int?,conversationId: null == conversationId ? _value.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as int,sendMsg: null == sendMsg ? _value.sendMsg : sendMsg // ignore: cast_nullable_to_non_nullable
as String,receiveMsg: null == receiveMsg ? _value.receiveMsg : receiveMsg // ignore: cast_nullable_to_non_nullable
as String,msgType: null == msgType ? _value.msgType : msgType // ignore: cast_nullable_to_non_nullable
as MsgTypeEnum,sendId: null == sendId ? _value.sendId : sendId // ignore: cast_nullable_to_non_nullable
as int,receiveId: null == receiveId ? _value.receiveId : receiveId // ignore: cast_nullable_to_non_nullable
as int,model: null == model ? _value.model : model // ignore: cast_nullable_to_non_nullable
as String,desc: freezed == desc ? _value.desc : desc // ignore: cast_nullable_to_non_nullable
as String?,createTime: freezed == createTime ? _value.createTime : createTime // ignore: cast_nullable_to_non_nullable
as DateTime?,lastTime: freezed == lastTime ? _value.lastTime : lastTime // ignore: cast_nullable_to_non_nullable
as DateTime?,type: null == type ? _value.type : type // ignore: cast_nullable_to_non_nullable
as ConversationEnum,relationId: freezed == relationId ? _value.relationId : relationId // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _value.status : status // ignore: cast_nullable_to_non_nullable
as ChatResStatusEnum,reqNum: freezed == reqNum ? _value.reqNum : reqNum // ignore: cast_nullable_to_non_nullable
as int?,resNum: freezed == resNum ? _value.resNum : resNum // ignore: cast_nullable_to_non_nullable
as int?,contextNum: freezed == contextNum ? _value.contextNum : contextNum // ignore: cast_nullable_to_non_nullable
as int?,extens: freezed == extens ? _value.extens : extens // ignore: cast_nullable_to_non_nullable
as String?,
  )as $Val);
}

}


/// @nodoc
abstract class _$$ChatModelImplCopyWith<$Res> implements $ChatModelCopyWith<$Res> {
  factory _$$ChatModelImplCopyWith(_$ChatModelImpl value, $Res Function(_$ChatModelImpl) then) = __$$ChatModelImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
@JuColumn(primaryKey: true, type: DbType.integer) int? id,@JuColumn(nullable: false, type: DbType.integer) int conversationId,@JuColumn(nullable: false) String sendMsg,@JuColumn(nullable: false) String receiveMsg,@JuColumn(nullable: false) MsgTypeEnum msgType,@JuColumn(nullable: false, type: DbType.integer) int sendId,@JuColumn(nullable: false, type: DbType.integer) int receiveId,@JuColumn(nullable: false) String model,@JuColumn() String? desc,@JuColumn(type: DbType.date)@DateTimeConverter() DateTime? createTime,@JuColumn(type: DbType.date)@DateTimeConverter() DateTime? lastTime,@JuColumn(nullable: false) ConversationEnum type,@JuColumn(type: DbType.integer) int? relationId,@JuColumn(nullable: false) ChatResStatusEnum status,@JuColumn(type: DbType.integer) int? reqNum,@JuColumn(type: DbType.integer) int? resNum,@JuColumn(type: DbType.integer) int? contextNum,@JuColumn() String? extens
});



}

/// @nodoc
class __$$ChatModelImplCopyWithImpl<$Res> extends _$ChatModelCopyWithImpl<$Res, _$ChatModelImpl> implements _$$ChatModelImplCopyWith<$Res> {
  __$$ChatModelImplCopyWithImpl(_$ChatModelImpl _value, $Res Function(_$ChatModelImpl) _then)
      : super(_value, _then);


/// Create a copy of ChatModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? conversationId = null,Object? sendMsg = null,Object? receiveMsg = null,Object? msgType = null,Object? sendId = null,Object? receiveId = null,Object? model = null,Object? desc = freezed,Object? createTime = freezed,Object? lastTime = freezed,Object? type = null,Object? relationId = freezed,Object? status = null,Object? reqNum = freezed,Object? resNum = freezed,Object? contextNum = freezed,Object? extens = freezed,}) {
  return _then(_$ChatModelImpl(
id: freezed == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as int?,conversationId: null == conversationId ? _value.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as int,sendMsg: null == sendMsg ? _value.sendMsg : sendMsg // ignore: cast_nullable_to_non_nullable
as String,receiveMsg: null == receiveMsg ? _value.receiveMsg : receiveMsg // ignore: cast_nullable_to_non_nullable
as String,msgType: null == msgType ? _value.msgType : msgType // ignore: cast_nullable_to_non_nullable
as MsgTypeEnum,sendId: null == sendId ? _value.sendId : sendId // ignore: cast_nullable_to_non_nullable
as int,receiveId: null == receiveId ? _value.receiveId : receiveId // ignore: cast_nullable_to_non_nullable
as int,model: null == model ? _value.model : model // ignore: cast_nullable_to_non_nullable
as String,desc: freezed == desc ? _value.desc : desc // ignore: cast_nullable_to_non_nullable
as String?,createTime: freezed == createTime ? _value.createTime : createTime // ignore: cast_nullable_to_non_nullable
as DateTime?,lastTime: freezed == lastTime ? _value.lastTime : lastTime // ignore: cast_nullable_to_non_nullable
as DateTime?,type: null == type ? _value.type : type // ignore: cast_nullable_to_non_nullable
as ConversationEnum,relationId: freezed == relationId ? _value.relationId : relationId // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _value.status : status // ignore: cast_nullable_to_non_nullable
as ChatResStatusEnum,reqNum: freezed == reqNum ? _value.reqNum : reqNum // ignore: cast_nullable_to_non_nullable
as int?,resNum: freezed == resNum ? _value.resNum : resNum // ignore: cast_nullable_to_non_nullable
as int?,contextNum: freezed == contextNum ? _value.contextNum : contextNum // ignore: cast_nullable_to_non_nullable
as int?,extens: freezed == extens ? _value.extens : extens // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$ChatModelImpl  with DiagnosticableTreeMixin implements _ChatModel {
  const _$ChatModelImpl({@JuColumn(primaryKey: true, type: DbType.integer) this.id, @JuColumn(nullable: false, type: DbType.integer) required this.conversationId, @JuColumn(nullable: false) required this.sendMsg, @JuColumn(nullable: false) required this.receiveMsg, @JuColumn(nullable: false) required this.msgType, @JuColumn(nullable: false, type: DbType.integer) required this.sendId, @JuColumn(nullable: false, type: DbType.integer) required this.receiveId, @JuColumn(nullable: false) required this.model, @JuColumn() this.desc, @JuColumn(type: DbType.date)@DateTimeConverter() this.createTime, @JuColumn(type: DbType.date)@DateTimeConverter() this.lastTime, @JuColumn(nullable: false) required this.type, @JuColumn(type: DbType.integer) this.relationId = 0, @JuColumn(nullable: false) this.status = ChatResStatusEnum.error, @JuColumn(type: DbType.integer) this.reqNum = 0, @JuColumn(type: DbType.integer) this.resNum = 0, @JuColumn(type: DbType.integer) this.contextNum = 0, @JuColumn() this.extens});

  factory _$ChatModelImpl.fromJson(Map<String, dynamic> json) => _$$ChatModelImplFromJson(json);

@override@JuColumn(primaryKey: true, type: DbType.integer) final  int? id;
@override@JuColumn(nullable: false, type: DbType.integer) final  int conversationId;
@override@JuColumn(nullable: false) final  String sendMsg;
@override@JuColumn(nullable: false) final  String receiveMsg;
@override@JuColumn(nullable: false) final  MsgTypeEnum msgType;
@override@JuColumn(nullable: false, type: DbType.integer) final  int sendId;
@override@JuColumn(nullable: false, type: DbType.integer) final  int receiveId;
@override@JuColumn(nullable: false) final  String model;
@override@JuColumn() final  String? desc;
@override@JuColumn(type: DbType.date)@DateTimeConverter() final  DateTime? createTime;
@override@JuColumn(type: DbType.date)@DateTimeConverter() final  DateTime? lastTime;
@override@JuColumn(nullable: false) final  ConversationEnum type;
@override@JsonKey()@JuColumn(type: DbType.integer) final  int? relationId;
@override@JsonKey()@JuColumn(nullable: false) final  ChatResStatusEnum status;
@override@JsonKey()@JuColumn(type: DbType.integer) final  int? reqNum;
@override@JsonKey()@JuColumn(type: DbType.integer) final  int? resNum;
@override@JsonKey()@JuColumn(type: DbType.integer) final  int? contextNum;
@override@JuColumn() final  String? extens;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ChatModel(id: $id, conversationId: $conversationId, sendMsg: $sendMsg, receiveMsg: $receiveMsg, msgType: $msgType, sendId: $sendId, receiveId: $receiveId, model: $model, desc: $desc, createTime: $createTime, lastTime: $lastTime, type: $type, relationId: $relationId, status: $status, reqNum: $reqNum, resNum: $resNum, contextNum: $contextNum, extens: $extens)';
}

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  super.debugFillProperties(properties);
  properties
    ..add(DiagnosticsProperty('type', 'ChatModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('conversationId', conversationId))..add(DiagnosticsProperty('sendMsg', sendMsg))..add(DiagnosticsProperty('receiveMsg', receiveMsg))..add(DiagnosticsProperty('msgType', msgType))..add(DiagnosticsProperty('sendId', sendId))..add(DiagnosticsProperty('receiveId', receiveId))..add(DiagnosticsProperty('model', model))..add(DiagnosticsProperty('desc', desc))..add(DiagnosticsProperty('createTime', createTime))..add(DiagnosticsProperty('lastTime', lastTime))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('relationId', relationId))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('reqNum', reqNum))..add(DiagnosticsProperty('resNum', resNum))..add(DiagnosticsProperty('contextNum', contextNum))..add(DiagnosticsProperty('extens', extens));
}



/// Create a copy of ChatModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$ChatModelImplCopyWith<_$ChatModelImpl> get copyWith => __$$ChatModelImplCopyWithImpl<_$ChatModelImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$ChatModelImplToJson(this, );
}
}


abstract class _ChatModel implements ChatModel {
  const factory _ChatModel({@JuColumn(primaryKey: true, type: DbType.integer) final  int? id, @JuColumn(nullable: false, type: DbType.integer) required final  int conversationId, @JuColumn(nullable: false) required final  String sendMsg, @JuColumn(nullable: false) required final  String receiveMsg, @JuColumn(nullable: false) required final  MsgTypeEnum msgType, @JuColumn(nullable: false, type: DbType.integer) required final  int sendId, @JuColumn(nullable: false, type: DbType.integer) required final  int receiveId, @JuColumn(nullable: false) required final  String model, @JuColumn() final  String? desc, @JuColumn(type: DbType.date)@DateTimeConverter() final  DateTime? createTime, @JuColumn(type: DbType.date)@DateTimeConverter() final  DateTime? lastTime, @JuColumn(nullable: false) required final  ConversationEnum type, @JuColumn(type: DbType.integer) final  int? relationId, @JuColumn(nullable: false) final  ChatResStatusEnum status, @JuColumn(type: DbType.integer) final  int? reqNum, @JuColumn(type: DbType.integer) final  int? resNum, @JuColumn(type: DbType.integer) final  int? contextNum, @JuColumn() final  String? extens}) = _$ChatModelImpl;
  

  factory _ChatModel.fromJson(Map<String, dynamic> json) = _$ChatModelImpl.fromJson;

@override@JuColumn(primaryKey: true, type: DbType.integer) int? get id;@override@JuColumn(nullable: false, type: DbType.integer) int get conversationId;@override@JuColumn(nullable: false) String get sendMsg;@override@JuColumn(nullable: false) String get receiveMsg;@override@JuColumn(nullable: false) MsgTypeEnum get msgType;@override@JuColumn(nullable: false, type: DbType.integer) int get sendId;@override@JuColumn(nullable: false, type: DbType.integer) int get receiveId;@override@JuColumn(nullable: false) String get model;@override@JuColumn() String? get desc;@override@JuColumn(type: DbType.date)@DateTimeConverter() DateTime? get createTime;@override@JuColumn(type: DbType.date)@DateTimeConverter() DateTime? get lastTime;@override@JuColumn(nullable: false) ConversationEnum get type;@override@JuColumn(type: DbType.integer) int? get relationId;@override@JuColumn(nullable: false) ChatResStatusEnum get status;@override@JuColumn(type: DbType.integer) int? get reqNum;@override@JuColumn(type: DbType.integer) int? get resNum;@override@JuColumn(type: DbType.integer) int? get contextNum;@override@JuColumn() String? get extens;
/// Create a copy of ChatModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$ChatModelImplCopyWith<_$ChatModelImpl> get copyWith => throw _privateConstructorUsedError;

}
