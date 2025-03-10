// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_req_dto.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;


final _privateConstructorUsedError = UnsupportedError('It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatReqDto _$ChatReqDtoFromJson(Map<String, dynamic> json) {
return _ChatReqDto.fromJson(json);
}

/// @nodoc
mixin _$ChatReqDto {

 int get conversationId => throw _privateConstructorUsedError; String get message => throw _privateConstructorUsedError; String get model => throw _privateConstructorUsedError; String get modelService => throw _privateConstructorUsedError; int get maxContext => throw _privateConstructorUsedError; List<Map<String, String>> get hisChatList => throw _privateConstructorUsedError; int? get chatDbId => throw _privateConstructorUsedError; String? get rolePrompt => throw _privateConstructorUsedError; bool get useAsyncDb => throw _privateConstructorUsedError; Map<String, dynamic>? get options => throw _privateConstructorUsedError;






/// Serializes this ChatReqDto to a JSON map.
Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
/// Create a copy of ChatReqDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
$ChatReqDtoCopyWith<ChatReqDto> get copyWith => throw _privateConstructorUsedError;

}

/// @nodoc
abstract class $ChatReqDtoCopyWith<$Res>  {
  factory $ChatReqDtoCopyWith(ChatReqDto value, $Res Function(ChatReqDto) then) = _$ChatReqDtoCopyWithImpl<$Res, ChatReqDto>;
@useResult
$Res call({
 int conversationId, String message, String model, String modelService, int maxContext, List<Map<String, String>> hisChatList, int? chatDbId, String? rolePrompt, bool useAsyncDb, Map<String, dynamic>? options
});



}

