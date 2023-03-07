import 'package:flutter/material.dart';

import '../theme/theme.dart';
import '../widget/ActionButton.dart';
import '../widget/BottomNavigationTabBarView.dart';
import '../widget/HeaderNavigationView.dart';

class ProfilFormView extends StatefulWidget {
  const ProfilFormView({Key? key}) : super(key: key);

  @override
  State<ProfilFormView> createState() => _ProfilFormViewState();
}

class _ProfilFormViewState extends State<ProfilFormView> {
  final _formKey = GlobalKey<FormState>();
  final _pseudoController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _pseudoController.dispose();
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
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 35.0, bottom: 35.0, left: 16.0, right: 16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Mon compte',
                        style: TextStyle(
                            color: CustomTheme.greenColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 22.0),
                      ),
                      SizedBox(height: 16.0),
                      TextFormField(
                        controller: _pseudoController,
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
                      const SizedBox(height: 50),
                      GestureDetector(
                        onTap: () {
                          print("SUPPRESSION COMPTE");
                        },
                        child: Row(
                          children: const [
                            Icon(Icons.delete, color: Color(0xFFC62828)),
                            SizedBox(width: 5),
                            Text(
                              'Supprimer définitivement mon compte',
                              style: TextStyle(
                                color: Color(0xFFC62828),
                                fontWeight: FontWeight.bold,
                                fontSize: 12.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            bottomNavigationBar: const BottomNavigationTabBarView()));
  }
}
