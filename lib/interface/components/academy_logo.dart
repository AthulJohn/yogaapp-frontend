import 'package:flutter/material.dart';

class AcademyLogo extends StatelessWidget {
  const AcademyLogo({this.size = 100, this.hasText = false, super.key});
  final double size;
  final bool hasText;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: size, child: Image.asset("assets/images/logo/bird.png")),
        SizedBox(height: 10),
        if (hasText)
          Text(
            "Nirvana Academy of Yoga and Meditation",
            style: TextStyle(
                color: Colors.pink[200],
                fontSize: 10 + 0.12 * size,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
      ],
    );
  }
}
