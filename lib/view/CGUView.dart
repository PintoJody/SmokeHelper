import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../theme/theme.dart';
import '../widget/HeaderNavigationView.dart';


class CGUView extends StatelessWidget {
  const CGUView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

        home: Scaffold(
            backgroundColor: CustomTheme.bgWhiteColor,
            appBar: HeaderNavigationView(pageName: "CGU", parentContext: context, isHomePage: false),
            body: SingleChildScrollView(
                child : Padding(
                    padding: EdgeInsets.all(16),
                    child : Column(
                        children : [
                          Text("Conditions Général d'Utilisations de l'application Smoke Helper"),
                          SizedBox(height: 30),
                          Text("Lors de son inscription, l’utilisateur s’engage à prendre connaissance des présentes conditions générales. Il s’engage également à fournir des informations exactes et conformes à la réalité aux fins de mise en œuvre des fonctionnalités proposées. L’utilisateur s’engage en particulier à ne pas créer de fausse identité de nature à induire, ainsi que les tiers, en erreur et à ne pas usurper l’identité d’une autre personne physique."),
                          SizedBox(height: 30),
                          Text("ARTICLE 1 - Conditions d’inscription"),
                          SizedBox(height: 20),
                          Text("En cas de fourniture d’informations inexactes, ou de nature à induire en erreur, et d’usurpation d’identité d’un utilisateur, Smoke Helper pourra immédiatement et sans préavis, ni indemnité, suspendre ou résilier le compte membre de l’utilisateur et lui refuser l’accès, de façon temporaire ou définitive à tout ou partie des fonctionnalités. Smoke Helper ne saurait être tenu pour responsable de l’exactitude ou de l’inexactitude des informations fournies par l’utilisateur. En cas de modification, l’utilisateur s’engage à mettre immédiatement à jour les données qu’il a communiqué lors de son inscription en ligne. "),
                          SizedBox(height: 30),
                          Text("ARTICLE 2 - Identifiants de connexion"),
                          SizedBox(height: 20),
                          Text("Lors de son inscription, l’utilisateur doit renseigner son email et choisir un mot de passe. L’utilisateur est responsable de la bonne saisie de ses informations de connexion, si ce dernier renseigne de mauvaises informations, Smoke Helper ne pourra pas en être tenu pour responsable. "),
                          SizedBox(height: 30),
                          Text("ARTICLE 3 - Vie privée"),
                          SizedBox(height: 20),
                          Text("Smoke Helper s’engage à protéger la vie privée de ses utilisateurs dans le respect des réglementations en vigueur, conformément à sa Politique de protection des données personnelles. L’utilisateur reconnaît avoir manifesté son accord express pour le recueil et le traitement de ses données personnelles à travers la création d’un compte. Les traitements réalisés ont fait l’objet d’une déclaration à la CNIL sous le numéro 2115201."),

                        ]
                    )
                )
            )
        )


    );
  }
}