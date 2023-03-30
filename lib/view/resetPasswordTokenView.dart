import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../service/auth_token_service.dart';
import '../service/resetPasswordService.dart';
import '../theme/theme.dart';
import 'loginView.dart';

class ResetPasswordTokenView extends StatefulWidget {
  const ResetPasswordTokenView({Key? key}) : super(key: key);

  @override
  State<ResetPasswordTokenView> createState() => _ResetPasswordTokenView();
}

class _ResetPasswordTokenView extends State<ResetPasswordTokenView> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  String? _tokenError;
  String? _passwordError;
  late String _token;
  late String _new;

  Future<void> _newPassword() async {
    final responseJson = await ResetPasswordService.resetPasswordToken(_token, _new);

    //Format data
    Map<String, dynamic> responseData;
    responseData = await json.decode(responseJson.data);

    if (responseJson.success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Votre mot de passe a bien été modifié'),
          duration: Duration(seconds: 2),
          backgroundColor: CustomTheme.successColor,
        ),
      );

      await _authService.setAuthToken('userId', responseData["data"]["_id"]);


    }else{
      setState(() {
        _passwordError = responseData['newPw'];
        _passwordError = responseData['token'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: CustomTheme.greenColor,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 180,
                      child: SvgPicture.asset(
                        'assets/LOGO.svg',
                        fit: BoxFit.contain,
                      ),
                    ),
                    const Text(
                      'Code de vérification',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Veuillez entrer votre code de vérification reçu',
                        labelStyle: TextStyle(
                          color: CustomTheme.bgWhiteColor,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: CustomTheme.bgWhiteColor),
                        ),
                      ),
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Vous devez remplir ce champ";
                        }else if (_tokenError != null) {
                          return _tokenError;
                        }
                        return null;
                      },
                      onSaved: (value) => _token = value!,
                    ),
                    const SizedBox(height: 40.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Nouveau mot de passe *',
                        labelStyle: TextStyle(
                          color: CustomTheme.bgWhiteColor,
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: CustomTheme.bgWhiteColor),
                        ),
                      ),
                      obscureText: true,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return "Veuillez entrer un mot de passe";
                        }else if (_passwordError != null) {
                          return _passwordError;
                        }
                        return null;
                      },
                      onSaved: (value) => _new = value!,
                    ),
                    const SizedBox(height: 8.0),
                    const Text('* doit comporter au moins 8 characteres avec une lettre et un chiffre', style: TextStyle(fontSize: 10.0, color: CustomTheme.bgWhiteColor), textAlign: TextAlign.start,),
                    const SizedBox(height: 40.0),
                    SizedBox(
                        width: 200.0,
                        height: 50.0,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(CustomTheme.bgWhiteColor),
                          ),
                          onPressed: () {
                            if(_formKey.currentState?.validate() ?? false){
                              _formKey.currentState?.save();
                              _newPassword();
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Problème lors de l\'envoi'),
                                  duration: Duration(seconds: 3),
                                  backgroundColor: CustomTheme.warningColor,
                                ),
                              );
                            }
                          },
                          child: const Text(
                            "Envoyer",
                            style: TextStyle(color: CustomTheme.greyColor),
                          ),
                        )
                    ),
                    SizedBox(height: 35.0),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Retour à la page de connexion',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ]
              ),
            ),
          ),
        )
    );
  }
}
