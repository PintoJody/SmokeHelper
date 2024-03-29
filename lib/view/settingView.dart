import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:smoke_helper/widget/CardButton.dart';
import 'package:smoke_helper/widget/HeaderNavigationView.dart';

import '../service/auth_token_service.dart';
import '../service/getUserBySlug.dart';
import '../service/logoutService.dart';
import '../theme/theme.dart';
import '../widget/DeleteUserButton.dart';

class SettingView extends StatefulWidget {
  const SettingView({Key? key}) : super(key: key);

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
  final AuthService _authService = AuthService();
  String? userId;
  bool _isLoading = true;
  String _profilePicture = "";
  String _username = "";
  String _email = "";

  @override
  void initState() {
    super.initState();
    getUserId();
    getUserData();
  }

  Future<void> getUserId() async {
    final id = await _authService.getAuthToken('userId');
    print('ID utilisateur: $id');
    setState(() {
      userId = id;
    });
  }

  Future<void> getUserData() async {
    final responseJson = await getUserBySlugService().getUser();

    Map<String, dynamic> responseData;
    responseData = await json.decode(responseJson.data);

      setState(() {
        _isLoading = false;
        _username = responseData["username"];
        _email = responseData["email"];
        _profilePicture = responseData["featuredBadge"][0]["icon"];

        print(_email);
      });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SmokeHelper',
        home: Scaffold(
            backgroundColor: CustomTheme.bgWhiteColor,
            appBar: HeaderNavigationView(pageName: "Préférences", parentContext: context, isHomePage: false),
            body: _isLoading ? Center(child: CircularProgressIndicator()) : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0,left: 5.0, right: 5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CardButton(username: _username, routeName: "/ProfilView", parentContext: context, profilePicture: _profilePicture),
                    const SizedBox(height: 35.0),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Mon compte", style: TextStyle(color: CustomTheme.greenColor, fontWeight: FontWeight.bold, fontSize: 22.0)),
                          const SizedBox(height: 15.0),
                          const Text("Email", style: TextStyle(color: CustomTheme.greyColor, fontWeight: FontWeight.bold, fontSize: 18.0)),
                          const SizedBox(height: 8.0),
                          Text("${_email}", style: TextStyle(color: CustomTheme.greyColor, fontSize: 14.0)),
                          const SizedBox(height: 35.0),
                          const Text("Bluetooth", style: TextStyle(color: CustomTheme.greenColor, fontWeight: FontWeight.bold, fontSize: 22.0)),
                          const SizedBox(height: 8.0),
                          InkWell(
                            child: const Text("Connexion à un appareil", style: TextStyle(color: CustomTheme.greyColor, fontSize: 14.0, fontWeight: FontWeight.bold)),
                            onTap: (){
                              Navigator.pushNamed(context, '/BluetoothView');
                            },
                          ),
                          const SizedBox(height: 35.0),
                          const Text("Informations", style: TextStyle(color: CustomTheme.greenColor, fontWeight: FontWeight.bold, fontSize: 22.0)),
                          const SizedBox(height: 15.0),
                          InkWell(
                            child: const Text("Condition générales d’utilisation", style: TextStyle(color: CustomTheme.greyColor, fontSize: 14.0, fontWeight: FontWeight.bold)),
                            onTap: (){
                              Navigator.pushNamed(context, '/CguView');
                            },
                          ),
                          const SizedBox(height: 20.0),
                          InkWell(
                            child: const Text("Politique de confidentialité", style: TextStyle(color: CustomTheme.greyColor, fontSize: 14.0, fontWeight: FontWeight.bold)),
                            onTap: (){
                              Navigator.pushNamed(context, '/PrivacyView');
                            },
                          ),
                          const SizedBox(height: 35.0),
                          const Text("Autre", style: TextStyle(color: CustomTheme.greenColor, fontWeight: FontWeight.bold, fontSize: 22.0)),
                          const SizedBox(height: 15.0),
                          InkWell(
                            child: const Text("Déconnexion", style: TextStyle(color: CustomTheme.greyColor, fontSize: 14.0, fontWeight: FontWeight.bold)),
                            onTap: () async {
                                await LogoutService.logout(context);

                            },
                          ),
                          const SizedBox(height: 8.0),
                          Text("Vous êtes actuellement connecté en tant que ${_username}.", style: TextStyle(color: CustomTheme.greyColor, fontSize: 10.0)),
                          const SizedBox(height: 40.0),
                          Row(
                            children: [
                              userId != null
                                ? DeleteUserButton(userId: userId!)
                                : CircularProgressIndicator(),
                            ]
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
        )
    );
  }
}
