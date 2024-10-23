import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_utils/get_utils.dart';

/// ====================================================== 以下内容为工具方法 ======================================================

/// 解析数据
String parseData(data) {
  String responseStr = "";
  if (data is Map) {
    responseStr += data.mapToStructureString();
  } else if (data is FormData) {
    final formDataMap = {}
      ..addEntries(data.fields)
      ..addEntries(data.files);
    responseStr += formDataMap.mapToStructureString();
  } else if (data is List) {
    responseStr += data.listToStructureString();
  } else {
    responseStr += data.toString();
  }
  return responseStr;
}

/// 分段 log，可以写到 log 中。
void logWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

/// Map 拓展，Map 转结构化字符串输出。
extension Map2StringEx on Map {
  String mapToStructureString({int indentation = 0, String space = "  "}) {
    if (isEmpty) {
      return "$this";
    }
    String result = "";
    String indentationContent = space * indentation;
    result += "{";
    forEach((key, value) {
      if (value is Map) {
        result += "\n$indentationContent" +
            "\"$key\": ${value.mapToStructureString(indentation: indentation + 1)},";
      } else if (value is List) {
        result += "\n$indentationContent" +
            "\"$key\": ${value.listToStructureString(indentation: indentation + 1)},";
      } else {
        result += "\n$indentationContent" +
            "\"$key\": ${value is String ? "\"$value\"," : "$value,"}";
      }
    });
    result = result.substring(0, result.length - 1); // 去掉最后一个逗号
    result += "\n$indentationContent}";
    return result;
  }
}

/// List 拓展，List 转结构化字符串输出。
extension List2StringEx on List {
  String listToStructureString({int indentation = 0, String space = "  "}) {
    if (isBlank!) {
      return "$this";
    }
    String result = "";
    String indentationContent = space * indentation;
    result += "[";
    for (var value in this) {
      if (value is Map) {
        result +=
            "\n$indentationContent$space${value.mapToStructureString(indentation: indentation + 1)},"; // 加空格更好看
      } else if (value is List) {
        result += value.listToStructureString(indentation: indentation + 1);
      } else {
        result +=
            "\n$indentationContent${value is String ? "\"$value\"," : "$value,"}";
      }
    }
    result = result.substring(0, result.length - 1); // 去掉最后一个逗号
    result += "\n$indentationContent]";
    return result;
  }
}

class Toast {
  Toast._() {
    // EasyLoading 已全局初始化构建
    // EasyLoading.instance.loadingStyle = EasyLoadingStyle.custom;
    // 此处可自定义风格
  }
  static final Toast _instance = Toast._();

  static const String SUCCESS = "SUCCESS";
  static const String ERROR = "ERROR";
  static const String WARNING = "WARNING";
  static const String INFO = "INFO";

  static loading(String msg) {
    EasyLoading.show(status: msg);
  }

  static progeress(double value, String msg) {
    EasyLoading.showProgress(value, status: msg);
  }

  static show(String msg, {String? type}) {
    switch (type) {
      case Toast.SUCCESS:
        EasyLoading.showSuccess(msg);
        break;
      case Toast.ERROR:
        EasyLoading.showError(msg);
        break;
      case Toast.WARNING:
        EasyLoading.showInfo(msg);
        break;
      case Toast.INFO:
      default:
        EasyLoading.showToast(msg);
        break;
    }
  }

  static hide() {
    EasyLoading.dismiss();
  }
}
