import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/UserModel.dart';

class LoginResponse {
  bool success;
  String data;

  LoginResponse({required this.success, required this.data});
}

class LoginService {
  static Future<LoginResponse> login(User user) async {
    final url = Uri.parse('https://smokehelperapi.hop.sh/users/login');
    final request = http.MultipartRequest('POST', url);
    request.headers['Content-Type'] = 'multipart/form-data';
    request.fields['usernameEmail'] = user.usernameEmail;
    request.fields['password'] = user.password;

    try {
      final response = await request.send();
      final responseData = await response.stream.transform(utf8.decoder).join();

      if (response.statusCode == 200) {
        return LoginResponse(success: true, data: responseData);
      } else {
        return LoginResponse(success: false, data: responseData);
      }
    } catch (e) {
      print("Erreur lors de la connexion au serveur : $e");
      return LoginResponse(success: false, data: e.toString());
    }
  }
}