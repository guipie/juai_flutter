// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'prompt_res_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PromptRes _$PromptResFromJson(Map<String, dynamic> json) {
  return _Prompt.fromJson(json);
}

/// @nodoc
mixin _$PromptRes {
  @JsonKey(name: 'id')
  int get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'type')
  String? get type => throw _privateConstructorUsedError;
  @JsonKey(name: 'title')
  String get title => throw _privateConstructorUsedError;
  @JsonKey(name: 'prompt')
  String get prompt => throw _privateConstructorUsedError;
  @JsonKey(name: 'maxContext')
  int? get maxContext => throw _privateConstructorUsedError;
  @JsonKey(name: 'promptExtend')
  String? get promptExtend => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar')
  String? get avatar => throw _privateConstructorUsedError;
  @JsonKey(name: 'file')
  String? get file => throw _privateConstructorUsedError;
  @JsonKey(name: 'initMessage')
  String? get initMessage => throw _privateConstructorUsedError;
  @JsonKey(name: 'tags')
  String? get tags => throw _privateConstructorUsedError;
  @JsonKey(name: 'model')
  String get model => throw _privateConstructorUsedError;
  @JsonKey(name: 'vendor')
  String? get vendor => throw _privateConstructorUsedError;
  @JsonKey(name: 'category')
  String? get category => throw _privateConstructorUsedError;
  @JsonKey(name: 'isGroup')
  bool? get isGroup => throw _privateConstructorUsedError;
  @JsonKey(name: 'createTime')
  DateTime? get createTime => throw _privateConstructorUsedError;

  /// Serializes this PromptRes to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PromptRes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PromptResCopyWith<PromptRes> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PromptResCopyWith<$Res> {
  factory $PromptResCopyWith(PromptRes value, $Res Function(PromptRes) then) =
      _$PromptResCopyWithImpl<$Res, PromptRes>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'prompt') String prompt,
      @JsonKey(name: 'maxContext') int? maxContext,
      @JsonKey(name: 'promptExtend') String? promptExtend,
      @JsonKey(name: 'avatar') String? avatar,
      @JsonKey(name: 'file') String? file,
      @JsonKey(name: 'initMessage') String? initMessage,
      @JsonKey(name: 'tags') String? tags,
      @JsonKey(name: 'model') String model,
      @JsonKey(name: 'vendor') String? vendor,
      @JsonKey(name: 'category') String? category,
      @JsonKey(name: 'isGroup') bool? isGroup,
      @JsonKey(name: 'createTime') DateTime? createTime});
}

/// @nodoc
class _$PromptResCopyWithImpl<$Res, $Val extends PromptRes>
    implements $PromptResCopyWith<$Res> {
  _$PromptResCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PromptRes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = freezed,
    Object? title = null,
    Object? prompt = null,
    Object? maxContext = freezed,
    Object? promptExtend = freezed,
    Object? avatar = freezed,
    Object? file = freezed,
    Object? initMessage = freezed,
    Object? tags = freezed,
    Object? model = null,
    Object? vendor = freezed,
    Object? category = freezed,
    Object? isGroup = freezed,
    Object? createTime = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      maxContext: freezed == maxContext
          ? _value.maxContext
          : maxContext // ignore: cast_nullable_to_non_nullable
              as int?,
      promptExtend: freezed == promptExtend
          ? _value.promptExtend
          : promptExtend // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String?,
      initMessage: freezed == initMessage
          ? _value.initMessage
          : initMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String?,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      vendor: freezed == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      isGroup: freezed == isGroup
          ? _value.isGroup
          : isGroup // ignore: cast_nullable_to_non_nullable
              as bool?,
      createTime: freezed == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PromptImplCopyWith<$Res> implements $PromptResCopyWith<$Res> {
  factory _$$PromptImplCopyWith(
          _$PromptImpl value, $Res Function(_$PromptImpl) then) =
      __$$PromptImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') int id,
      @JsonKey(name: 'type') String? type,
      @JsonKey(name: 'title') String title,
      @JsonKey(name: 'prompt') String prompt,
      @JsonKey(name: 'maxContext') int? maxContext,
      @JsonKey(name: 'promptExtend') String? promptExtend,
      @JsonKey(name: 'avatar') String? avatar,
      @JsonKey(name: 'file') String? file,
      @JsonKey(name: 'initMessage') String? initMessage,
      @JsonKey(name: 'tags') String? tags,
      @JsonKey(name: 'model') String model,
      @JsonKey(name: 'vendor') String? vendor,
      @JsonKey(name: 'category') String? category,
      @JsonKey(name: 'isGroup') bool? isGroup,
      @JsonKey(name: 'createTime') DateTime? createTime});
}

