import 'package:flutter/material.dart';
import 'package:smoke_helper/widget/BottomNavigationTabBarView.dart';
import 'package:smoke_helper/widget/HeaderNavigationView.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SmokeHelper',
      home: Scaffold(
          appBar: HeaderNavigationView(),
        body: Center(
          child: Text('Hello World'),
        ),
        bottomNavigationBar: BottomNavigationTabBarView()
    )
    );
  }
}