import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

import '../../services/http/interceptor/api_exception.dart';

var _logger = Logger(
  printer: PrettyPrinter(
    colors: true, // 启用颜色
    printEmojis: true, // 启用表情符号
    lineLength: 120, // 每行的最大长度
    // levelColors: {
    //   Level.trace: AnsiColor.fg(AnsiColor.grey(0.5)), // 灰色
    //   Level.debug: AnsiColor.fg(AnsiColor.blue(1.0)), // 蓝色
    //   Level.info: AnsiColor.fg(AnsiColor.green(1.0)), // 绿色
    //   Level.warning: AnsiColor.fg(AnsiColor.yellow(1.0)), // 黄色
    //   Level.error: AnsiColor.fg(AnsiColor.red(1.0)), // 红色
    //   Level.wtf: AnsiColor.fg(AnsiColor.magenta(1.0)), // 洋红色
    // },
    methodCount: 2, // Number of method calls to be displayed
    errorMethodCount: 8, // Number of method calls if stacktrace is provided
    // Should each log print contain a timestamp
    dateTimeFormat: DateTimeFormat.onlyTimeAndSinceStart,
  ),
);

extension ExtensionLog on Object? {
  void e() {
    if (this == null) return;
    _logger.log(Level.error, this);
  }

  void w() {
    if (this == null) return;
    _logger.log(Level.warning, this);
  }

  void i() {
    if (this == null) return;
    _logger.log(Level.info, this);
  }

  void d() {
    if (this == null) return;
    _logger.log(Level.debug, this);
  }

  void v() {
    if (this == null) return;
    _logger.log(Level.trace, this);
  }

  void fatal() {
    if (this == null) return;
    _logger.log(Level.fatal, this);
  }
}

extension ExtensionException on ApiException {}
