class ResetResponseModel {
  String? token;

  ResetResponseModel({this.token});

  ResetResponseModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }
}
