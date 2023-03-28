import 'package:flutter/material.dart';
import 'package:smoke_helper/model/UserModel.dart';

import '../service/auth_token_service.dart';
import '../service/updateUserService.dart';
import '../theme/theme.dart';
import '../widget/HeaderNavigationView.dart';

class ConsumptionView extends StatefulWidget {
  @override
  _ConsumptionViewState createState() => _ConsumptionViewState();
}

class _ConsumptionViewState extends State<ConsumptionView> {
  final AuthService _authService = AuthService();

  String? userId;
  int _estimatedAverage = 0;
  int _packPrice = 0;
  int _cigsPerPack = 0;

  UserCigInfo? _userCigInfo;

  @override
  void initState() {
    super.initState();
    getUserId();
  }

  Future<void> getUserId() async {
    final id = await _authService.getAuthToken('userId');
    print('ID utilisateur: $id');
    setState(() {
      userId = id;
    });
  }

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
                      "Combien de cigarette pensez-vous fumer par jour ?",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: CustomTheme.greenColor, width: 3),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(2),
                              bottomLeft: Radius.circular(2),
                            ),
                          ),
                          child: IconButton(
                            onPressed: () =>
                                _decrementValue(_estimatedAverage, (value) => _estimatedAverage = value),
                            icon: Icon(Icons.remove),
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "$_estimatedAverage",
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(width: 20),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: CustomTheme.greenColor, width: 3),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(2),
                              bottomLeft: Radius.circular(2),
                            ),
                          ),
                          child: IconButton(
                            onPressed: () =>
                                _incrementValue(_estimatedAverage, (value) => _estimatedAverage = value),
                            icon: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Quel est le prix du paquet de votre marque habituelle ? ",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: CustomTheme.greenColor, width: 3),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(2),
                              bottomLeft: Radius.circular(2),
                            ),
                          ),
                          child: IconButton(
                            onPressed: () =>
                                _decrementValue(_packPrice, (value) => _packPrice = value),
                            icon: Icon(Icons.remove),
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "$_packPrice",
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(width: 20),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: CustomTheme.greenColor, width: 3),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(2),
                              bottomLeft: Radius.circular(2),
                            ),
                          ),
                          child: IconButton(
                            onPressed: () =>
                                _incrementValue(_packPrice, (value) => _packPrice = value),
                            icon: Icon(Icons.add),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Combien de cigarettes contient votre paquet / blague à tabac ?",
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: CustomTheme.greenColor, width: 3),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(2),
                              bottomLeft: Radius.circular(2),
                            ),
                          ),
                          child: IconButton(
                            onPressed: () => _decrementValue(_cigsPerPack, (value) => _cigsPerPack = value),
                            icon: Icon(Icons.remove),
                            padding: EdgeInsets.zero,
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          "$_cigsPerPack",
                          style: TextStyle(fontSize: 25),
                        ),
                        SizedBox(width: 20),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: CustomTheme.greenColor, width: 3),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(2),
                              bottomRight: Radius.circular(2),
                            ),
                          ),
                          child: IconButton(
                            onPressed: () => _incrementValue(_cigsPerPack, (value) => _cigsPerPack = value),
                            icon: Icon(Icons.add),
                            padding: EdgeInsets.zero,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(CustomTheme.greenColor),
                  ),
                  onPressed: () async {
                    //Init _userCigInfo
                    _userCigInfo = UserCigInfo(averagePackPrice: _packPrice, cigsPerPack: _cigsPerPack, estimatedAveragePerDay: _estimatedAverage);
                    final response = await UpdateService.update(userId!, userCigInfo: _userCigInfo);
                    print(response.success);
                    print(response.data);
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
