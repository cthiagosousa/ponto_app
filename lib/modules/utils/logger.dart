import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

void logMsg(String message, [Object? error, StackTrace? stackTrace]) {
  if(kDebugMode) {
    log(message, error: error, stackTrace: stackTrace);
  }
}
void infoMsg(String message, [Object? error, StackTrace? stackTrace]) {
  if(kDebugMode) {
    log(message, error: error, stackTrace: stackTrace);
  }
}
void errorMsg(String message, [Object? error, StackTrace? stackTrace]) {
  if(kDebugMode) {
    final logger = Logger();
    logger.e(message, error, stackTrace);
  }
}
void warningMsg(String message, [Object? error, StackTrace? stackTrace]) {
  if(kDebugMode) {
    final logger = Logger();
    logger.w(message, error, stackTrace);
  }
}