/// @nodoc
class __$$PromptImplCopyWithImpl<$Res>
    extends _$PromptResCopyWithImpl<$Res, _$PromptImpl>
    implements _$$PromptImplCopyWith<$Res> {
  __$$PromptImplCopyWithImpl(
      _$PromptImpl _value, $Res Function(_$PromptImpl) _then)
      : super(_value, _then);

  /// Create a copy of PromptRes
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = freezed,
    Object? title = null,
    Object? prompt = null,
    Object? maxContext = freezed,
    Object? promptExtend = freezed,
    Object? avatar = freezed,
    Object? file = freezed,
    Object? initMessage = freezed,
    Object? tags = freezed,
    Object? model = null,
    Object? vendor = freezed,
    Object? category = freezed,
    Object? isGroup = freezed,
    Object? createTime = freezed,
  }) {
    return _then(_$PromptImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      prompt: null == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String,
      maxContext: freezed == maxContext
          ? _value.maxContext
          : maxContext // ignore: cast_nullable_to_non_nullable
              as int?,
      promptExtend: freezed == promptExtend
          ? _value.promptExtend
          : promptExtend // ignore: cast_nullable_to_non_nullable
              as String?,
      avatar: freezed == avatar
          ? _value.avatar
          : avatar // ignore: cast_nullable_to_non_nullable
              as String?,
      file: freezed == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as String?,
      initMessage: freezed == initMessage
          ? _value.initMessage
          : initMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as String?,
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as String,
      vendor: freezed == vendor
          ? _value.vendor
          : vendor // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      isGroup: freezed == isGroup
          ? _value.isGroup
          : isGroup // ignore: cast_nullable_to_non_nullable
              as bool?,
      createTime: freezed == createTime
          ? _value.createTime
          : createTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PromptImpl implements _Prompt {
  _$PromptImpl(
      {@JsonKey(name: 'id') required this.id,
      @JsonKey(name: 'type') this.type,
      @JsonKey(name: 'title') required this.title,
      @JsonKey(name: 'prompt') required this.prompt,
      @JsonKey(name: 'maxContext') this.maxContext,
      @JsonKey(name: 'promptExtend') this.promptExtend,
      @JsonKey(name: 'avatar') this.avatar,
      @JsonKey(name: 'file') this.file,
      @JsonKey(name: 'initMessage') this.initMessage,
      @JsonKey(name: 'tags') this.tags,
      @JsonKey(name: 'model') required this.model,
      @JsonKey(name: 'vendor') this.vendor,
      @JsonKey(name: 'category') this.category,
      @JsonKey(name: 'isGroup') this.isGroup,
      @JsonKey(name: 'createTime') this.createTime});

  factory _$PromptImpl.fromJson(Map<String, dynamic> json) =>
      _$$PromptImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final int id;
  @override
  @JsonKey(name: 'type')
  final String? type;
  @override
  @JsonKey(name: 'title')
  final String title;
  @override
  @JsonKey(name: 'prompt')
  final String prompt;
  @override
  @JsonKey(name: 'maxContext')
  final int? maxContext;
  @override
  @JsonKey(name: 'promptExtend')
  final String? promptExtend;
  @override
  @JsonKey(name: 'avatar')
  final String? avatar;
  @override
  @JsonKey(name: 'file')
  final String? file;
  @override
  @JsonKey(name: 'initMessage')
  final String? initMessage;
  @override
  @JsonKey(name: 'tags')
  final String? tags;
  @override
  @JsonKey(name: 'model')
  final String model;
  @override
  @JsonKey(name: 'vendor')
  final String? vendor;
  @override
  @JsonKey(name: 'category')
  final String? category;
  @override
  @JsonKey(name: 'isGroup')
  final bool? isGroup;
  @override
  @JsonKey(name: 'createTime')
  final DateTime? createTime;

  @override
  String toString() {
    return 'PromptRes(id: $id, type: $type, title: $title, prompt: $prompt, maxContext: $maxContext, promptExtend: $promptExtend, avatar: $avatar, file: $file, initMessage: $initMessage, tags: $tags, model: $model, vendor: $vendor, category: $category, isGroup: $isGroup, createTime: $createTime)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PromptImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.maxContext, maxContext) ||
                other.maxContext == maxContext) &&
            (identical(other.promptExtend, promptExtend) ||
                other.promptExtend == promptExtend) &&
            (identical(other.avatar, avatar) || other.avatar == avatar) &&
            (identical(other.file, file) || other.file == file) &&
            (identical(other.initMessage, initMessage) ||
                other.initMessage == initMessage) &&
            (identical(other.tags, tags) || other.tags == tags) &&
            (identical(other.model, model) || other.model == model) &&
            (identical(other.vendor, vendor) || other.vendor == vendor) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.isGroup, isGroup) || other.isGroup == isGroup) &&
            (identical(other.createTime, createTime) ||
                other.createTime == createTime));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      type,
      title,
      prompt,
      maxContext,
      promptExtend,
      avatar,
      file,
      initMessage,
      tags,
      model,
      vendor,
      category,
      isGroup,
      createTime);

  /// Create a copy of PromptRes
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PromptImplCopyWith<_$PromptImpl> get copyWith =>
      __$$PromptImplCopyWithImpl<_$PromptImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PromptImplToJson(
      this,
    );
  }
}

