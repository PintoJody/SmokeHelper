import 'package:flutter/material.dart';

import '../theme/theme.dart';

class imgWithText extends StatefulWidget {
  final String title;
  final String img;
  final String detail;

  imgWithText({required this.title, required this.img, this.detail = "0m 0j 0h"});

  @override
  State<imgWithText> createState() => _imgWithTextState();
}

class _imgWithTextState extends State<imgWithText> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            widget.img,
            width: 410,
            height: 230,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 70,
          left: 0,
          child: Container(
            padding: const EdgeInsets.all(8),
            color: Colors.transparent,
            child: Text(
              widget.title,
              style: const TextStyle(
                color: CustomTheme.bgWhiteColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          left: 0,
          child: Container(
            padding: const EdgeInsets.all(8),
            color: Colors.transparent,
            child: Text(
              widget.detail,
              style: const TextStyle(
                color: CustomTheme.bgWhiteColor,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
