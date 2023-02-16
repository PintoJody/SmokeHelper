import 'package:flutter/material.dart';

class CardButton extends StatefulWidget {
  final String username;

  const CardButton({required this.username});

  @override
  State<CardButton> createState() => _CardButtonState();
}

class _CardButtonState extends State<CardButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //TODO navigation vers le profil
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
                  const Icon(Icons.verified_user), // icône à gauche
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
                              color: Color(0xFF545454)
                          )
                      ),
                      const SizedBox(height: 8.0),
                      const Text(
                        "Voir mon profil",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF55886F),
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
