import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

var _logger = Logger(
  printer: PrettyPrinter(
    methodCount: 2, // Number of method calls to be displayed
    errorMethodCount: 8, // Number of method calls if stacktrace is provided
    lineLength: 120, // Width of the output
    colors: true, // Colorful log messages
    printEmojis: true, // Print an emoji for each log message
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
