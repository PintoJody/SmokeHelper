import 'package:flutter/material.dart';

import '../theme/theme.dart';

class ActionButton extends StatefulWidget {
  final String textButton;
  final double width;
  final double height;
  final double radius;
  final Color fontColor;
  final double fontSize;
  final VoidCallback? onPressed;

  ActionButton({
    required this.textButton,
    this.width = 20.0,
    this.height = 10.0,
    this.radius = 16.0,
    this.fontColor = CustomTheme.bgWhiteColor,
    this.fontSize = 14,
    this.onPressed,
  });

  @override
  State<ActionButton> createState() => _ActionButtonState();
}

class _ActionButtonState extends State<ActionButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.onPressed,
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(CustomTheme.greenColor),
          fixedSize: MaterialStateProperty.all<Size>(Size(widget.width, widget.height)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(widget.radius),
              )
          )
      ),
      child: Text(
        widget.textButton,
        style: TextStyle(
          color: widget.fontColor,
          fontSize: widget.fontSize,
        ),
      ),
    );
  }
}
