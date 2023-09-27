import 'dart:developer' as developer;
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
import 'package:http/http.dart' as http;
import 'dart:convert';

/// LoginService responsible to communicate with web-server
/// via authenticaton related APIs
class LoginService extends GetConnect {
  static var client = http.Client();

  Future<LoginResponseModel?> fetchLogin(LoginRequestModel model) async {
    final String loginUrl =
        FlutterConfig.get('API_DOMAIN') + FlutterConfig.get('API_LOGIN_PATH');

    final response = await client.post(Uri.parse(loginUrl),
        body: jsonEncode(model.toJson()),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        });

    if (response.statusCode == HttpStatus.ok) {
      return LoginResponseModel.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future<RegisterResponseModel?> fetchRegister(
      RegisterRequestModel model) async {
    final String registerUrl = FlutterConfig.get('API_DOMAIN') +
        FlutterConfig.get('API_REGISTER_PATH');

    developer.log(registerUrl);
    developer.log(model.toJson().toString());
    final response = await client.post(Uri.parse(registerUrl),
        body: jsonEncode(model.toJson()),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        });
    developer.log(response.body);
    if (response.statusCode == HttpStatus.ok) {
      return RegisterResponseModel.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future<ResetResponseModel?> fetchReset(ResetRequestModel model) async {
    final String resetUrl = FlutterConfig.get('API_DOMAIN') +
        FlutterConfig.get('API_RESET_PASSWORD_PATH');
    final response = await client.post(Uri.parse(resetUrl),
        body: jsonEncode(model.toJson()),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        });

    if (response.statusCode == HttpStatus.ok) {
      return ResetResponseModel.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }

  Future<UpdatePasswordResponseModel?> fetchUpdatePassword(
      UpdatePasswordRequestModel model) async {
    final String updateUrl = FlutterConfig.get('API_DOMAIN') +
        FlutterConfig.get('API_UPDATE_PASSWORD_PATH');
    final response = await client.put(Uri.parse(updateUrl),
        body: jsonEncode(model.toJson()),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        });

    if (response.statusCode == HttpStatus.ok) {
      return UpdatePasswordResponseModel.fromJson(jsonDecode(response.body));
    } else {
      return null;
    }
  }
}
