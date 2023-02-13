import 'package:flutter/material.dart';

class HeaderNavigationView extends StatelessWidget with PreferredSizeWidget {
  const HeaderNavigationView({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF55886F),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Bonjour', style: TextStyle(fontSize: 20)),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () {
                  // action pour le premier bouton
                },
              ),
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  // action pour le deuxième bouton
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
