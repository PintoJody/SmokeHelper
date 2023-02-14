import 'package:flutter/material.dart';

class imgWithText extends StatefulWidget {
  const imgWithText({Key? key}) : super(key: key);

  @override
  State<imgWithText> createState() => _imgWithTextState();
}

class _imgWithTextState extends State<imgWithText> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.network(
            'https://img.freepik.com/vecteurs-libre/illustration-scenes-nature-dessinees-main_23-2150053464.jpg?w=740&t=st=1676362568~exp=1676363168~hmac=477a3622922208d1a59f7390ee35fcd96351ec687b0706b8cfce2ffe749defca',
            width: 410,
            height: 230,
            fit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 70,
          left: 0,
          child: Container(
            padding: const EdgeInsets.all(8),
            color: Colors.transparent,
            child: const Text(
              'Temps passé sans fumer :',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Positioned(
          bottom: 15,
          left: 0,
          child: Container(
            padding: const EdgeInsets.all(8),
            color: Colors.transparent,
            child: const Text(
              '2m 12j 5h',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
