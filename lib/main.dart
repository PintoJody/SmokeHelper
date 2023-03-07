import 'package:flutter/material.dart';
import 'package:smoke_helper/view/loginView.dart';
import 'package:smoke_helper/view/profilView.dart';
import 'package:smoke_helper/view/profilFormView.dart';
import 'package:smoke_helper/view/registerView.dart';
import 'package:smoke_helper/view/settingView.dart';
import 'view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmokeHelper',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/LoginView': (context) => LoginView(),
        '/RegisterView': (context) => RegisterView(),
        '/SettingView': (context) => SettingView(),
        '/ProfilView': (context) => ProfilView(),
        '/ProfilFormView': (context) => ProfilFormView(),
      },
    );
  }
}
