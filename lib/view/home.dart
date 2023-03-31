import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:smoke_helper/widget/CardWithBadgesUnlocked.dart';
import 'package:smoke_helper/widget/CardWithUserInfo.dart';
import 'package:smoke_helper/widget/imgWithText.dart';

import '../model/BadgeModel.dart';
import '../service/getCigUserByIdService.dart';
import '../service/getUserBySlug.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  bool _isLoading = true;
  int _countBadges = 0;
  int _thisMonth = 0;
  int _lastMonth = 0;
  final CigUserService _getCigUserService = CigUserService();
  List<Badge> _badges = [];
  int _daysDifference = 0;
  int _monthsDifference = 0;
  int _hoursDifference = 0;
  int _minutesDifference = 0;
  int _secondsDifference = 0;
  num _savedMonthly=0;
  num _lessCigsMonthly=0;
  dynamic _cigInfo=null;

  @override
  void initState() {
    super.initState();
    getUserData();
    _fetchBadges();
    _getLastCig();
    _getCigUser();
  }

  Future<void> getUserData() async {
    final responseJson = await getUserBySlugService().getUser();

    Map<String, dynamic> responseData;
    responseData = await json.decode(responseJson.data);

    setState(() {
      _isLoading = false;
      _countBadges = responseData["badges"].length;
      _cigInfo = responseData["cigInfo"];
    });
  }

  Future<void> _getLastCig() async {
    final responseJson = await CigUserService.getLastCig();

    Map<String, dynamic> responseData;
    responseData = await json.decode(responseJson.data);

    setState(() {
      _isLoading = false;

      //Datetime without smoke
      final now = DateTime.now();
      final responseDate = DateTime.parse(responseData['createdAt']);

      _daysDifference = now.difference(responseDate).inDays;
      _monthsDifference = ((_daysDifference % 365) / 30).floor();
      _hoursDifference = now.difference(responseDate).inHours;
      _minutesDifference = now.difference(responseDate).inMinutes;
      _secondsDifference = now.difference(responseDate).inSeconds;

    });
  }

  Future<void> _getCigUser() async {
    final responseJson = await _getCigUserService.getCigUser();

    Map<String, dynamic> responseData;
    responseData = await json.decode(responseJson.data);

    setState(() {
      _isLoading = false;
      _thisMonth = responseData["monthly"]["thisMonth"].length;
      _lastMonth = responseData["monthly"]["lastMonth"].length;
      _savedMonthly=(_lastMonth / _cigInfo["cigsPerPack"]).ceil() * _cigInfo["averagePackPrice"]-(_thisMonth / _cigInfo["cigsPerPack"]).ceil() * _cigInfo["averagePackPrice"];
      _lessCigsMonthly=_lastMonth-_thisMonth;

      //Cig avoided
      if(_lessCigsMonthly < 0){
        _lessCigsMonthly = 0;
      }

      //money saved
      if(_savedMonthly < 0){
        _savedMonthly = 0;
      }

    });
  }

  Future<void> _fetchBadges() async {
    final responseJson = await getUserBySlugService().getUser();

    Map<String, dynamic> responseData;
    responseData = await json.decode(responseJson.data);

    setState(() {
      _badges = responseData["badges"]
          .map<Badge>((badgeJson) =>
          Badge(
            title: badgeJson['title'],
            description: badgeJson['description'],
            unlockDate: DateTime.parse(badgeJson['unlockDate']),
            icon: badgeJson['icon'],
          ))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {

    //Array card Progres
    final List<IconData> iconsProgres = [
      Icons.calendar_month,
      Icons.local_fire_department,
      Icons.euro,
      Icons.emoji_events_outlined,
    ];
    final List<String> descriptionsProgres = [
      '$_daysDifference jours sans fumer',
      '$_lessCigsMonthly cigarettes évitées',
      '${_savedMonthly}€ économisés',
      '$_countBadges badges obtenus',
    ];
    //TODO voir condition dans CardWithItems car on utilise des icons pour progres mais des images pour les badges
    final List<int> iconsColorsProgres = [
      0xFF699BF7,
      0xFFFF9A62,
      0xFFFFD233,
      0xFF4ECB71,
    ];


    return _isLoading ? Center(child: CircularProgressIndicator()) : SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 25.0, left: 9, right: 9),
        child: Column(
          children: [
            imgWithText(
                title: 'Temps passé sans fumer :',
                img: 'https://img.freepik.com/vecteurs-libre/illustration-scenes-nature-dessinees-main_23-2150053464.jpg?w=740&t=st=1676362568~exp=1676363168~hmac=477a3622922208d1a59f7390ee35fcd96351ec687b0706b8cfce2ffe749defca',
                detail: '${_monthsDifference}m ${_daysDifference}j ${_hoursDifference}h'
            ),
            const SizedBox(height: 40.0),
            CardWithUserInfo(
              title: 'Mes Progrès',
              icons: iconsProgres,
              descriptions: descriptionsProgres,
              iconsColors: iconsColorsProgres,
            ),
            const SizedBox(height: 40.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _badges.length,
              itemBuilder: (context, index) {
                final badge = _badges[index];
                return CardWithBadges(title: 'Mes Badges', badge: badge);
              },
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}



