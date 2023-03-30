import 'package:flutter/material.dart';
import '../theme/theme.dart';
import 'dart:convert';
import '../widget/ChartWidget.dart';
import '../service/getCigUserByIdService.dart';


class ProgressView extends StatefulWidget {
  @override
  _ProgressViewState createState() => _ProgressViewState();
}

class _ProgressViewState extends State<ProgressView> {
  int _selectedIndex = 0;
  bool _isLoading = true;
  int _countCig = 0;
  final CigUserService _getCigUserService = CigUserService();

  @override
  void initState() {
    super.initState();
    _getUserCigData();
  }

  Future<void> _getUserCigData() async {
    final response = await _getCigUserService.getCigUser();

    if(response.success){
      final data = jsonDecode(response.data);

      setState(() {
        _countCig = data["weekly"]["thisWeek"].length;
        _isLoading = false;
      });

    }else{
      print("Error fetch userCigData");
    }

  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? Center(child: CircularProgressIndicator()) : SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20.0),
          const Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: const Text("7 derniers jours",
                style: TextStyle(
                    color: CustomTheme.greenColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0)),
          ),
          const SizedBox(height: 15.0),
          SizedBox(
            width: 130,
            height: 300,
            child: Container(
              margin: EdgeInsets.all(20.0),

              //TODO mettre en place les autres charts
              child: _selectedIndex == 0 ? ChartWidget() : Text("Autre Chart"),
            ),
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = 0;
                  });
                },
                child: Card(
                  child: Container(
                    color: CustomTheme.greenColor,
                    width: double.infinity,
                    height: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20.0),
                          child: Text("Cigarettes fumées", style: TextStyle(color: CustomTheme.bgWhiteColor, fontWeight: FontWeight.bold, fontSize: 16.0)),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: CustomTheme.warningColor,
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                            child: Text("$_countCig", style: TextStyle(color: CustomTheme.bgWhiteColor, fontWeight: FontWeight.bold, fontSize: 16.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
