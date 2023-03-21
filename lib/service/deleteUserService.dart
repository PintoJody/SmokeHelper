import 'package:http/http.dart' as http;

import 'auth_token_service.dart';

Future<bool> deleteUserService(String userId) async {

  final response = await http.delete(
    Uri.parse('https://smokehelperapi.hop.sh/users/$userId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );

  print(response.statusCode);

  if (response.statusCode == 200) {
    // Success
    return true;
  } else {
    // Error
    return false;
  }
}