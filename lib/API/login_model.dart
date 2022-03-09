class LoginModel {
  String? userName;
  String? userPassword;

  LoginModel({this.userName, this.userPassword});

  LoginModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    userPassword = json['userPassword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['userName'] = userName;
    data['userPassword'] = userPassword;
    return data;
  }
}
