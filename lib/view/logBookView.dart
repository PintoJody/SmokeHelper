import 'package:flutter/material.dart';
import 'package:smoke_helper/theme/theme.dart';
import 'package:smoke_helper/view/logBookFormView.dart';
import 'package:smoke_helper/widget/ActionButton.dart';
import 'package:smoke_helper/widget/CardConsumption.dart';
import 'package:smoke_helper/widget/CardLogBook.dart';

import '../widget/NavigatorButton.dart';

class LogBookView extends StatefulWidget {
  const LogBookView({Key? key}) : super(key: key);

  @override
  State<LogBookView> createState() => _LogBookViewState();
}

class _LogBookViewState extends State<LogBookView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Ma consommation moyenne',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CustomTheme.greenColor,
                    fontSize: 18.0,
                  ),
                ),
                ActionButton(
                  textButton: "Modifier",
                  width: 80,
                  fontSize: 12,
                  onPressed: (){
                    //TODO
                  },
                ),
              ],
            ),
            SizedBox(height: 40),
            CardConsumption(nbCigarette: "10", nbPerPack: "20", nbPrice: "15"),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Journal de bord',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CustomTheme.greenColor,
                    fontSize: 18.0,
                  ),
                ),
                NavigatorButton(parentContext: context, path: "/LogBookFormView", text: "Ajouter une carte", width: 140, height: 35, textSize: 12.0),
              ],
            ),
            const SizedBox(height: 40),
            CardLogBook(dateTime: "Vendredi 27 Janvier 2023", nbCigarette: "4", nbFeel: "5"),
            CardLogBook(dateTime: "Samedi 28 Janvier 2023", nbCigarette: "2", nbFeel: "4"),
          ],
        ),
      ),
    );
  }
}
