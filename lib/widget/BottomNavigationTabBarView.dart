import 'package:flutter/material.dart';

import '../theme/theme.dart';

class BottomNavigationTabBarView extends StatefulWidget {
  const BottomNavigationTabBarView({Key? key}) : super(key: key);

  @override
  State<BottomNavigationTabBarView> createState() => _BottomNavigationTabBarViewState();
}

class _BottomNavigationTabBarViewState extends State<BottomNavigationTabBarView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (int newIndex){
            setState(() {
              _currentIndex = newIndex;
            });
          },
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
          ]
      );
    }
  }