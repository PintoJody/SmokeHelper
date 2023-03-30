import 'package:http/http.dart' as http;
import 'dart:convert';


class getResponse {
  bool success;
  String data;

  getResponse({required this.success, required this.data});
}

class addBadgeService {
  static Future<getResponse> addBadge(String userId, String badgeId) async {
    final url = Uri.parse('https://smokehelperapi.hop.sh/users/addBadgeTo/$userId');
    final request = http.MultipartRequest('POST', url);
    request.headers['Content-Type'] = 'multipart/form-data';
    request.fields['badge'] = badgeId;

    try {
      final response = await request.send();
      final responseData = await response.stream.transform(utf8.decoder).join();

      if (response.statusCode == 200) {
        return getResponse(success: true, data: responseData);
      } else {
        return getResponse(success: false, data: responseData);
      }
    } catch (e) {
      print("Erreur lors de la connexion au serveur : $e");
      return getResponse(success: false, data: e.toString());
    }
  }
}