/// @nodoc
class _$ChatReqDtoCopyWithImpl<$Res,$Val extends ChatReqDto> implements $ChatReqDtoCopyWith<$Res> {
  _$ChatReqDtoCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

/// Create a copy of ChatReqDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? conversationId = null,Object? message = null,Object? model = null,Object? modelService = null,Object? maxContext = null,Object? hisChatList = null,Object? chatDbId = freezed,Object? rolePrompt = freezed,Object? useAsyncDb = null,Object? options = freezed,}) {
  return _then(_value.copyWith(
conversationId: null == conversationId ? _value.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _value.message : message // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _value.model : model // ignore: cast_nullable_to_non_nullable
as String,modelService: null == modelService ? _value.modelService : modelService // ignore: cast_nullable_to_non_nullable
as String,maxContext: null == maxContext ? _value.maxContext : maxContext // ignore: cast_nullable_to_non_nullable
as int,hisChatList: null == hisChatList ? _value.hisChatList : hisChatList // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,chatDbId: freezed == chatDbId ? _value.chatDbId : chatDbId // ignore: cast_nullable_to_non_nullable
as int?,rolePrompt: freezed == rolePrompt ? _value.rolePrompt : rolePrompt // ignore: cast_nullable_to_non_nullable
as String?,useAsyncDb: null == useAsyncDb ? _value.useAsyncDb : useAsyncDb // ignore: cast_nullable_to_non_nullable
as bool,options: freezed == options ? _value.options : options // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  )as $Val);
}

}


/// @nodoc
abstract class _$$ChatReqDtoImplCopyWith<$Res> implements $ChatReqDtoCopyWith<$Res> {
  factory _$$ChatReqDtoImplCopyWith(_$ChatReqDtoImpl value, $Res Function(_$ChatReqDtoImpl) then) = __$$ChatReqDtoImplCopyWithImpl<$Res>;
@override @useResult
$Res call({
 int conversationId, String message, String model, String modelService, int maxContext, List<Map<String, String>> hisChatList, int? chatDbId, String? rolePrompt, bool useAsyncDb, Map<String, dynamic>? options
});



}

/// @nodoc
class __$$ChatReqDtoImplCopyWithImpl<$Res> extends _$ChatReqDtoCopyWithImpl<$Res, _$ChatReqDtoImpl> implements _$$ChatReqDtoImplCopyWith<$Res> {
  __$$ChatReqDtoImplCopyWithImpl(_$ChatReqDtoImpl _value, $Res Function(_$ChatReqDtoImpl) _then)
      : super(_value, _then);


/// Create a copy of ChatReqDto
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? conversationId = null,Object? message = null,Object? model = null,Object? modelService = null,Object? maxContext = null,Object? hisChatList = null,Object? chatDbId = freezed,Object? rolePrompt = freezed,Object? useAsyncDb = null,Object? options = freezed,}) {
  return _then(_$ChatReqDtoImpl(
conversationId: null == conversationId ? _value.conversationId : conversationId // ignore: cast_nullable_to_non_nullable
as int,message: null == message ? _value.message : message // ignore: cast_nullable_to_non_nullable
as String,model: null == model ? _value.model : model // ignore: cast_nullable_to_non_nullable
as String,modelService: null == modelService ? _value.modelService : modelService // ignore: cast_nullable_to_non_nullable
as String,maxContext: null == maxContext ? _value.maxContext : maxContext // ignore: cast_nullable_to_non_nullable
as int,hisChatList: null == hisChatList ? _value._hisChatList : hisChatList // ignore: cast_nullable_to_non_nullable
as List<Map<String, String>>,chatDbId: freezed == chatDbId ? _value.chatDbId : chatDbId // ignore: cast_nullable_to_non_nullable
as int?,rolePrompt: freezed == rolePrompt ? _value.rolePrompt : rolePrompt // ignore: cast_nullable_to_non_nullable
as String?,useAsyncDb: null == useAsyncDb ? _value.useAsyncDb : useAsyncDb // ignore: cast_nullable_to_non_nullable
as bool,options: freezed == options ? _value._options : options // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

/// @nodoc
@JsonSerializable()

class _$ChatReqDtoImpl  implements _ChatReqDto {
  const _$ChatReqDtoImpl({required this.conversationId, required this.message, required this.model, required this.modelService, required this.maxContext, required final  List<Map<String, String>> hisChatList, this.chatDbId, this.rolePrompt, this.useAsyncDb = false, final  Map<String, dynamic>? options}): _hisChatList = hisChatList,_options = options;

  factory _$ChatReqDtoImpl.fromJson(Map<String, dynamic> json) => _$$ChatReqDtoImplFromJson(json);

@override final  int conversationId;
@override final  String message;
@override final  String model;
@override final  String modelService;
@override final  int maxContext;
 final  List<Map<String, String>> _hisChatList;
@override List<Map<String, String>> get hisChatList {
  if (_hisChatList is EqualUnmodifiableListView) return _hisChatList;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_hisChatList);
}

@override final  int? chatDbId;
@override final  String? rolePrompt;
@override@JsonKey() final  bool useAsyncDb;
 final  Map<String, dynamic>? _options;
@override Map<String, dynamic>? get options {
  final value = _options;
  if (value == null) return null;
  if (_options is EqualUnmodifiableMapView) return _options;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


@override
String toString() {
  return 'ChatReqDto(conversationId: $conversationId, message: $message, model: $model, modelService: $modelService, maxContext: $maxContext, hisChatList: $hisChatList, chatDbId: $chatDbId, rolePrompt: $rolePrompt, useAsyncDb: $useAsyncDb, options: $options)';
}




/// Create a copy of ChatReqDto
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@override
@pragma('vm:prefer-inline')
_$$ChatReqDtoImplCopyWith<_$ChatReqDtoImpl> get copyWith => __$$ChatReqDtoImplCopyWithImpl<_$ChatReqDtoImpl>(this, _$identity);







@override
Map<String, dynamic> toJson() {
  return _$$ChatReqDtoImplToJson(this, );
}
}


abstract class _ChatReqDto implements ChatReqDto {
  const factory _ChatReqDto({required final  int conversationId, required final  String message, required final  String model, required final  String modelService, required final  int maxContext, required final  List<Map<String, String>> hisChatList, final  int? chatDbId, final  String? rolePrompt, final  bool useAsyncDb, final  Map<String, dynamic>? options}) = _$ChatReqDtoImpl;
  

  factory _ChatReqDto.fromJson(Map<String, dynamic> json) = _$ChatReqDtoImpl.fromJson;

@override int get conversationId;@override String get message;@override String get model;@override String get modelService;@override int get maxContext;@override List<Map<String, String>> get hisChatList;@override int? get chatDbId;@override String? get rolePrompt;@override bool get useAsyncDb;@override Map<String, dynamic>? get options;
/// Create a copy of ChatReqDto
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
_$$ChatReqDtoImplCopyWith<_$ChatReqDtoImpl> get copyWith => throw _privateConstructorUsedError;

}
