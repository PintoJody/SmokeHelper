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
            body: Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 20.0,left: 5.0, right: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CardButton(username: "JohnDoe"), //TODO => recupérer username dans bdd
                  const SizedBox(height: 35.0),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Mon compte", style: TextStyle(color: Color(0xFF55886F), fontWeight: FontWeight.bold, fontSize: 22.0)),
                        const SizedBox(height: 15.0),
                        const Text("Email", style: TextStyle(color: Color(0xFF545454), fontWeight: FontWeight.bold, fontSize: 18.0)),
                        const SizedBox(height: 8.0),
                        const Text("johnDoe@gmail.com", style: TextStyle(color: Color(0xFF545454), fontSize: 14.0)), //TODO Recuperer mail user
                        const SizedBox(height: 35.0),
                        const Text("Informations", style: TextStyle(color: Color(0xFF55886F), fontWeight: FontWeight.bold, fontSize: 22.0)),
                        const SizedBox(height: 15.0),
                        InkWell(
                          child: const Text("Condition générales d’utilisation", style: TextStyle(color: Color(0xFF545454), fontSize: 14.0, fontWeight: FontWeight.bold)),
                          onTap: (){
                            //TODO lien vers les conditions générales
                          },
                        ),
                        const SizedBox(height: 20.0),
                        InkWell(
                          child: const Text("Politique de confidentialité", style: TextStyle(color: Color(0xFF545454), fontSize: 14.0, fontWeight: FontWeight.bold)),
                          onTap: (){
                            //TODO lien vers Politique de confidentialité
                          },
                        ),
                        const SizedBox(height: 35.0),
                        const Text("Autre", style: TextStyle(color: Color(0xFF55886F), fontWeight: FontWeight.bold, fontSize: 22.0)),
                        const SizedBox(height: 15.0),
                        InkWell(
                          child: const Text("Déconnexion", style: TextStyle(color: Color(0xFF545454), fontSize: 14.0, fontWeight: FontWeight.bold)),
                          onTap: (){
                            //TODO lien Deconnexion
                          },
                        ),
                        const SizedBox(height: 8.0),
                        const Text("Vous êtes actuellement connecté en tant que johnDoe.", style: TextStyle(color: Color(0xFF545454), fontSize: 10.0)),
                      ],
                    ),
                  ),



                ],
              ),
            ),
            bottomNavigationBar: const BottomNavigationTabBarView()
        )
    );
  }
}
