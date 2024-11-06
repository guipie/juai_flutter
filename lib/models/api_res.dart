import 'package:json_annotation/json_annotation.dart';

part 'api_res.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiRes<T> extends Object {
  int code;

  String type;

  String message;

  Object? extras;
  DateTime time;
  T? result;

  ApiRes(
    this.code,
    this.type,
    this.message,
    this.result,
    this.extras,
    this.time,
  );
  // factory ApiRes.fromJson(Map<String, dynamic> json, T Function(dynamic json)? func) => _$ApiResFromJson(json, func!);

  ApiRes.fromJson(Map<String, dynamic> srcJson, Function(Object)? func)
      : code = (srcJson['code'] as num).toInt(),
        type = srcJson['type'] as String,
        message = srcJson['message'] as String,
        result = _apiResFromJson(srcJson['result'], func),
        extras = srcJson['extras'],
        time = DateTime.parse(srcJson['time'] as String);

  static T _apiResFromJson<T>(Object json, Function(Object)? func) {
    if (json is Map<String, dynamic>) {
      return func!(json);
    } else if (json is List) {
      return func!(json);
      // return json.map((item) => func!(item) as dynamic).toList() as T;
    }
    return json as T;
  }

  // static T _apiResListFromJson<T>(Object json, Function(List<Map<String, dynamic>>)? func) {
  //   if (json is List) {
  //     return func!(json as List<Map<String, dynamic>>);
  //   }
  //   return json as T;
  // }
}

class ApiListRes<T> extends Object {
  int code;

  String type;

  String message;

  Object? extras;
  DateTime time;
  List<T>? result;

  ApiListRes(
    this.code,
    this.type,
    this.message,
    this.result,
    this.extras,
    this.time,
  );
  // factory ApiRes.fromJson(Map<String, dynamic> json, T Function(dynamic json)? func) => _$ApiResFromJson(json, func!);

  ApiListRes.fromJson(Map<String, dynamic> srcJson, T Function(dynamic)? func)
      : code = (srcJson['code'] as num).toInt(),
        type = srcJson['type'] as String,
        message = srcJson['message'] as String,
        result = _apiResFromJson(srcJson['result'], func),
        extras = srcJson['extras'],
        time = DateTime.parse(srcJson['time'] as String);

  static List<T> _apiResFromJson<T>(Object json, T Function(dynamic)? func) {
    return (json as List).map((item) => func!(item)).toList();
  }
}
