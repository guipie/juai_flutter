import 'package:json_annotation/json_annotation.dart';

import '../../constants/enums/enum_base.dart';
import '../../services/db/db_base.dart';
import '../util.dart';

// 定义一个JsonConverter实现类，用于转换DateTime数据类型。
class DateTimeConverter implements JsonConverter<DateTime, String> {
  const DateTimeConverter();

  // 从JSON到Dart的转换：将日期字符串转换为DateTime对象。
  @override
  DateTime fromJson(String json) => DateUtil.getDateTime(json) ?? DateTime.now();

  // 从Dart到JSON的转换：将DateTime对象转换为日期字符串。
  @override
  String toJson(DateTime? value) {
    // 在这里返回当前时间的字符串表示
    return value == null ? DateTime.now().toIso8601String() : value.toIso8601String();
  }
}

class BoolConverter implements JsonConverter<bool?, dynamic> {
  const BoolConverter();

  @override
  bool? fromJson(dynamic json) {
    if (json.toString().toLowerCase() == 'true' || json == '1')
      return true;
    else
      return false;
  }

  @override
  String toJson(bool? object) {
    return object == true ? '1' : '0';
  }
}

class EnumConverter<Enum> implements JsonConverter<Enum, String> {
  const EnumConverter(this.values);

  final List<Enum> values;

  @override
  Enum fromJson(String json) {
    return values.firstWhere((e) => e.toString() == json);
  }

  @override
  String toJson(Enum object) {
    return object.toString();
  }
}
