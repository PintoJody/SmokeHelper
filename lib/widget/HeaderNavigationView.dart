import 'package:flutter/material.dart';
import 'package:smoke_helper/view/home.dart';
import 'package:smoke_helper/view/settingView.dart';

class HeaderNavigationView extends StatefulWidget with PreferredSizeWidget {
  final String pageName;
  final bool isHomePage;

  HeaderNavigationView({required this.pageName, this.isHomePage = true});

  @override
  _HeaderNavigationViewState createState() => _HeaderNavigationViewState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _HeaderNavigationViewState extends State<HeaderNavigationView> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF55886F),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (!widget.isHomePage) //If not the home page, add a previous link.
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                if (Navigator.of(context).canPop()) { //Check if there are forward navigations
                  Navigator.of(context).pop();
                }else{
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                  );
                }
              },
            ),
          Text(widget.pageName, style: TextStyle(fontSize: 20)),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SettingView()),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
