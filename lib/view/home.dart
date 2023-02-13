import 'package:flutter/material.dart';
import 'package:smoke_helper/widget/BottomNavigationTabBarView.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmokeHelper',
      home: Scaffold(
        body: const Center(
          child: Text('Hello World'),
        ),
      bottomNavigationBar: BottomNavigationTabBarView()
    )
    );
  }
}