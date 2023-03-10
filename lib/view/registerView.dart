import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smoke_helper/theme/theme.dart';

import '../model/UserModel.dart';
import '../service/register_service.dart';

class RegisterView extends StatefulWidget {
  @override
  _RegisterView createState() => _RegisterView();
}

class _RegisterView extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  bool _acceptTerms = false;
  User _user = User(email: '', username: '', password: '');

  Future<void> _register() async {
    await RegisterService.register(_user);
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
                      return 'Veuillez entrer un email valide';
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
                    }
                    return null;
                  },
                  onSaved: (value) => _user.username = value!,
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Mot de passe',
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
                      return 'Veuillez entrer un mot de passe';
                    }
                    return null;
                  },
                  onSaved: (value) => _user.password = value!,
                ),
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
                    const Text(
                      'J’accepte les conditions générales d’autorisation.',
                      style: TextStyle(fontSize: 10.0, color: CustomTheme.bgWhiteColor),
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
                      onPressed: (){
                        if(_formKey.currentState?.validate() ?? false){
                          _formKey.currentState?.save();
                          _register();
                          print(_user.username);
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
