import 'package:flutter/material.dart';
import './colors.dart';

abstract class AppTextStyles {
  static const TextStyle heading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );
  static const TextStyle subheading = TextStyle(
    fontSize: 15,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  static const TextStyle hintStyle = TextStyle(
    fontSize: 15,
    color: Colors.grey,
    // fontWeight: FontWeight.bold,
  );

  static const TextStyle radioText = TextStyle(fontSize: 18);

  static const TextStyle mini = TextStyle(
    fontSize: 13,
    // fontWeight: FontWeight.bold,
  );
  static const TextStyle body = TextStyle(
    fontSize: 15,
    // fontWeight: FontWeight.bold,
  );
  static const TextStyle bold =
      TextStyle(fontSize: 15, fontWeight: FontWeight.w900);

  static const TextStyle medFullBold =
      TextStyle(fontSize: 17, fontWeight: FontWeight.bold);
  static const TextStyle bigBold =
      TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  static TextStyle textButtonStyle = TextStyle(
      fontWeight: FontWeight.w900, fontSize: 15, color: AppColors.buttonColor);
}
