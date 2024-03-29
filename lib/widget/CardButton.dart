import 'package:flutter/material.dart';

import '../theme/theme.dart';

class CardButton extends StatefulWidget {
  final String username;
  final String routeName;
  final BuildContext parentContext;
  final profilePicture;

  const CardButton({required this.username, required this.routeName, required this.parentContext, this.profilePicture});

  @override
  State<CardButton> createState() => _CardButtonState();
}

class _CardButtonState extends State<CardButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(widget.parentContext, widget.routeName);
      },
      child: SizedBox(
          height: 100.0,
          width: 400.0,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  widget.profilePicture.isEmpty ? Icon(Icons.verified_user, size: 45) :
                  Image.network(
                    widget.profilePicture,
                    width: 60.0,
                    height: 60.0,
                  ),
                  const SizedBox(width: 28.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          widget.username,
                          style: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: CustomTheme.greyColor
                          )
                      ),
                      const SizedBox(height: 8.0),
                      const Text(
                        "Voir mon profil",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: CustomTheme.greenColor,
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  const Icon(Icons.arrow_forward), // icône de flèche droite à droite du bouton
                ],
              ),
          ),
        ),
      ),
    );
  }
}
