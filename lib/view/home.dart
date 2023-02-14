import 'package:flutter/material.dart';
import 'package:smoke_helper/widget/BottomNavigationTabBarView.dart';
import 'package:smoke_helper/widget/CardWithItems.dart';
import 'package:smoke_helper/widget/HeaderNavigationView.dart';
import 'package:smoke_helper/widget/imgWithText.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmokeHelper',
      home: Scaffold(
          backgroundColor: const Color(0xFFF5F1F2),
          appBar: const HeaderNavigationView(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 25.0, left: 9, right: 9),
            child: Column(
              children: [
                imgWithText(
                    title: 'Temps passé sans fumer :',
                    img: 'https://img.freepik.com/vecteurs-libre/illustration-scenes-nature-dessinees-main_23-2150053464.jpg?w=740&t=st=1676362568~exp=1676363168~hmac=477a3622922208d1a59f7390ee35fcd96351ec687b0706b8cfce2ffe749defca',
                    detail: '2m 12j 5h'
                ),
                const SizedBox(height: 40.0),
                CardWithItems(
                  title: 'Mes Progrès',
                ),
                const SizedBox(height: 40.0),
                CardWithItems(
                  title: 'Mes Badges',
                ),
                const SizedBox(height: 40.0),
            ],
            ),
          ),
        ),
        bottomNavigationBar: const BottomNavigationTabBarView()
    )
    );
  }
}