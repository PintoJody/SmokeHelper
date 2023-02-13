import 'package:flutter/material.dart';

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



// class BottomNavigationTabBarView extends State<BottomNavigationTabBarView> {
//
//   @override
//   Widget build(BuildContext context) {
//     return bottomNavigationTabBarView();
//   }
//
//   BottomNavigationBar bottomNavigationTabBarView() {
//     const iconSize = 25.0;
//     return BottomNavigationBar(
//
//         selectedItemColor: Colors.green,
//         unselectedItemColor: Colors.grey,
//         type: BottomNavigationBarType.fixed,
//         items: const [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Accueil',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.book),
//             label: 'Journal',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.bar_chart),
//             label: 'Progrès',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.emoji_events),
//             label: 'Classement',
//           ),
//         ]
//     );
//   }
// }