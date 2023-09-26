import '/auth/model/update_password_request_model.dart';
import '/auth/model/update_password_response_model.dart';
import '/auth/model/reset_request_model.dart';
import '/auth/model/reset_response_model.dart';
import '/auth/model/login_request_model.dart';
import '/auth/model/login_response_model.dart';
import '/auth/model/register_request_model.dart';
import '/auth/model/register_response_model.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:flutter_config/flutter_config.dart';

/// LoginService responsible to communicate with web-server
/// via authenticaton related APIs
class LoginService extends GetConnect {
  final String loginUrl =
      FlutterConfig.get('API_DOMAIN') + FlutterConfig.get('API_LOGIN_PATH');
  final String registerUrl =
      FlutterConfig.get('API_DOMAIN') + FlutterConfig.get('API_REGISTER_PATH');
  final String resetUrl = FlutterConfig.get('API_DOMAIN') +
      FlutterConfig.get('API_RESET_PASSWORD_PATH');
  final String updateUrl = FlutterConfig.get('API_DOMAIN') +
      FlutterConfig.get('API_UPDATE_PASSWORD_PATH');

  Future<LoginResponseModel?> fetchLogin(LoginRequestModel model) async {
    final response = await post(loginUrl, model.toJson());

    if (response.statusCode == HttpStatus.ok) {
      return LoginResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }

  Future<RegisterResponseModel?> fetchRegister(
      RegisterRequestModel model) async {
    final response = await post(registerUrl, model.toJson());

    if (response.statusCode == HttpStatus.ok) {
      return RegisterResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }

  Future<ResetResponseModel?> fetchReset(ResetRequestModel model) async {
    final response = await post(registerUrl, model.toJson());

    if (response.statusCode == HttpStatus.ok) {
      return ResetResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }

  Future<UpdatePasswordResponseModel?> fetchUpdatePassword(
      UpdatePasswordRequestModel model) async {
    final response = await put(updateUrl, model.toJson());

    if (response.statusCode == HttpStatus.ok) {
      return UpdatePasswordResponseModel.fromJson(response.body);
    } else {
      return null;
    }
  }
}
