import 'package:flutter/material.dart';
import 'package:smoke_helper/theme/theme.dart';
import 'package:smoke_helper/view/consumptionView.dart';
import 'package:smoke_helper/view/logBookFormView.dart';
import 'package:smoke_helper/view/logBookView.dart';
import 'package:smoke_helper/view/loginView.dart';
import 'package:smoke_helper/view/profilView.dart';
import 'package:smoke_helper/view/profilFormView.dart';
import 'package:smoke_helper/view/registerView.dart';
import 'package:smoke_helper/view/settingView.dart';
import 'package:smoke_helper/widget/HeaderNavigationView.dart';
import 'view/home.dart';

void main(){
  runApp(const MyApp());
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;

  setCurrentIndex(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmokeHelper',
      debugShowCheckedModeBanner: false,
      initialRoute: '/LoginView',
      routes: {
        // '/': (context) => LoginView(),
        '/LoginView': (context) => LoginView(),
        '/RegisterView': (context) => RegisterView(),
        '/SettingView': (context) => SettingView(),
        '/ProfilView': (context) => ProfilView(),
        '/ProfilFormView': (context) => ProfilFormView(),
        '/LogBookFormView': (context) => LogBookFormView(),
        '/LogBookView': (context) => LogBookView(),
        '/ConsumptionView': (context) => ConsumptionView(),
      },
      home: Scaffold(
          backgroundColor: const Color(0xFFF5F1F2),
          appBar: HeaderNavigationView(pageName: "SmokeHelper", parentContext: context),
          body: [
            HomePage(),
            LogBookView(),
          ][_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (index) => setCurrentIndex(index),
            selectedItemColor: CustomTheme.greenColor,
            unselectedItemColor: CustomTheme.greyColor,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Accueil',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: 'Journal',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart),
                label: 'Progrès',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.emoji_events),
                label: 'Classement',
              ),
            ],
          ),
      ),
    );
  }
}

