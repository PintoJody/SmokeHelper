import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/UserModel.dart';

class RegisterResponse {
  bool success;
  String data;

  RegisterResponse({required this.success, required this.data});
}

class RegisterService {
  static Future<RegisterResponse> register(User user) async {
    final url = Uri.parse('https://smokehelperapi.hop.sh/users/register');
    final request = http.MultipartRequest('POST', url);
    request.headers['Content-Type'] = 'multipart/form-data';
    request.fields['username'] = user.username;
    request.fields['password'] = user.password;
    request.fields['email'] = user.email;

    try {
      final response = await request.send();
      final responseData = await response.stream.transform(utf8.decoder).join();

      if (response.statusCode == 200) {
        return RegisterResponse(success: true, data: responseData);
      } else {
        return RegisterResponse(success: false, data: responseData);
      }
    } catch (e) {
      print("Erreur lors de la connexion au serveur : $e");
      return RegisterResponse(success: false, data: e.toString());
    }
  }
}