import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smoke_helper/view/resetPasswordTokenView.dart';
import '../service/auth_token_service.dart';
import '../service/resetPasswordService.dart';
import '../theme/theme.dart';
import '../widget/HeaderNavigationView.dart';
import 'loginView.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _resetPasswordState();
}

class _resetPasswordState extends State<ResetPassword> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  String? _emailError;
  late String _email;

  Future<void> _reset() async {
    final responseJson = await ResetPasswordService.resetPasswordEmail(_email);

    //Format data
    Map<String, dynamic> responseData;
    responseData = await json.decode(responseJson.data);

    if (responseJson.success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vous allez recevoir un mail'),
          duration: Duration(seconds: 2),
          backgroundColor: CustomTheme.successColor,
        ),
      );

      await _authService.setAuthToken('userId', responseData["data"]["_id"]);

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ResetPasswordTokenView()));

    }else{
      setState(() {
        _emailError = responseData['email'];
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
                      'Mot de passe',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Veuillez entrer votre email',
                        labelStyle: TextStyle(
                          color: CustomTheme.bgWhiteColor,
                        ),
                        hintText: "exemple@gmail.com",
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
                        }else if (_emailError != null) {
                          return _emailError;
                        }
                        return null;
                      },
                      onSaved: (value) => _email = value!,
                    ),
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
                              _reset();
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
                        'Retour à la page d\'accueil',
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
