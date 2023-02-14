import 'dart:ffi';

import 'package:flutter/material.dart';

class CardWithItems extends StatefulWidget {
  final String title;

  CardWithItems({required this.title});

  @override
  State<CardWithItems> createState() => _CardWithItemsState();
}

class _CardWithItemsState extends State<CardWithItems> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.white
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network('https://picsum.photos/50/50'),
                    SizedBox(height: 8.0),
                    Center(child: Text('1')),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network('https://picsum.photos/50/50'),
                    SizedBox(height: 8.0),
                    Text('2'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network('https://picsum.photos/50/50'),
                    SizedBox(height: 8.0),
                    Text('3'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.network('https://picsum.photos/50/50'),
                    SizedBox(height: 8.0),
                    Text('4'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
