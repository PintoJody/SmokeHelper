import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  final storage = FlutterSecureStorage();

  // Stockage du jeton d'authentification
  Future<void> setAuthToken(String key, String token) async {
    await storage.write(key: key, value: token);
  }

  // Récupération du jeton d'authentification
  Future<String?> getAuthToken(String key) async {
    final token = await storage.read(key: key);
    return token;
  }

  // Suppression du jeton d'authentification
  Future<void> deleteAllTokens() async {
    await storage.deleteAll();
  }

}