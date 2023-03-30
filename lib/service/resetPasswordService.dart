import 'package:http/http.dart' as http;
import 'dart:convert';

class GetResponse {
  bool success;
  String data;

  GetResponse({required this.success, required this.data});
}

class ResetPasswordService {

  static Future<GetResponse> resetPasswordEmail(String email) async {
    final url = Uri.parse('https://smokehelperapi.hop.sh/users/resetPassword/$email');
    final request = http.MultipartRequest('GET', url);
    request.headers['Content-Type'] = 'multipart/form-data';

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
