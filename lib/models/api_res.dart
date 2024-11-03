import 'package:json_annotation/json_annotation.dart';

part 'api_res.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiRes<T> extends Object {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'result')
  T result;

  ApiRes(
    this.code,
    this.type,
    this.message,
    this.result,
  );
  factory ApiRes.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) =>
      _$ApiResFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$ApiResToJson<T>(this, toJsonT);
}

@JsonSerializable(genericArgumentFactories: true)
class ApiListRes<T> extends Object {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(name: 'result')
  List<T> result;

  ApiListRes(
    this.code,
    this.type,
    this.message,
    this.result,
  );
  factory ApiListRes.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) fromJsonT,
  ) =>
      _$ApiListResFromJson<T>(json, fromJsonT);

  Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$ApiListResToJson<T>(this, toJsonT);
}
