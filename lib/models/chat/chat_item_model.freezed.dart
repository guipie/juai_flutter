// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_item_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatItemModel _$ChatItemModelFromJson(Map<String, dynamic> json) {
return _ChatItemModel.fromJson(json);
}

/// @nodoc
mixin _$ChatItemModel {

 int? get id => throw _privateConstructorUsedError; int get conversationId => throw _privateConstructorUsedError; String get sendMsg => throw _privateConstructorUsedError; String get receiveMsg => throw _privateConstructorUsedError; MsgTypeEnum get msgType => throw _privateConstructorUsedError; int get sendId => throw _privateConstructorUsedError; int get receiveId => throw _privateConstructorUsedError; String? get desc => throw _privateConstructorUsedError;@DateTimeConverter() DateTime? get createTime => throw _privateConstructorUsedError;@DateTimeConverter() DateTime? get lastTime => throw _privateConstructorUsedError; ConversationEnum get type => throw _privateConstructorUsedError; int? get relationId => throw _privateConstructorUsedError;@JsonKey(name: 'status', fromJson: ChatResStatusEnum.fromJson, toJson: ChatResStatusEnum.toJson) ChatResStatusEnum get status => throw _privateConstructorUsedError; String? get extens => throw _privateConstructorUsedError;






/// Serializes this ChatItemModel to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of ChatItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$ChatItemModelCopyWith<ChatItemModel> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $ChatItemModelCopyWith<$Res>  {
  factory $ChatItemModelCopyWith(ChatItemModel value, $Res Function(ChatItemModel) then) = _$ChatItemModelCopyWithImpl<$Res, ChatItemModel>;
@useResult
$Res call({
 int? id, int conversationId, String sendMsg, String receiveMsg, MsgTypeEnum msgType, int sendId, int receiveId, String? desc,@DateTimeConverter() DateTime? createTime,@DateTimeConverter() DateTime? lastTime, ConversationEnum type, int? relationId,@JsonKey(name: 'status', fromJson: ChatResStatusEnum.fromJson, toJson: ChatResStatusEnum.toJson) ChatResStatusEnum status, String? extens
});



}

/// @nodoc
class _$ChatItemModelCopyWithImpl<$Res,$Val extends ChatItemModel> implements $ChatItemModelCopyWith<$Res> {
  _$ChatItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of ChatItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? conversationId = null,Object? sendMsg = null,Object? receiveMsg = null,Object? msgType = null,Object? sendId = null,Object? receiveId = null,Object? desc = freezed,Object? createTime = freezed,Object? lastTime = freezed,Object? type = null,Object? relationId = freezed,Object? status = null,Object? extens = freezed,}) {
  return _then(_value.copyWith(
id: freezed == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as int?,conversationId: null == conversationId ? _value.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as int,sendMsg: null == sendMsg ? _value.sendMsg : sendMsg // ignore: cast_nullable_to_non_nullable
as String,receiveMsg: null == receiveMsg ? _value.receiveMsg : receiveMsg // ignore: cast_nullable_to_non_nullable
as String,msgType: null == msgType ? _value.msgType : msgType // ignore: cast_nullable_to_non_nullable
as MsgTypeEnum,sendId: null == sendId ? _value.sendId : sendId // ignore: cast_nullable_to_non_nullable
as int,receiveId: null == receiveId ? _value.receiveId : receiveId // ignore: cast_nullable_to_non_nullable
as int,desc: freezed == desc ? _value.desc : desc // ignore: cast_nullable_to_non_nullable
as String?,createTime: freezed == createTime ? _value.createTime : createTime // ignore: cast_nullable_to_non_nullable
as DateTime?,lastTime: freezed == lastTime ? _value.lastTime : lastTime // ignore: cast_nullable_to_non_nullable
as DateTime?,type: null == type ? _value.type : type // ignore: cast_nullable_to_non_nullable
as ConversationEnum,relationId: freezed == relationId ? _value.relationId : relationId // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _value.status : status // ignore: cast_nullable_to_non_nullable
as ChatResStatusEnum,extens: freezed == extens ? _value.extens : extens // ignore: cast_nullable_to_non_nullable
as String?,
  )as $Val);
}

}


/// @nodoc
abstract class _$$ChatItemModelImplCopyWith<$Res> implements $ChatItemModelCopyWith<$Res> {
  factory _$$ChatItemModelImplCopyWith(_$ChatItemModelImpl value, $Res Function(_$ChatItemModelImpl) then) = __$$ChatItemModelImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 int? id, int conversationId, String sendMsg, String receiveMsg, MsgTypeEnum msgType, int sendId, int receiveId, String? desc,@DateTimeConverter() DateTime? createTime,@DateTimeConverter() DateTime? lastTime, ConversationEnum type, int? relationId,@JsonKey(name: 'status', fromJson: ChatResStatusEnum.fromJson, toJson: ChatResStatusEnum.toJson) ChatResStatusEnum status, String? extens
});



}

