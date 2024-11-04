class ApiRes<T> extends Object {
  int code;

  String type;

  String message;

  Object? extras;
  DateTime time;
  T result;

  ApiRes(
    this.code,
    this.type,
    this.message,
    this.result,
    this.extras,
    this.time,
  );

  ApiRes.fromJson(Map<String, dynamic> srcJson, Function(Map<String, dynamic>)? func)
      : code = (srcJson['code'] as num).toInt(),
        type = srcJson['type'] as String,
        message = srcJson['message'] as String,
        result = _apiResFromJson(srcJson['result'], func),
        extras = srcJson['extras'],
        time = DateTime.parse(srcJson['time'] as String);

  static T _apiResFromJson<T>(Object json, Function(Map<String, dynamic>)? func) {
    if (json is Map<String, dynamic>) {
      return func!(json);
    } else if (json is List) {
      return json.map((e) => func!(e as Map<String, dynamic>)).toList() as T;
    }
    return json as T;
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