abstract class _Prompt implements PromptRes {
  factory _Prompt(
      {@JsonKey(name: 'id') required final int id,
      @JsonKey(name: 'type') final String? type,
      @JsonKey(name: 'title') required final String title,
      @JsonKey(name: 'prompt') required final String prompt,
      @JsonKey(name: 'maxContext') final int? maxContext,
      @JsonKey(name: 'promptExtend') final String? promptExtend,
      @JsonKey(name: 'avatar') final String? avatar,
      @JsonKey(name: 'file') final String? file,
      @JsonKey(name: 'initMessage') final String? initMessage,
      @JsonKey(name: 'tags') final String? tags,
      @JsonKey(name: 'model') required final String model,
      @JsonKey(name: 'vendor') final String? vendor,
      @JsonKey(name: 'category') final String? category,
      @JsonKey(name: 'isGroup') final bool? isGroup,
      @JsonKey(name: 'createTime') final DateTime? createTime}) = _$PromptImpl;

  factory _Prompt.fromJson(Map<String, dynamic> json) = _$PromptImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  int get id;
  @override
  @JsonKey(name: 'type')
  String? get type;
  @override
  @JsonKey(name: 'title')
  String get title;
  @override
  @JsonKey(name: 'prompt')
  String get prompt;
  @override
  @JsonKey(name: 'maxContext')
  int? get maxContext;
  @override
  @JsonKey(name: 'promptExtend')
  String? get promptExtend;
  @override
  @JsonKey(name: 'avatar')
  String? get avatar;
  @override
  @JsonKey(name: 'file')
  String? get file;
  @override
  @JsonKey(name: 'initMessage')
  String? get initMessage;
  @override
  @JsonKey(name: 'tags')
  String? get tags;
  @override
  @JsonKey(name: 'model')
  String get model;
  @override
  @JsonKey(name: 'vendor')
  String? get vendor;
  @override
  @JsonKey(name: 'category')
  String? get category;
  @override
  @JsonKey(name: 'isGroup')
  bool? get isGroup;
  @override
  @JsonKey(name: 'createTime')
  DateTime? get createTime;

  /// Create a copy of PromptRes
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PromptImplCopyWith<_$PromptImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
