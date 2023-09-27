import '/core/authentication_manager.dart';
//import '/core/cache_manager.dart';
import '/auth/model/login_request_model.dart';
import '/auth/model/register_request_model.dart';
import '/auth/model/reset_request_model.dart';
import '/auth/model/update_password_request_model.dart';
import '/auth/service/login_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'dart:developer' as developer;

class LoginViewModel extends GetxController {
  late final LoginService _loginService;
  late final AuthenticationManager _authManager;

  @override
  void onInit() {
    super.onInit();
    _loginService = Get.put(LoginService());
    _authManager = Get.find();
  }

  Future<void> loginUser(String email, String password) async {
    final response = await _loginService
        .fetchLogin(LoginRequestModel(email: email, password: password));

    developer.log(response.toString());

    if (response != null) {
      /// Set isLogin to true
      _authManager.login(response.token);
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: 'User not found!',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }

  Future<void> registerUser(String email, String password, String name) async {
    final response = await _loginService.fetchRegister(
        RegisterRequestModel(email: email, password: password, name: name));

    if (response != null) {
      /// Set isLogin to true
      _authManager.login(response.token);
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: 'Register Error',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }

  Future<void> resetPassword(String email) async {
    final response =
        await _loginService.fetchReset(ResetRequestModel(email: email));

    if (response != null) {
      /// Set isLogin to true
      _authManager.login(response.token);
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: 'User not found!',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }

  Future<void> updatePassword(String password) async {
    final response = await _loginService
        .fetchUpdatePassword(UpdatePasswordRequestModel(password: password));

    if (response != null) {
      /// Set isLogin to true
      _authManager.login(response.token);
    } else {
      /// Show user a dialog about the error response
      Get.defaultDialog(
          middleText: 'User not found!',
          textConfirm: 'OK',
          confirmTextColor: Colors.white,
          onConfirm: () {
            Get.back();
          });
    }
  }
}
