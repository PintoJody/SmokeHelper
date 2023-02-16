import 'package:flutter/material.dart';

import '../widget/BottomNavigationTabBarView.dart';
import '../widget/HeaderNavigationView.dart';

class ProfilView extends StatefulWidget {
  const ProfilView({Key? key}) : super(key: key);

  @override
  State<ProfilView> createState() => _ProfilViewState();
}

class _ProfilViewState extends State<ProfilView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SmokeHelper',
        home: Scaffold(
            backgroundColor: const Color(0xFFF5F1F2),
            appBar: HeaderNavigationView(pageName: "Mon Profil", parentContext: context, isHomePage: false),
            body: Text("Page Profil"),
            bottomNavigationBar: const BottomNavigationTabBarView()
        )
    );
  }
}
