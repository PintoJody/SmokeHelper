import 'dart:ffi';

import 'package:flutter/material.dart';

class CardWithItems extends StatefulWidget {
  final String title;
  final List<IconData> icons;
  final List<String> descriptions;
  final List<int> iconsColors;

  CardWithItems({required this.title, required this.icons, required this.descriptions, required this.iconsColors});

  @override
  State<CardWithItems> createState() => _CardWithItemsState();
}

class _CardWithItemsState extends State<CardWithItems> {
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
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF55886F)),
              ),
            ),
          ),
          SizedBox(
            height: 90,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: widget.icons.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    children: [
                      Center(child:
                        IconTheme(
                          data: IconThemeData(size: 35.0, color: Color(widget.iconsColors[index])),
                          child: Icon(widget.icons[index]),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 100,
                          child: Center(
                            child: Text(
                              widget.descriptions[index],
                              textAlign: TextAlign.center,
                              softWrap: true,
                              overflow: TextOverflow.visible,
                              style: const TextStyle(fontSize: 10.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );

              },
            ),
          ),
        ],
      ),
    );
  }
}
