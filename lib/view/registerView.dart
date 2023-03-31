import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smoke_helper/service/auth_token_service.dart';
import 'package:smoke_helper/theme/theme.dart';

import '../model/UserModel.dart';
import '../service/register_service.dart';
import '../service/addBadgeService.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterView createState() => _RegisterView();
}

class _RegisterView extends State<RegisterView> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool _acceptTerms = false;
  User _user = User(email: '', username: '', password: '', userCigInfo: UserCigInfo());

  //Stock variable error
  String? emailError;
  String? passwordError;
  String? usernameError;

  Future<void> _register() async {
    final responseJson = await RegisterService.register(_user);

    //Format data
    Map<String, dynamic> responseData;
    responseData = await json.decode(responseJson.data);

    if (responseJson.success) {
      await _authService.setAuthToken('userId', responseData["_id"]);

      //add welcomeBadge
      final addBadge = await addBadgeService.addBadge(responseData["_id"], "6405e63e80a0dfe686b07b6c");

      print(addBadge);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Inscription réussie ! Vous allez recevoir un mail de confirmation à l\'adresse renseignée.'),
          duration: Duration(seconds: 2),
          backgroundColor: CustomTheme.successColor,
        ),
      );

      // Redirection
      Navigator.pushNamedAndRemoveUntil(context, '/LoginView', (route) => false);

    }else{
      setState(() {
        emailError = responseData['email'];
        passwordError = responseData['password'];
        usernameError = responseData['username'];
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Echec de l\'inscription ! Veuillez réessayer plus tard.'),
          duration: Duration(seconds: 2),
          backgroundColor: CustomTheme.errorColor,
        ),
      );
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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                  height: 180,
                  child: SvgPicture.asset(
                    'assets/LOGO.svg',
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Inscription',
                  style: TextStyle(fontSize: 22.0, color: CustomTheme.bgWhiteColor),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 24.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: CustomTheme.bgWhiteColor,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: CustomTheme.bgWhiteColor),
                    ),
                  ),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Veuillez entrer une adresse mail";
                    }else if (emailError != null) {
                      return emailError;
                    }
                    return null;
                  },
                  onSaved: (value) => _user.email = value!,
                ),
                const SizedBox(height: 24.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Nom d\'utilisateur",
                    labelStyle: TextStyle(
                      color: CustomTheme.bgWhiteColor,
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: CustomTheme.bgWhiteColor),
                    ),
                  ),

                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Veuillez entrer un nom d\'utilisateur";
                    }else if (usernameError != null){
                      return usernameError;
                    }
                    return null;
                  },
                  onSaved: (value) => _user.username = value!,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Mot de passe *',
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
                    }else if (passwordError != null) {
                      return passwordError;
                    }
                    return null;
                  },
                  onSaved: (value) => _user.password = value!,
                ),
                const SizedBox(height: 8.0),
                const Text('* doit comporter au moins 8 characteres avec une lettre et un chiffre', style: TextStyle(fontSize: 10.0, color: CustomTheme.bgWhiteColor), textAlign: TextAlign.start,),
                const SizedBox(height: 24.0),
                Row(
                  children: [
                    Checkbox(
                      value: _acceptTerms,
                      onChanged: (bool? value) {
                        setState(() {
                          _acceptTerms = value ?? false;
                        });
                      },
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/CguView');
                      },
                      child: const Text(
                        'J’accepte les conditions générales d’autorisation.',
                        style: TextStyle(
                          color: CustomTheme.bgWhiteColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 10.0
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                SizedBox(
                    width: 200.0,
                    height: 50.0,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(CustomTheme.bgWhiteColor),
                      ),
                      onPressed: () {
                        if(_formKey.currentState?.validate() ?? false){
                          if(_acceptTerms){
                            _formKey.currentState?.save();
                            _register();
                          }else{
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Vous devez accepter les conditions d\'utilisation pour vous inscrire.'),
                                duration: Duration(seconds: 3),
                                backgroundColor: CustomTheme.warningColor,
                              ),
                            );
                          }
                        }
                      },
                      child: const Text(
                        "Envoyer",
                        style: TextStyle(color: CustomTheme.greyColor),
                      ),
                    )
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      const Text(
                        'Vous avez déjà un compte ?',
                        style: TextStyle(
                          color: CustomTheme.bgWhiteColor,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/LoginView');
                            },
                            child: const Text(
                              'Connexion',
                              style: TextStyle(
                                color: CustomTheme.bgWhiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: CustomTheme.bgWhiteColor,
                            size: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
