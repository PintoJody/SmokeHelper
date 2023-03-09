import 'package:flutter/material.dart';
import 'package:smoke_helper/theme/theme.dart';

class CardConsumption extends StatefulWidget {
  final String nbCigarette;
  final String nbPrice;
  final String nbPerPack;

  const CardConsumption({required this.nbCigarette, required this.nbPerPack, required this.nbPrice});

  @override
  State<CardConsumption> createState() => _CardConsumptionState();
}

class _CardConsumptionState extends State<CardConsumption> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              widget.nbCigarette,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: CustomTheme.greenColor,
                fontSize: 35.0,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Cigarettes par jour',
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Column(
          children: [
            Text(
              widget.nbPrice,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: CustomTheme.greenColor,
                fontSize: 35.0,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Euros par paquet',
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Column(
          children: [
            Text(
              widget.nbPerPack,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: CustomTheme.greenColor,
                fontSize: 35.0,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Cigarettes par paquet',
              style: TextStyle(
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
