import 'package:flutter/material.dart';

import '../theme/theme.dart';

class BottomNavigationTabBarView extends StatefulWidget {
  final BuildContext parentContext;

  const BottomNavigationTabBarView({required this.parentContext});

  @override
  State<BottomNavigationTabBarView> createState() => _BottomNavigationTabBarViewState();
}

class _BottomNavigationTabBarViewState extends State<BottomNavigationTabBarView> {
  int _currentIndex = 0;

  setCurrentIndex(int index){
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) => setCurrentIndex(index),
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
      ],
    );
  }
  }