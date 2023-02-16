import 'package:flutter/material.dart';
import 'package:smoke_helper/widget/NavigatorButton.dart';

import '../theme/theme.dart';
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
            backgroundColor: CustomTheme.bgWhiteColor,
            appBar: HeaderNavigationView(pageName: "Mon Profil", parentContext: context, isHomePage: false),
            body: Column(
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
                                Text("JohnDoe", style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: CustomTheme.greyColor)),
                                const SizedBox(height: 5.0),
                                Text("4 badges", style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: CustomTheme.greenColor)),
                                const SizedBox(height: 2.0),
                                Text("Membre depuis le 16/02/2023", style: TextStyle(fontSize: 8.0, color: CustomTheme.greyColor)),
                                const SizedBox(height: 5.0),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(height: 50.0),
                        NavigatorButton(parentContext: context, text: "Modifier profil", width: 150, height: 35), //Widget Button
                      ],
                    ),
                  ),
                ),

              ],
            ),
            bottomNavigationBar: const BottomNavigationTabBarView()
        )
    );
  }
}
