import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

class ETravelException implements Exception {
  const ETravelException([this.message = defaultMessage]);
  final String message;

  static const String defaultMessage = 'Unknown Error';

  factory ETravelException.fromPlatformException(PlatformException e) {
    String msg = defaultMessage;
    switch (e.code) {
      case 'sign_in_cancelled':
        msg = 'Sign-in cancelled';
        break;
      case 'sign_in_failed':
        msg = 'Sign-in failed';
        break;
      case 'network_error':
        msg = 'Check your internet connection';
        break;
      default:
        e.message ?? defaultMessage;
        break;
    }
    return ETravelException(msg);
  }
  factory ETravelException.fromDioException(DioError e) {
    String msg = defaultMessage;

    msg = e.response?.data['msg'] ?? e.message;

    return ETravelException(msg);
  }

  @override
  String toString() {
    return message;
  }
}
