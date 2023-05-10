import 'package:intl/intl.dart';

/// 格式化时间
String TimeLineFormat(DateTime dt) {
  var now = DateTime.now();
  var difference = now.difference(dt);
  if (difference.inSeconds < 60) {
    return "${difference.inSeconds + 1}秒前";
  }
  // 1分钟内
  if (difference.inMinutes < 60) {
    return "${difference.inMinutes}分钟前";
  }
  // 1天内
  if (difference.inHours < 24) {
    return "${difference.inHours}小时前";
  }
  // 30天内
  else if (difference.inDays < 30) {
    return "${difference.inDays}天前";
  }
  // MM-dd
  else if (difference.inDays < 365) {
    final dtFormat = new DateFormat('MM-dd');
    return dtFormat.format(dt);
  }
  // yyyy-MM-dd
  else {
    final dtFormat = new DateFormat('yyyy-MM-dd');
    var str = dtFormat.format(dt);
    return str;
  }
}

String TimeStrLineFormat(String date) {
  var dt = DateTime.tryParse(date);
  return TimeLineFormat(dt ?? DateTime.now());
}

String dateFormatYMDHMS(DateTime dt) {
  return DateFormat("yyyy-MM-dd HH:mm:ss").format(dt);
}

String dateFormat(DateTime? dt, {String? fmt}) {
  dt = dt ?? DateTime.now();
  fmt = fmt ?? "yyyy-MM-dd HH:mm:ss";
  return DateFormat(fmt).format(dt);
}
