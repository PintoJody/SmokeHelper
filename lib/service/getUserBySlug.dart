import 'package:http/http.dart' as http;
import 'dart:convert';

import 'auth_token_service.dart';

class GetResponse {
  bool success;
  String data;

  GetResponse({required this.success, required this.data});
}

class getUserBySlugService {
  final AuthService _authService = AuthService();

  Future<GetResponse> getUser() async {
    final slug = await _authService.getAuthToken('slug');
    final url = Uri.parse('https://smokehelperapi.hop.sh/users/$slug');
    final request = http.MultipartRequest('GET', url);

    try {
      final response = await request.send();
      final responseData = await response.stream.transform(utf8.decoder).join();

      if (response.statusCode == 200) {
        return GetResponse(success: true, data: responseData);
      } else {
        return GetResponse(success: false, data: responseData);
      }
    } catch (e) {
      print("Erreur lors de la connexion au serveur : $e");
      return GetResponse(success: false, data: e.toString());
    }
  }
}
