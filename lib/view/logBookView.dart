import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:smoke_helper/service/getUserBySlug.dart';
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
  bool _isLoading = true;
  String _cigInfo = "";
  String cigsPerPack = "";
  String cigsPrice = "";
  String cigsPerDay = "";

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    final responseJson = await getUserBySlugService().getUser();

    Map<String, dynamic> responseData;
    responseData = await json.decode(responseJson.data);

    if(responseData["cigInfo"] != null) {
      setState(() {
        _isLoading = false;
        _cigInfo = responseData["cigInfo"];

        final cigInfoMap = jsonDecode(_cigInfo);
        cigsPerPack = cigInfoMap['cigsPerPack'];
        cigsPrice = cigInfoMap['averagePackPrice'];
        cigsPerDay = cigInfoMap['estimatedAveragePerDay'];

      });
    } else {
      print("_cigInfo is null");
    }
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? Center(child: CircularProgressIndicator()) :
    SingleChildScrollView(
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
                    Navigator.pushNamed(context, '/ConsumptionView');
                  },
                ),
              ],
            ),
            SizedBox(height: 40),
            CardConsumption(nbCigarette: cigsPerDay, nbPerPack: cigsPerPack, nbPrice: cigsPrice),
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
