import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smoke_helper/view/registerView.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginView createState() => _LoginView();
}

class _LoginView extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF55886F),
      body: Form(
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
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Veuillez entrer une adresse email valide';
                  }
                  return null;
                },
                onSaved: (value) => _email = value!,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                validator: (value) {
                  if (value != null && value.length > 6) {
                    return 'Le mot de passe doit contenir au moins 6 caractères';
                  }
                  return null;
                },
                onSaved: (value) => _password = value!,
                decoration: const InputDecoration(
                  labelText: 'Mot de passe',
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                obscureText: true,
                style: const TextStyle(
                  color: Colors.white,
                ),
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
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                color: Colors.white,
                textColor: Colors.black,
                onPressed: () { },
                child: const Text('Envoyer'),
                minWidth: 205.0,
                height: 50.0,
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RegisterView()),
                            );
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
    );
  }
}
