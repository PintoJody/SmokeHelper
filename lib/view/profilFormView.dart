import 'dart:convert';

import 'package:flutter/material.dart';

import '../service/getUserBySlug.dart';
import '../theme/theme.dart';
import '../widget/ActionButton.dart';
import '../widget/HeaderNavigationView.dart';

class ProfilFormView extends StatefulWidget {
  const ProfilFormView({Key? key}) : super(key: key);

  @override
  State<ProfilFormView> createState() => _ProfilFormViewState();
}

class _ProfilFormViewState extends State<ProfilFormView> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = true;
  late TextEditingController _usernameController;
  late TextEditingController _emailController;

  Future<void> getUserData() async {
    final responseJson = await getUserBySlugService().getUser();

    Map<String, dynamic> responseData;
    responseData = await json.decode(responseJson.data);

    if(responseData != null){
      setState(() {
        _isLoading = false;
        _usernameController = TextEditingController(text: responseData["username"]);
        _emailController = TextEditingController(text: responseData["email"]);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SmokeHelper',
        home: Scaffold(
            backgroundColor: CustomTheme.bgWhiteColor,
            appBar: HeaderNavigationView(
                pageName: "Mon Profil",
                parentContext: context,
                isHomePage: false),
            body: _isLoading ? Center(child: CircularProgressIndicator()) : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 35.0, bottom: 35.0, left: 16.0, right: 16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Mon compte',
                        style: TextStyle(
                            color: CustomTheme.greenColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0),
                      ),
                      const SizedBox(height: 16.0),
                      TextFormField(
                        controller: _usernameController,
                        decoration: InputDecoration(
                          labelText: 'Pseudo',
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Le champ pseudo ne peut pas être vide';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          labelText: 'Email',
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Le champ email ne peut pas être vide';
                          }
                          if (value != null && !value.contains('@')) {
                            return 'Veuillez entrer une adresse email valide';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Mot de passe',
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Le champ mot de passe ne peut pas être vide';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Confirmation du mot de passe',
                        ),
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return 'Le champ confirmation du mot de passe ne peut pas être vide';
                          }
                          if (value != _passwordController.text) {
                            return 'Les mots de passe ne correspondent pas';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 40),
                      Container(
                        child: Align(
                          alignment: Alignment.center,
                          child: ActionButton(
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? true) {
                                // TODO: Submit form
                                print(_emailController);
                                print(_passwordController);
                              }
                            },
                            textButton: "Modifier",
                            width: 120.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
        )
    );
  }
}
