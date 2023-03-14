import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final storage = FlutterSecureStorage();

  // Stockage du jeton d'authentification
  Future<void> setAuthToken(String token) async {
    await storage.write(key: 'authToken', value: token);
  }

  // Récupération du jeton d'authentification
  Future<String?> getAuthToken() async {
    final token = await storage.read(key: 'authToken');
    return token;
  }

  // Suppression du jeton d'authentification
  Future<void> deleteAllTokens() async {
    await storage.deleteAll();
  }

}