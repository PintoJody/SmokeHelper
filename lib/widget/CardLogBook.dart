import 'package:flutter/material.dart';
import 'package:smoke_helper/theme/theme.dart';

class CardLogBook extends StatefulWidget {
  final String dateTime;
  final String nbCigarette;
  final String nbFeel;

  const CardLogBook({required this.dateTime, required this.nbCigarette, required this.nbFeel});

  @override
  State<CardLogBook> createState() => _CardLogBookState();
}

class _CardLogBookState extends State<CardLogBook> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.dateTime,
              style: TextStyle(
                color: CustomTheme.greyColor,
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Icon(Icons.smoking_rooms, size: 30.0, color: CustomTheme.greenColor),
                    SizedBox(width: 10.0),
                    Text(
                      widget.nbCigarette,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: CustomTheme.greyColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.emoji_emotions_rounded, size: 30.0, color: CustomTheme.greenColor),
                    SizedBox(width: 10.0),
                    Text(
                      widget.nbFeel,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: CustomTheme.greyColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
