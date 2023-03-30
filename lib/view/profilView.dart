import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smoke_helper/widget/CardBadge.dart';
import 'package:smoke_helper/widget/NavigatorButton.dart';

import '../service/getUserBySlug.dart';
import '../theme/theme.dart';
import '../widget/HeaderNavigationView.dart';

class ProfilView extends StatefulWidget {
  const ProfilView({Key? key}) : super(key: key);

  @override
  State<ProfilView> createState() => _ProfilViewState();
}

class _ProfilViewState extends State<ProfilView> {
  int _currentIndex = 0;
  bool _isLoading = true;
  String _username = "";
  String _createdAt = "";
  int _countBadges = 0;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    final responseJson = await getUserBySlugService().getUser();

    Map<String, dynamic> responseData;
    responseData = await json.decode(responseJson.data);

    setState(() {
      _isLoading = false;
      _username = responseData["username"];
      _countBadges = responseData["badges"].length;

      //FORMAT DATETIME
      DateTime date = DateTime.parse(responseData["createdAt"]);
      _createdAt = "${date.day}/${date.month}/${date.year}";

      print(_countBadges);
    });

  }

  //TODO GET USER BADGES
  List<Widget> _widgets = [
    //Badges obtenus
  Column(
  children: [
    CardBadge(icon: Icons.home,title: "Bienvenue !", descriptions: "Vous venez de vous inscrire !", date: "20/02/2023", isLock: false),
    ],
  ),
    //Badges Vérrouillés
    Column(
      children: [
        CardBadge(title: "Anniversaire", descriptions: "Vous êtes inscrit depuis 1 an !", isLock: true),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SmokeHelper',
        home: Scaffold(
            backgroundColor: CustomTheme.bgWhiteColor,
            appBar: HeaderNavigationView(pageName: "Mon Profil", parentContext: context, isHomePage: false),
            body: _isLoading ? Center(child: CircularProgressIndicator()) : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 400.0,
                    height: 250.0,
                    child: Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(Icons.verified_user, size: 45),
                              const SizedBox(width: 28.0),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${_username}", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: CustomTheme.greyColor)),
                                  const SizedBox(height: 5.0),
                                  Text("${_countBadges} badges", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: CustomTheme.greenColor)),
                                  const SizedBox(height: 2.0),
                                  Text("Membre depuis le ${_createdAt}", style: TextStyle(fontSize: 8.0, color: CustomTheme.greyColor)),
                                  const SizedBox(height: 5.0),
                                ],
                              )
                            ],
                          ),
                          const SizedBox(height: 50.0),
                          NavigatorButton(parentContext: context, path: "/ProfilFormView", text: "Modifier profil", width: 140, height: 35, textSize: 14.0), //Widget Button
                        ],
                      ),
                    ),
                  ),

                  Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _currentIndex = 0;
                                });
                              },
                              child: Text(
                                "Mes badges",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: _currentIndex == 0 ? CustomTheme.greenColor : CustomTheme.greyColor,
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _currentIndex = 1;
                                });
                              },
                              child: Text(
                                "Badges verrouillées",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: _currentIndex == 1 ? CustomTheme.greenColor : CustomTheme.greyColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        IndexedStack(
                          index: _currentIndex,
                          children: _widgets,
                        ),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ],
              ),
            ),
        ),
    );
  }
}
