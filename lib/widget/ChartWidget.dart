import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/physics.dart';

import '../model/CigUserModel.dart';
import '../service/getCigUserByIdService.dart';

class ChartWidget extends StatefulWidget {
  const ChartWidget({Key? key}) : super(key: key);

  @override
  State<ChartWidget> createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget> {
  final CigUserService _getCigUserService = CigUserService();
  List<CigUser> _cigUsers = [];
  bool _isLoading = true;
  List<FlSpot> _chartData = [];

  @override
  void initState() {
    super.initState();
    _loadCigUsers();
  }

  Future<void> _loadCigUsers() async {
    final response = await _getCigUserService.getCigUser();
    if (response.success) {
      final data = jsonDecode(response.data);
      final ciguser = List<Map<String, dynamic>>.from(data["weekly"]["thisWeek"])
          .map((week) => CigUser(createdAt: DateTime.parse(week['createdAt'])))
          .toList();

      // Add the FlSpots to the _chartData list
      final spots = _getChartData(ciguser);
      setState(() {
        _cigUsers = ciguser;
        _isLoading = false;
        _chartData = spots;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
    }
  }

  // This function will return the FlSpots for the chart
  List<FlSpot> _getChartData(List<CigUser> cigUsers) {
    final spots = <FlSpot>[];
    // Map to keep track of the number of CigUsers for each day of the week
    final dayCount = {'Monday': 0, 'Tuesday': 0, 'Wednesday': 0, 'Thursday': 0, 'Friday': 0, 'Saturday': 0, 'Sunday': 0};

    // Count the number of CigUsers for each day of the week
    for (var cig in cigUsers) {
      final day = _getDayOfWeek(cig.createdAt);
      dayCount[day] = dayCount[day]! + 1;
    }

    // Add the FlSpots for each day of the week
    dayCount.forEach((key, value) {
      spots.add(FlSpot(_getDayIndex(key), value.toDouble()));
    });

    return spots;
  }


  // This function will return the day of the week for a given date
  String _getDayOfWeek(DateTime date) {
    final days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    return days[date.weekday - 1];
  }

  // This function will return the index of a day of the week
  double _getDayIndex(String dayOfWeek) {
    const dayOfWeekList = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'];
    return dayOfWeekList.indexOf(dayOfWeek).toDouble();
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading ? Center(child: CircularProgressIndicator()) : LineChart(
        LineChartData(
            minX: 0,
            maxX: 6,
            minY: 0,
            maxY: 40,
            titlesData: FlTitlesData(
              bottomTitles: AxisTitles(sideTitles: _bottomTitles),
              leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
              rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            ),
            gridData: FlGridData(
              show: true,
              getDrawingHorizontalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 1,
                );
              },
              drawVerticalLine: true,
              getDrawingVerticalLine: (value) {
                return FlLine(
                  color: const Color(0xff37434d),
                  strokeWidth: 1,
                );
              },
            ),
            borderData: FlBorderData(
              show: true,
              border: Border.all(color: const Color(0xff37434d), width: 1),
            ),
            lineBarsData: [
              LineChartBarData(
                  spots: _chartData,
                isCurved: true,
                barWidth: 6,
                belowBarData: BarAreaData(
                  show: true,
                  color: Color(0xff23b6e6).withOpacity(0.5),
                )
              )
            ]
        )
    );
  }

  SideTitles get _bottomTitles => SideTitles(
    showTitles: true,
    getTitlesWidget: (value, meta) {
      String text = '';
      switch (value.toInt()) {
        case 0:
          text = 'Lun';
          break;
        case 1:
          text = 'Mar';
          break;
        case 2:
          text = 'Mer';
          break;
        case 3:
          text = 'Jeu';
          break;
        case 4:
          text = 'Ven';
          break;
        case 5:
          text = 'Sam';
          break;
        case 6:
          text = 'Dim';
          break;
      }

      return Text(text);
    },
  );
}
