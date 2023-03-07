import 'package:flutter/material.dart';
import 'package:smoke_helper/widget/ActionButton.dart';

import '../theme/theme.dart';

class CardBadge extends StatefulWidget {
  final IconData icon;
  final String title;
  final String descriptions;
  final String date;
  final bool isLock;

  CardBadge({this.icon = Icons.lock_outline_rounded, required this.title, required this.descriptions, this.date = "", required this.isLock});

  @override
  State<CardBadge> createState() => _CardBadgeState();
}

class _CardBadgeState extends State<CardBadge> {
  @override
  Widget build(BuildContext context) {
    return Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 2,
                  child: Icon(
                    widget.icon,
                    color: CustomTheme.greenColor,
                    size: 45.0,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.title,
                          style: const TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: CustomTheme.greenColor
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          widget.descriptions,
                          style: const TextStyle(
                              fontSize: 14.0,
                              color: CustomTheme.greyColor,
                              fontWeight: FontWeight.bold,
                          ),
                        ),

                        if (!widget.isLock) ...[
                          const SizedBox(height: 10.0),
                          Text(
                            "Badge obtenu le ${widget.date}",
                            style: const TextStyle(
                              fontSize: 10.0,
                              color: CustomTheme.greyColor,
                            ),
                          ),
                        ],

                      ],
                    ),
                  ),
                ),
                if(!widget.isLock)...[
                  Expanded(
                    flex: 2,
                    child: ActionButton(textButton: "Utiliser", fontColor: CustomTheme.bgWhiteColor),
                  ),
                ]

              ],
            ),
          ),
    );
  }
}
