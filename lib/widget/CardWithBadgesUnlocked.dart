import 'dart:ffi';

import 'package:flutter/material.dart';

import '../model/BadgeModel.dart';
import '../theme/theme.dart';

class CardWithBadges extends StatefulWidget {
  final String title;
  final Badge badge;

  CardWithBadges({required this.title, required this.badge});

  @override
  State<CardWithBadges> createState() => _CardWithBadgesState();
}

class _CardWithBadgesState extends State<CardWithBadges> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                widget.title,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: CustomTheme.greenColor),
              ),
            ),
          ),
          SizedBox(
            height: 90,
            child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Center(child:
                        Image.network(
                          widget.badge.icon,
                          width: 40.0,
                          height: 40.0,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 100,
                          child: Center(
                            child: Text(
                              widget.badge.description,
                              textAlign: TextAlign.center,
                              softWrap: true,
                              overflow: TextOverflow.visible,
                              style: const TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          ),
        ],
      ),
    );
  }
}
