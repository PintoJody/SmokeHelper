import 'package:flutter/material.dart';

class LogBookView extends StatefulWidget {
  const LogBookView({Key? key}) : super(key: key);

  @override
  State<LogBookView> createState() => _LogBookViewState();
}

class _LogBookViewState extends State<LogBookView> {
  @override
  Widget build(BuildContext context) {
    return Text("Mon journal");
  }
}
