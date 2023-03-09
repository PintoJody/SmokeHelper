import 'package:flutter/material.dart';
import 'package:smoke_helper/widget/CardWithItems.dart';
import 'package:smoke_helper/widget/imgWithText.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    //Array card Progres
    //TODO A récupérer dans l'api
    final List<IconData> iconsProgres = [
      Icons.calendar_month,
      Icons.local_fire_department,
      Icons.euro,
      Icons.emoji_events_outlined,
    ];
    final List<String> descriptionsProgres = [
      '2 mois sans fumer',
      '324 cigarettes évitées',
      '102€ économisés',
      '3 badges obtenus',
    ];
    //TODO voir condition dans CardWithItems car on utilise des icons pour progres mais des images pour les badges
    final List<int> iconsColorsProgres = [
      0xFF699BF7,
      0xFFFF9A62,
      0xFFFFD233,
      0xFF4ECB71,
    ];

    //Array card Badges
    //TODO A récupérer dans l'api
    final List<IconData> iconsBadges = [
      Icons.star,
      Icons.show_chart,
    ];
    final List<String> descriptionsBadges = [
      '1 mois sans fumer',
      'A gagner 10 places dans le classement',
    ];

    return SingleChildScrollView(
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
              icons: iconsProgres,
              descriptions: descriptionsProgres,
              iconsColors: iconsColorsProgres,
            ),
            const SizedBox(height: 40.0),
            CardWithItems(
              title: 'Mes Badges',
              icons: iconsBadges,
              descriptions: descriptionsBadges,
              iconsColors: iconsColorsProgres,
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}