/// @nodoc
class __$$ChatItemModelImplCopyWithImpl<$Res> extends _$ChatItemModelCopyWithImpl<$Res, _$ChatItemModelImpl> implements _$$ChatItemModelImplCopyWith<$Res> {
  __$$ChatItemModelImplCopyWithImpl(_$ChatItemModelImpl _value, $Res Function(_$ChatItemModelImpl) _then)
      : super(_value, _then);


/// Create a copy of ChatItemModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? conversationId = null,Object? sendMsg = null,Object? receiveMsg = null,Object? msgType = null,Object? sendId = null,Object? receiveId = null,Object? desc = freezed,Object? createTime = freezed,Object? lastTime = freezed,Object? type = null,Object? relationId = freezed,Object? status = null,Object? extens = freezed,}) {
  return _then(_$ChatItemModelImpl(
id: freezed == id ? _value.id : id // ignore: cast_nullable_to_non_nullable
as int?,conversationId: null == conversationId ? _value.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as int,sendMsg: null == sendMsg ? _value.sendMsg : sendMsg // ignore: cast_nullable_to_non_nullable
as String,receiveMsg: null == receiveMsg ? _value.receiveMsg : receiveMsg // ignore: cast_nullable_to_non_nullable
as String,msgType: null == msgType ? _value.msgType : msgType // ignore: cast_nullable_to_non_nullable
as MsgTypeEnum,sendId: null == sendId ? _value.sendId : sendId // ignore: cast_nullable_to_non_nullable
as int,receiveId: null == receiveId ? _value.receiveId : receiveId // ignore: cast_nullable_to_non_nullable
as int,desc: freezed == desc ? _value.desc : desc // ignore: cast_nullable_to_non_nullable
as String?,createTime: freezed == createTime ? _value.createTime : createTime // ignore: cast_nullable_to_non_nullable
as DateTime?,lastTime: freezed == lastTime ? _value.lastTime : lastTime // ignore: cast_nullable_to_non_nullable
as DateTime?,type: null == type ? _value.type : type // ignore: cast_nullable_to_non_nullable
as ConversationEnum,relationId: freezed == relationId ? _value.relationId : relationId // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _value.status : status // ignore: cast_nullable_to_non_nullable
as ChatResStatusEnum,extens: freezed == extens ? _value.extens : extens // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$ChatItemModelImpl  with DiagnosticableTreeMixin implements _ChatItemModel {
  const _$ChatItemModelImpl({this.id, required this.conversationId, required this.sendMsg, required this.receiveMsg, required this.msgType, required this.sendId, required this.receiveId, this.desc, @DateTimeConverter() this.createTime, @DateTimeConverter() this.lastTime, required this.type, this.relationId = 0, @JsonKey(name: 'status', fromJson: ChatResStatusEnum.fromJson, toJson: ChatResStatusEnum.toJson) this.status = ChatResStatusEnum.error, this.extens});

  factory _$ChatItemModelImpl.fromJson(Map<String, dynamic> json) => _$$ChatItemModelImplFromJson(json);

@override final  int? id;
@override final  int conversationId;
@override final  String sendMsg;
@override final  String receiveMsg;
@override final  MsgTypeEnum msgType;
@override final  int sendId;
@override final  int receiveId;
@override final  String? desc;
@override@DateTimeConverter() final  DateTime? createTime;
@override@DateTimeConverter() final  DateTime? lastTime;
@override final  ConversationEnum type;
@override@JsonKey() final  int? relationId;
@override@JsonKey(name: 'status', fromJson: ChatResStatusEnum.fromJson, toJson: ChatResStatusEnum.toJson) final  ChatResStatusEnum status;
@override final  String? extens;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'ChatItemModel(id: $id, conversationId: $conversationId, sendMsg: $sendMsg, receiveMsg: $receiveMsg, msgType: $msgType, sendId: $sendId, receiveId: $receiveId, desc: $desc, createTime: $createTime, lastTime: $lastTime, type: $type, relationId: $relationId, status: $status, extens: $extens)';
}

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  super.debugFillProperties(properties);
  properties
    ..add(DiagnosticsProperty('type', 'ChatItemModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('conversationId', conversationId))..add(DiagnosticsProperty('sendMsg', sendMsg))..add(DiagnosticsProperty('receiveMsg', receiveMsg))..add(DiagnosticsProperty('msgType', msgType))..add(DiagnosticsProperty('sendId', sendId))..add(DiagnosticsProperty('receiveId', receiveId))..add(DiagnosticsProperty('desc', desc))..add(DiagnosticsProperty('createTime', createTime))..add(DiagnosticsProperty('lastTime', lastTime))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('relationId', relationId))..add(DiagnosticsProperty('status', status))..add(DiagnosticsProperty('extens', extens));
}



/// Create a copy of ChatItemModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$ChatItemModelImplCopyWith<_$ChatItemModelImpl> get copyWith => __$$ChatItemModelImplCopyWithImpl<_$ChatItemModelImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$ChatItemModelImplToJson(this, );
}
}


abstract class _ChatItemModel implements ChatItemModel {
  const factory _ChatItemModel({final  int? id, required final  int conversationId, required final  String sendMsg, required final  String receiveMsg, required final  MsgTypeEnum msgType, required final  int sendId, required final  int receiveId, final  String? desc, @DateTimeConverter() final  DateTime? createTime, @DateTimeConverter() final  DateTime? lastTime, required final  ConversationEnum type, final  int? relationId, @JsonKey(name: 'status', fromJson: ChatResStatusEnum.fromJson, toJson: ChatResStatusEnum.toJson) final  ChatResStatusEnum status, final  String? extens}) = _$ChatItemModelImpl;
  

  factory _ChatItemModel.fromJson(Map<String, dynamic> json) = _$ChatItemModelImpl.fromJson;

@override int? get id;@override int get conversationId;@override String get sendMsg;@override String get receiveMsg;@override MsgTypeEnum get msgType;@override int get sendId;@override int get receiveId;@override String? get desc;@override@DateTimeConverter() DateTime? get createTime;@override@DateTimeConverter() DateTime? get lastTime;@override ConversationEnum get type;@override int? get relationId;@override@JsonKey(name: 'status', fromJson: ChatResStatusEnum.fromJson, toJson: ChatResStatusEnum.toJson) ChatResStatusEnum get status;@override String? get extens;
/// Create a copy of ChatItemModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$ChatItemModelImplCopyWith<_$ChatItemModelImpl> get copyWith => throw _privateConstructorUsedError;

}
