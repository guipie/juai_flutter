import 'package:json_annotation/json_annotation.dart';
part 'api_res.g.dart';

@JsonSerializable(createToJson: false)
class ApiRes<T> extends Object {
  @JsonKey(name: 'code')
  int code;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'message')
  String message;

  @JsonKey(fromJson: _apiResFromJson)
  T result;

  ApiRes(
    this.code,
    this.type,
    this.message,
    this.result,
  );
  factory ApiRes.fromJson(Map<String, dynamic> srcJson) => _$ApiResFromJson(srcJson);

  static T _apiResFromJson<T>(Object json) {
    if (json is Map<String, dynamic>) {
      if (T.toString() == 'AttentionEntity') {
        ApiRes.fromJson(json) as T;
      }
    } else if (json is List) {
      if (T.toString() == 'List') {
        return json.map((e) => ApiRes.fromJson(e as Map<String, dynamic>)).toList() as T;
      }
    }
    throw ArgumentError.value(
      json,
      'json',
      'Cannot convert the provided data.',
    );
  }
}

// @JsonSerializable(genericArgumentFactories: true)
// class ApiListRes<T> extends Object {
//   @JsonKey(name: 'code')
//   int code;

//   @JsonKey(name: 'type')
//   String type;

//   @JsonKey(name: 'message')
//   String message;

//   @JsonKey(name: 'result')
//   List<T> result;

//   ApiListRes(
//     this.code,
//     this.type,
//     this.message,
//     this.result,
//   );
//   factory ApiListRes.fromJson(
//     Map<String, dynamic> json,
//     T Function(dynamic json) fromJsonT,
//   ) =>
//       _$ApiListResFromJson<T>(json, fromJsonT);

//   Map<String, dynamic> toJson(Object? Function(T value) toJsonT) => _$ApiListResToJson<T>(this, toJsonT);
// }
