import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import '../model/UserModel.dart';

class RegisterService {
  static Future<void> register(User user) async {
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
        print(responseData);
      } else {
        print("Erreur lors de l'inscription");
      }
    } catch (e) {
      print("Erreur lors de la connexion au serveur : $e");
    }
  }
}