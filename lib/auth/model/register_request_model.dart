class RegisterRequestModel {
  String? email;
  String? name;
  String? password;

  RegisterRequestModel({this.email, this.password, this.name});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['name'] = name;
    data['password'] = password;
    return data;
  }
}
