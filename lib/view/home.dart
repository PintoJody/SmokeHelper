import 'package:flutter/material.dart';
import 'package:smoke_helper/widget/BottomNavigationTabBarView.dart';
import 'package:smoke_helper/widget/HeaderNavigationView.dart';
import 'package:smoke_helper/widget/imgWithText.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SmokeHelper',
      home: Scaffold(
          appBar: HeaderNavigationView(),
        body: Padding(
          padding: EdgeInsets.only(top: 25.0, left: 9, right: 9),
          child: imgWithText(),
        ),
        bottomNavigationBar: BottomNavigationTabBarView()
    )
    );
  }
}