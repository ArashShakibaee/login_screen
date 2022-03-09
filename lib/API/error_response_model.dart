class ErrorResponse {
  String? errorCode;
  String? errorId;
  String? errorMessage;
  String? name;
  String? token;

  ErrorResponse(
      {this.errorCode, this.errorId, this.errorMessage, this.name, this.token});

  ErrorResponse.fromJson(Map<String, dynamic> json) {
    errorCode = json['errorCode'];
    errorId = json['errorId'];
    errorMessage = json['errorMessage'];
    name = json['name'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['errorCode'] = errorCode;
    data['errorId'] = errorId;
    data['errorMessage'] = errorMessage;
    data['name'] = name;
    data['token'] = token;
    return data;
  }
}
