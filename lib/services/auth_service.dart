import 'dart:convert';
import 'dart:developer';

import 'package:etravel_driver/app_bindings.dart';
import 'package:etravel_driver/config/app_constants.dart';
import 'package:etravel_driver/config/routes.dart';
import 'package:etravel_driver/services/api.dart';
import 'package:etravel_driver/services/user_data_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart' hide Response;

class AuthService extends GetxService {
  static final AuthService instance = AuthService._();
  factory AuthService() => instance;
  AuthService._();

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future sendOTP(String phone) async {
    final res = await Get.find<APIService>().api.post(
      '/auth/send-otp',
      data: {
        "phone": phone,
      },
    );
  }

  Future verifyOTPAndLogin(String phone, int otp) async {
    log('hi');
    final res = await Get.find<APIService>().api.post(
      '/auth/verify-phone-and-login',
      data: {
        "phone": phone,
        "otp": otp,
      },
    );
    await _saveTokens(res.data);
  }

  Future logout() async {
    final res = await Get.find<APIService>().api.delete(
          '/auth/logout',
        );

    await _secureStorage.deleteAll();
    await Get.deleteAll(force: true);
    AppBinding().dependencies();
    Get.toNamed(Routes.authScreen);
  }

  Future<void> _saveTokens(dynamic responseData) async {
    // log(responseData["accessToken"]);
    // log(responseData["refreshToken"]);
    final accessToken = responseData["accessToken"];
    final refreshToken = responseData["refreshToken"];
    final userProfile = responseData["user"];

    await _secureStorage.write(key: ACCESS_TOKEN_KEY, value: accessToken);
    await _secureStorage.write(key: REFRESH_TOKEN_KEY, value: refreshToken);
    await _secureStorage.write(
        key: USER_PROFILE_KEY, value: json.encode(userProfile));
    await Get.find<UserDataService>().updateCurrentUser();
  }
}
