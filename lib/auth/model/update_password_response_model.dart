class UpdatePasswordResponseModel {
  String? token;

  UpdatePasswordResponseModel({this.token});

  UpdatePasswordResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }
}
