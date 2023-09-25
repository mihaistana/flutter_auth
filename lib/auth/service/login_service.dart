import '/auth/model/reset_request_model.dart';
import '/auth/model/reset_response_model.dart';
import '/auth/model/login_request_model.dart';
import '/auth/model/login_response_model.dart';
import '/auth/model/register_request_model.dart';
import '/auth/model/register_response_model.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

/// LoginService responsible to communicate with web-server
/// via authenticaton related APIs
class LoginService extends GetConnect {
  final String serviceUrl = 'http://juguetesusados.com.loc';
  final String loginUrl = serviceUrl + '/api/login';
  final String registerUrl = serviceUrl + '/api/register';
  final String resetUrl = serviceUrl + '/api/reset_password';
  final String updateUrl = serviceUrl + '/api/update_password';

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
