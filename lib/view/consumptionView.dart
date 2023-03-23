import 'package:flutter/material.dart';

import '../theme/theme.dart';
import '../widget/HeaderNavigationView.dart';

class ConsumptionView extends StatefulWidget {
  @override
  _ConsumptionViewState createState() => _ConsumptionViewState();
}

class _ConsumptionViewState extends State<ConsumptionView> {
  int _value1 = 0;
  int _value2 = 0;
  int _value3 = 0;

  void _incrementValue(int value, ValueSetter<int> setValue) {
    setState(() {
      setValue(value + 1);
    });
  }

  void _decrementValue(int value, ValueSetter<int> setValue) {
    setState(() {
      if (value > 0) {
        setValue(value - 1);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'SmokeHelper',
        home: Scaffold(
          backgroundColor: CustomTheme.bgWhiteColor,
          appBar: HeaderNavigationView(pageName: "Ma consommation", parentContext: context, isHomePage: false),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  "Veuillez renseigner votre consommation moyenne pour que vous puissiez voir votre évolution !",
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Ma consommation moyenne',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: CustomTheme.greenColor,
                    fontSize: 18.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Champ 1",
                      style: TextStyle(fontSize: 20),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () =>
                              _decrementValue(_value1, (value) => _value1 = value),
                          icon: Icon(Icons.remove),
                        ),
                        Text(
                          "$_value1",
                          style: TextStyle(fontSize: 20),
                        ),
                        IconButton(
                          onPressed: () =>
                              _incrementValue(_value1, (value) => _value1 = value),
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                    Text(
                      "Champ 2",
                      style: TextStyle(fontSize: 20),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () =>
                              _decrementValue(_value2, (value) => _value2 = value),
                          icon: Icon(Icons.remove),
                        ),
                        Text(
                          "$_value2",
                          style: TextStyle(fontSize: 20),
                        ),
                        IconButton(
                          onPressed: () =>
                              _incrementValue(_value2, (value) => _value2 = value),
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                    Text(
                      "Champ 3",
                      style: TextStyle(fontSize: 20),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () =>
                              _decrementValue(_value3, (value) => _value3 = value),
                          icon: Icon(Icons.remove),
                        ),
                        Text(
                          "$_value3",
                          style: TextStyle(fontSize: 20),
                        ),
                        IconButton(
                          onPressed: () =>
                              _incrementValue(_value3, (value) => _value3 = value),
                          icon: Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(CustomTheme.greenColor),
                  ),
                  onPressed: () {
                    // Envoyer les données
                  },
                  child: Padding(
                    padding: EdgeInsets.all(15.0),
                    child: const Text(
                      "Valider",
                      style: TextStyle(color: CustomTheme.bgWhiteColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }
}
