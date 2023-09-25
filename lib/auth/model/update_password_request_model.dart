class UpdatePasswordRequestModel {
  String? password;

  UpdatePasswordRequestModel({this.password});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['password'] = password;
    return data;
  }
}
