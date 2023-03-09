
import 'package:flutter/material.dart';

import '../theme/theme.dart';
import '../widget/HeaderNavigationView.dart';

class LogBookFormView extends StatefulWidget {
  @override
  _LogBookFormViewState createState() => _LogBookFormViewState();
}

class _LogBookFormViewState extends State<LogBookFormView> {
  final _formKey = GlobalKey<FormState>();
  DateTime _selectedDate = DateTime.now();

  double _nbCigarette = 0.0;
  double _nbFeeling = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomTheme.bgWhiteColor,
      appBar: HeaderNavigationView(
          pageName: "Ajouter une carte",
          parentContext: context,
          isHomePage: true),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16.0),
          children: <Widget>[
            const Text(
              "Ici, vous pouvez renseigner une date et saisir le nombre de cigarettes que vous avez fumées, ainsi que votre ressenti général de manque. Cela vous permet de surveiller votre consommation de tabac.",
              style: TextStyle(
                color: CustomTheme.greenColor,
                fontSize: 14,
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              "Ressenti de manque :",
              style: TextStyle(
                  color: CustomTheme.greyColor,
                  fontSize: 16,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("1 : Pas de manque 😊", style: TextStyle(fontSize: 14)),
                SizedBox(height: 5.0),
                Text("2 : léger manque 😐", style: TextStyle(fontSize: 14)),
                SizedBox(height: 5.0),
                Text("3 : manque modéré 😕", style: TextStyle(fontSize: 14)),
                SizedBox(height: 5.0),
                Text("4 : fort manque 😫", style: TextStyle(fontSize: 14)),
                SizedBox(height: 5.0),
                Text("5 : très fort manque 😖", style: TextStyle(fontSize: 14)),
                SizedBox(height: 35.0),
              ],
            ),
            ElevatedButton(
              child: Text('Sélectionnez une date'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(CustomTheme.greenColor),
              ),
              onPressed: () async {
                final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime(2015, 8),
                    lastDate: DateTime(2101));
                if (picked != null && picked != _selectedDate)
                  setState(() {
                    _selectedDate = picked;
                  });
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                  labelText: 'Nombre de cigarette(s) fumée(s)',
                  border: OutlineInputBorder(),
                  hintText: 'Entrez un nombre'),
              onChanged: (value) {
                setState(() {
                  _nbCigarette = double.tryParse(value) ?? 0.0;
                });
              },
            ),
            SizedBox(height: 16.0),
            TextFormField(
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                  labelText: 'Sentiment de manque',
                  border: OutlineInputBorder(),
                  hintText: 'Entrez un nombre'),
              onChanged: (value) {
                setState(() {
                  _nbFeeling = double.tryParse(value) ?? 0.0;
                });
              },
              validator: (value) {
                if (_nbFeeling <= 0.0 || _nbFeeling > 5 ) {
                  return 'Le champ doit être compris entre 1 et 5';
                }
                return null;
              },
            ),
            SizedBox(height: 32.0),
            ElevatedButton(
              child: Text('Ajouter'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(CustomTheme.greenColor),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  print('Date : $_selectedDate');
                  print('Nombre de cigarette : $_nbCigarette');
                  print('Ressenti : $_nbFeeling');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
