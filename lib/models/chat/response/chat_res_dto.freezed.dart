// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_res_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatResDto _$ChatResDtoFromJson(Map<String, dynamic> json) {
return _ChatResDto.fromJson(json);
}

/// @nodoc
mixin _$ChatResDto {

@JsonKey(name: 'conversationId') int get conversationId => throw _privateConstructorUsedError;@JsonKey(name: 'chatDbId') int get chatDbId => throw _privateConstructorUsedError;@JsonKey(name: 'text') String? get text => throw _privateConstructorUsedError;@JsonKey(name: 'role') String? get role => throw _privateConstructorUsedError;@JsonKey(name: 'reqNum') int? get reqNum => throw _privateConstructorUsedError;@JsonKey(name: 'resNum') int? get resNum => throw _privateConstructorUsedError;@JsonKey(name: 'msg') String? get msg => throw _privateConstructorUsedError;@JsonKey(name: 'status') ChatResStatusEnum get status => throw _privateConstructorUsedError;






/// Serializes this ChatResDto to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of ChatResDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$ChatResDtoCopyWith<ChatResDto> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $ChatResDtoCopyWith<$Res>  {
  factory $ChatResDtoCopyWith(ChatResDto value, $Res Function(ChatResDto) then) = _$ChatResDtoCopyWithImpl<$Res, ChatResDto>;
@useResult
$Res call({
@JsonKey(name: 'conversationId') int conversationId,@JsonKey(name: 'chatDbId') int chatDbId,@JsonKey(name: 'text') String? text,@JsonKey(name: 'role') String? role,@JsonKey(name: 'reqNum') int? reqNum,@JsonKey(name: 'resNum') int? resNum,@JsonKey(name: 'msg') String? msg,@JsonKey(name: 'status') ChatResStatusEnum status
});



}

/// @nodoc
class _$ChatResDtoCopyWithImpl<$Res,$Val extends ChatResDto> implements $ChatResDtoCopyWith<$Res> {
  _$ChatResDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of ChatResDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? conversationId = null,Object? chatDbId = null,Object? text = freezed,Object? role = freezed,Object? reqNum = freezed,Object? resNum = freezed,Object? msg = freezed,Object? status = null,}) {
  return _then(_value.copyWith(
conversationId: null == conversationId ? _value.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as int,chatDbId: null == chatDbId ? _value.chatDbId : chatDbId // ignore: cast_nullable_to_non_nullable
as int,text: freezed == text ? _value.text : text // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _value.role : role // ignore: cast_nullable_to_non_nullable
as String?,reqNum: freezed == reqNum ? _value.reqNum : reqNum // ignore: cast_nullable_to_non_nullable
as int?,resNum: freezed == resNum ? _value.resNum : resNum // ignore: cast_nullable_to_non_nullable
as int?,msg: freezed == msg ? _value.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _value.status : status // ignore: cast_nullable_to_non_nullable
as ChatResStatusEnum,
  )as $Val);
}

}


/// @nodoc
abstract class _$$ChatResDtoImplCopyWith<$Res> implements $ChatResDtoCopyWith<$Res> {
  factory _$$ChatResDtoImplCopyWith(_$ChatResDtoImpl value, $Res Function(_$ChatResDtoImpl) then) = __$$ChatResDtoImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
@JsonKey(name: 'conversationId') int conversationId,@JsonKey(name: 'chatDbId') int chatDbId,@JsonKey(name: 'text') String? text,@JsonKey(name: 'role') String? role,@JsonKey(name: 'reqNum') int? reqNum,@JsonKey(name: 'resNum') int? resNum,@JsonKey(name: 'msg') String? msg,@JsonKey(name: 'status') ChatResStatusEnum status
});



}

