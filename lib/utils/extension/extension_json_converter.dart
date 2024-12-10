import 'package:json_annotation/json_annotation.dart';

// 定义一个JsonConverter实现类，用于转换DateTime数据类型。
class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  // 从JSON到Dart的转换：将日期字符串转换为DateTime对象。
  @override
  DateTime fromJson(String json) => DateTime.parse(json);

  // 从Dart到JSON的转换：将DateTime对象转换为日期字符串。
  @override
  String toJson(DateTime? value) {
    // 在这里返回当前时间的字符串表示
    return value == null ? DateTime.now().toIso8601String() : value.toIso8601String();
  }
}

class BoolConverter implements JsonConverter<bool?, String> {
  const BoolConverter();

  @override
  bool fromJson(String json) {
    if (json.toLowerCase() == 'true' || json == '1')
      return true;
    else
      return false;
  }

  @override
  String toJson(bool? object) {
    return object == true ? '1' : '0';
  }
}

class EnumConverter<T> implements JsonConverter<T, String> {
  const EnumConverter(this.values);

  final List<T> values;

  @override
  T fromJson(String json) {
    return values.firstWhere((e) => e.toString() == json);
  }

  @override
  String toJson(T object) {
    return object.toString();
  }
}
