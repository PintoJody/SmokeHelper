import 'package:flutter/material.dart';

import 'package:smoke_helper/widget/BottomNavigationTabBarView.dart';
import 'package:smoke_helper/widget/CardButton.dart';
import 'package:smoke_helper/widget/HeaderNavigationView.dart';

class SettingView extends StatefulWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SmokeHelper',
        home: Scaffold(
            backgroundColor: const Color(0xFFF5F1F2),
            appBar: HeaderNavigationView(pageName: "Préférences", isHomePage: false),
            body: const CardButton(username: "JohnDoe"), //TODO => recupérer username dans bdd

            bottomNavigationBar: const BottomNavigationTabBarView()
        )
    );
  }
}
