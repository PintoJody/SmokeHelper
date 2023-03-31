import 'package:flutter/material.dart';
import 'package:smoke_helper/widget/ActionButton.dart';

import '../model/BadgeModel.dart';
import '../service/auth_token_service.dart';
import '../service/updateUserService.dart';
import '../theme/theme.dart';
import 'package:intl/intl.dart';

class CardBadge extends StatefulWidget {
  final Badge badge;
  final bool isLocked;

  CardBadge({required this.badge, required this.isLocked});

  @override
  State<CardBadge> createState() => _CardBadgeState();
}

class _CardBadgeState extends State<CardBadge> {
  final AuthService _authService = AuthService();
  String? userId;

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


  @override
  Widget build(BuildContext context) {

    String formattedDate = DateFormat('d-M-y').format(widget.badge.unlockDate);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Image.network(
                widget.badge.icon,
                width: 60.0,
                height: 60.0,
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.badge.title,
                      style: const TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: CustomTheme.greenColor
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.badge.description,
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: CustomTheme.greyColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    if (!widget.isLocked) ...[
                      const SizedBox(height: 10.0),
                      Text(
                        "Badge obtenu le $formattedDate",
                        style: const TextStyle(
                          fontSize: 10.0,
                          color: CustomTheme.greyColor,
                        ),
                      ),
                    ],

                  ],
                ),
              ),
            ),
            //TODO Add badge icon to profil picture
            if(!widget.isLocked)...[
              Expanded(
                flex: 2,
                child: ActionButton(
                  textButton: "Utiliser",
                  fontColor: CustomTheme.bgWhiteColor,
                  onPressed: () async {
                    final response = await UpdateService.update(userId!, featuredBadge: widget.badge.id);
                    setState(() {

                    });
                  },
                ),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
