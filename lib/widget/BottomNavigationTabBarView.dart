import 'package:flutter/material.dart';

class BottomNavigationTabBarView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return bottomNavigationTabBarView();
  }

  BottomNavigationBar bottomNavigationTabBarView() {
    const iconSize = 25.0;
    return BottomNavigationBar(

        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
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