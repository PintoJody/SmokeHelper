import 'package:flutter/material.dart';

import '../theme/theme.dart';

class NavigatorButton extends StatefulWidget {
  final BuildContext parentContext;
  final String text;
  final double textSize;
  final Color bgColor;
  final double width;
  final double height;
  final double radius;

  const NavigatorButton({required this.parentContext, required this.text, this.textSize = 12.0, this.bgColor = CustomTheme.greenColor, this.width = 100.0, this.height = 25.0, this.radius = 15.0});

  @override
  State<NavigatorButton> createState() => _NavigatorButtonState();
}

class _NavigatorButtonState extends State<NavigatorButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(widget.radius),
      ),
      child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(widget.parentContext, '/');
        },
        child: Text(
            widget.text,
          style: TextStyle(
            fontSize: widget.textSize
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
      ),
    );
  }
}
