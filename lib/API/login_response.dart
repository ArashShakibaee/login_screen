import 'package:http/http.dart'as http;
import 'package:login_screen/API/error_response_model.dart';
import 'package:login_screen/API/login_model.dart';
import 'dart:convert';
import 'dart:io';

class LoginResponse{
  static Future<LoginModel?> getLoginStatus(LoginModel model) async {
    try {
      final response = await http.post(Uri.parse('https://172.16.1.10:8010/front/login.html'),
          body: json.encode(model.toJson()));
      switch (response.statusCode) {
        case 200:
            return LoginModel.fromJson(response.body as Map<String, dynamic>);
        case 500:
          var error = ErrorResponse.fromJson(response.body as Map<String, dynamic>);
          throw error;

        case 401:
          var error = ErrorResponse.fromJson(response.body as Map<String, dynamic>);
          error.errorCode = 401 as String;
          throw error;
      }
    } on SocketException {
      throw ErrorResponse(errorMessage: 'No Internet connection 😑');
    } on HttpException {
      throw ErrorResponse(errorMessage: "Couldn't find the post 😱");
    } on FormatException {
      throw ErrorResponse(errorMessage: "Bad response format 👎");
    }
  }
}