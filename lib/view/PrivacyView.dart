import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smoke_helper/model/UserModel.dart';
import 'package:smoke_helper/view/logBookView.dart';

import '../service/auth_token_service.dart';
import '../service/updateUserService.dart';
import '../theme/theme.dart';
import '../widget/HeaderNavigationView.dart';

class PCView extends StatelessWidget {
  const PCView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        home: Scaffold(
            backgroundColor: CustomTheme.bgWhiteColor,
            appBar: HeaderNavigationView(pageName: "Confidentialité", parentContext: context, isHomePage: false),
            body: SingleChildScrollView(
                child : Padding(
                    padding: EdgeInsets.all(16),
                    child : Column(
                        children : [
                          Text("Politique de confidentialité",
                              style: TextStyle(fontSize: 17)
                          ),
                          SizedBox(height: 30),
                          Text("Smoke Helper, s’engage à protéger et respecter votre vie privée dans le cadre de votre utilisation de l’application mobile : Smoke Helper."),
                          SizedBox(height: 30),
                          Text("Nous avons rédigé la présente politique de confidentialité pour vous informer en toute transparence de la manière dont les données permettant de vous identifier directement ou indirectement."),
                          SizedBox(height: 20),
                          Text('Traitements de vos Données Personnelles :',
                              style: TextStyle(fontSize: 17)
                          ),
                          SizedBox(height: 30),
                          Text("Les informations que vous renseignez directement :"),
                          SizedBox(height: 20),
                          Text("En utilisant notre Plateforme, vous pouvez être amené à renseigner et donc nous fournir des informations considérées comme Données Personnelles."),
                          SizedBox(height: 30),
                          Text(" Lors de la création de votre compte avec une adresse mail, vous nous communiquez votre adresse mail et un mot de passe pour que nous puissions vous authentifier et sécuriser vos données. Nous ne stockons pas ce mot de passe qui est uniquement utilisé pour la création du compte."),
                          SizedBox(height: 20),
                          Text("Lors de votre inscription via notre Application, nous vous demandons de nous communiquer vos anciennes habitudes tabagiques afin de constituer votre profil utilisateur ainsi que le pseudonyme avec lequel nous pouvons nous adresser à vous."),
                          SizedBox(height: 20),
                          Text("Lorsque vous utilisez notre Application, nous sauvegardons chaque  chaque réussite débloquée, chaque cigarette fumée et chaque envie résistée avec pour chacune, la date, l’intensité, le sentiment et le déclencheur saisi. Vous pouvez également être amené à modifier le prix d’un paquet dans les réglages de l’application, pour que les économies faites soient les plus justes vis-à-vis de la réalité."),
                          SizedBox(height: 20),
                          Text("Lorsque vous laissez votre avis sur Smoke Helper via les magasins d’applications ou directement via la Plateforme, nous nous réservons le droit de le mettre en avant en affichant votre pseudonyme, l’avis ainsi que la note donnée. Par ailleurs, un grand merci pour votre retour qui nous aide à améliorer nos services."),
                          SizedBox(height: 30),
                          Text("Le contrat"),
                          SizedBox(height: 20),
                          Text("La principale raison pour laquelle nous pouvons faire usage de vos Données Personnelles est que sans cela nous ne pourrions fournir nos services, tels que décrits dans nos Conditions d'utilisation et en particulier vous permettre un auto-suivi de votre sevrage tabagique et des évaluations de l’évolution de ce sevrage et gérer, le cas échéant, les opérations relatives à la gestion des paiements."),
                          SizedBox(height: 20),
                          Text("Le consentement"),
                          SizedBox(height: 20),
                          Text("Ainsi, les traitements de données personnelles qui sont effectués uniquement après avoir obtenu votre consentement (qui peut être retiré à tout moment) sont les suivants :\n\nSur notre Site, vous choisissez d’autoriser ou non l’utilisation de cookies d’analyse et de performance. Vous pouvez modifier ce choix dans votre navigateur et sur le Site."),
                          SizedBox(height: 30),
                          Text("Stockage et protection"),
                          SizedBox(height: 20),
                          Text("La protection de vos informations étant primordiale pour nous, nous requérons un niveau de sécurité adéquat et suffisant selon les critères du RGPD pour le stockage de vos données."),
                          SizedBox(height: 30),
                          Text("Partage"),
                          SizedBox(height: 20),
                          Text("En ce qui concerne le partage de vos données, c’est très simple : nous ne partageons aucune de vos Données Personnelles avec qui que ce soit ! Seul le personnel habilité de Smoke Helper aura accès à vos informations et uniquement à des fins de support ou en vue d’améliorer les services proposés par notre Plateforme."),
                        ]
                    )
                )
            )
        )


    );
  }
}