/// @nodoc
class __$$ChatResDtoImplCopyWithImpl<$Res> extends _$ChatResDtoCopyWithImpl<$Res, _$ChatResDtoImpl> implements _$$ChatResDtoImplCopyWith<$Res> {
  __$$ChatResDtoImplCopyWithImpl(_$ChatResDtoImpl _value, $Res Function(_$ChatResDtoImpl) _then)
      : super(_value, _then);


/// Create a copy of ChatResDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? conversationId = null,Object? chatDbId = null,Object? text = freezed,Object? role = freezed,Object? reqNum = freezed,Object? resNum = freezed,Object? msg = freezed,Object? status = null,}) {
  return _then(_$ChatResDtoImpl(
conversationId: null == conversationId ? _value.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as int,chatDbId: null == chatDbId ? _value.chatDbId : chatDbId // ignore: cast_nullable_to_non_nullable
as int,text: freezed == text ? _value.text : text // ignore: cast_nullable_to_non_nullable
as String?,role: freezed == role ? _value.role : role // ignore: cast_nullable_to_non_nullable
as String?,reqNum: freezed == reqNum ? _value.reqNum : reqNum // ignore: cast_nullable_to_non_nullable
as int?,resNum: freezed == resNum ? _value.resNum : resNum // ignore: cast_nullable_to_non_nullable
as int?,msg: freezed == msg ? _value.msg : msg // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _value.status : status // ignore: cast_nullable_to_non_nullable
as ChatResStatusEnum,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$ChatResDtoImpl  implements _ChatResDto {
  const _$ChatResDtoImpl({@JsonKey(name: 'conversationId') required this.conversationId, @JsonKey(name: 'chatDbId') required this.chatDbId, @JsonKey(name: 'text') this.text, @JsonKey(name: 'role') this.role, @JsonKey(name: 'reqNum') this.reqNum, @JsonKey(name: 'resNum') this.resNum, @JsonKey(name: 'msg') this.msg, @JsonKey(name: 'status') required this.status});

  factory _$ChatResDtoImpl.fromJson(Map<String, dynamic> json) => _$$ChatResDtoImplFromJson(json);

@override@JsonKey(name: 'conversationId') final  int conversationId;
@override@JsonKey(name: 'chatDbId') final  int chatDbId;
@override@JsonKey(name: 'text') final  String? text;
@override@JsonKey(name: 'role') final  String? role;
@override@JsonKey(name: 'reqNum') final  int? reqNum;
@override@JsonKey(name: 'resNum') final  int? resNum;
@override@JsonKey(name: 'msg') final  String? msg;
@override@JsonKey(name: 'status') final  ChatResStatusEnum status;

@override
String toString() {
  return 'ChatResDto(conversationId: $conversationId, chatDbId: $chatDbId, text: $text, role: $role, reqNum: $reqNum, resNum: $resNum, msg: $msg, status: $status)';
}




/// Create a copy of ChatResDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$ChatResDtoImplCopyWith<_$ChatResDtoImpl> get copyWith => __$$ChatResDtoImplCopyWithImpl<_$ChatResDtoImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$ChatResDtoImplToJson(this, );
}
}


abstract class _ChatResDto implements ChatResDto {
  const factory _ChatResDto({@JsonKey(name: 'conversationId') required final  int conversationId, @JsonKey(name: 'chatDbId') required final  int chatDbId, @JsonKey(name: 'text') final  String? text, @JsonKey(name: 'role') final  String? role, @JsonKey(name: 'reqNum') final  int? reqNum, @JsonKey(name: 'resNum') final  int? resNum, @JsonKey(name: 'msg') final  String? msg, @JsonKey(name: 'status') required final  ChatResStatusEnum status}) = _$ChatResDtoImpl;
  

  factory _ChatResDto.fromJson(Map<String, dynamic> json) = _$ChatResDtoImpl.fromJson;

@override@JsonKey(name: 'conversationId') int get conversationId;@override@JsonKey(name: 'chatDbId') int get chatDbId;@override@JsonKey(name: 'text') String? get text;@override@JsonKey(name: 'role') String? get role;@override@JsonKey(name: 'reqNum') int? get reqNum;@override@JsonKey(name: 'resNum') int? get resNum;@override@JsonKey(name: 'msg') String? get msg;@override@JsonKey(name: 'status') ChatResStatusEnum get status;
/// Create a copy of ChatResDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$ChatResDtoImplCopyWith<_$ChatResDtoImpl> get copyWith => throw _privateConstructorUsedError;

}
