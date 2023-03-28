import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smoke_helper/service/auth_token_service.dart';
import 'package:smoke_helper/theme/theme.dart';

import '../model/UserModel.dart';
import '../service/login_service.dart';
import '../widget/ValidationWidget.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginView createState() => _LoginView();
}

class _LoginView extends State<LoginView> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  User _user = User(email: '', username: '', password: '', usernameEmail: '', userCigInfo: UserCigInfo());

  //Stock variable error
  String? passwordError;
  String? emailError;
  String? usernameError;
  String? usernameEmailError;
  String? test;
  bool _isUserConfirmed = true;

  Future<void> _login() async {

    final responseJson = await LoginService.login(_user);

    //Format data
    Map<String, dynamic> responseData;
    responseData = await json.decode(responseJson.data);

    setState(() {
      _isUserConfirmed = responseData["confirmed"];
    });

    print(responseData["confirmed"]);
    print(responseData);

    if (responseJson.success && _isUserConfirmed) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Vous êtes connecté ! Redirection...'),
          duration: Duration(seconds: 2),
          backgroundColor: CustomTheme.successColor,
        ),
      );

      // // Stock User Id
      await _authService.setAuthToken('userId', responseData["_id"]);

      // // Redirection main app page
      await Future.delayed(const Duration(seconds: 2));
      Navigator.popUntil(context, (route) => route.isFirst);

    }else{
      setState(() {
        emailError = responseData['email'];
        passwordError = responseData['password'];
        usernameError = responseData['username'];
        usernameEmailError = responseData['usernameEmail'];
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Echec de la connexion'),
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
              children: <Widget>[
                SizedBox(
                  height: 180,
                  child: SvgPicture.asset(
                    'assets/LOGO.svg',
                    fit: BoxFit.contain,
                  ),
                ),
                const Text(
                  'Connexion',
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Email ou pseudo',
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
                    }else if (usernameEmailError != null) {
                      return usernameEmailError;
                    }
                    return null;
                  },
                  onSaved: (value) => _user.usernameEmail = value!,
                ),
                const SizedBox(height: 20.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Mot de passe',
                    labelStyle: TextStyle(
                      color: Colors.white,
                    ),
                    hintText: "*******",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                  ),
                  obscureText: true,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
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
                ValidationWidget(
                  isUserConfirmed: _isUserConfirmed,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: const Text(
                            'Mot de passe oublié ?',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ]),
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
                          _formKey.currentState?.save();
                          _login();
                        }else{
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Problème lors de la connexion.'),
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
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      const Text(
                        'Vous n\'avez pas encore de compte ?',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, '/RegisterView');
                            },
                            child: const Text(
                              'Inscription',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
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
