import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../theme/theme.dart';
import '../view/loginView.dart';
import 'auth_token_service.dart';

class LogoutService {
  static Future<void> logout(BuildContext context) async {
    //Delete all token
    final AuthService _authService = AuthService();
    await _authService.deleteAllTokens();

    //Redirection
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginView()));
  }
}