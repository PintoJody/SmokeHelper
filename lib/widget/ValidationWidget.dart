import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../service/auth_token_service.dart';
import '../theme/theme.dart';

class ValidationWidget extends StatefulWidget {
  final bool isUserConfirmed;

  ValidationWidget({required this.isUserConfirmed});

  @override
  _ValidationWidgetState createState() => _ValidationWidgetState();
}

class _ValidationWidgetState extends State<ValidationWidget> {
  final TextEditingController _tokenController = TextEditingController();

  Future<bool> _confirmEmail(String token) async {
    // final url = 'https://smokehelperapi.hop.sh/users/confirmMail/$token';

    final AuthService _authService = AuthService();
    final userId = await _authService.getAuthToken("userId");
    final url = Uri.parse('https://smokehelperapi.hop.sh/users/confirmMail/$token');
    final request = http.MultipartRequest('POST', url);
    request.headers['Content-Type'] = 'multipart/form-data';
    request.fields['userId'] = userId!;

    try {
      final response = await request.send();

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print("Erreur lors de la connexion au serveur : $e");
      return false;
    }

  }

  @override
  Widget build(BuildContext context) {
    if (widget.isUserConfirmed) {
      return SizedBox.shrink(); // si l'utilisateur est confirmé, on retourne un widget vide
    } else {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _tokenController,
              decoration: InputDecoration(
                labelText: 'Entrez votre token de validation',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre token de validation';
                }
                return null;
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(CustomTheme.bgWhiteColor),
              ),
              onPressed: () {
                final token = _tokenController.text;
                if (token.isNotEmpty) {
                  _confirmEmail(token);
                }
              },
              child: Text('Confirmez votre email', style: TextStyle(color: CustomTheme.greenColor)),
            ),
          ],
        ),
      );
    }
  }

  @override
  void dispose() {
    _tokenController.dispose();
    super.dispose();
  }
}
