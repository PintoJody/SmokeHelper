import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../model/UserModel.dart';

class UpdateResponse {
  bool success;
  String data;

  UpdateResponse({required this.success, required this.data});
}

class UpdateService {
  static Future<UpdateResponse> update(String id, {String? username, String? password, String? email, String? usernameEmail, UserCigInfo? userCigInfo, String? featuredBadge}) async {
    final url = Uri.parse('https://smokehelperapi.hop.sh/users/$id');
    final request = http.MultipartRequest('PUT', url);
    request.headers['Content-Type'] = 'multipart/form-data';

    if (username != null) {
      request.fields['username'] = username;
    }
    if (password != null) {
      request.fields['password'] = password;
    }
    if (email != null) {
      request.fields['email'] = email;
    }
    if (usernameEmail != null) {
      request.fields['usernameEmail'] = usernameEmail;
    }
    if (userCigInfo != null) {
      final Map<String, String> cigInfoMap = userCigInfo.toMap().map((key, value) => MapEntry(key, value.toString()));
      request.fields['cigInfo'] = json.encode(cigInfoMap);
    }
    if (featuredBadge != null) {
      request.fields['featuredBadge'] = featuredBadge;
    }

    try {
      final response = await request.send();
      final responseData = await response.stream.transform(utf8.decoder).join();

      if (response.statusCode == 200) {
        return UpdateResponse(success: true, data: responseData);
      } else {
        return UpdateResponse(success: false, data: responseData);
      }
    } catch (e) {
      print("Erreur lors de la connexion au serveur : $e");
      return UpdateResponse(success: false, data: e.toString());
    }
  }


}
