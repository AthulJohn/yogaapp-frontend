import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/text_styles.dart';

class AppTextButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const AppTextButton({required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(text, style: AppTextStyles.textButtonStyle),
    );
  }
}

class PinkTextButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  const PinkTextButton({required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(text,
          style: AppTextStyles.textButtonStyle.copyWith(
              color: AppColors.tertiary, fontWeight: FontWeight.bold)),
    );
  }
}

class AppElevatedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final double? fontSize, padding;
  const AppElevatedButton(
      {required this.onPressed,
      required this.text,
      this.fontSize,
      this.padding,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTextStyles.bold.copyWith(fontSize: fontSize),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.buttonColor),
        padding: padding != null
            ? MaterialStateProperty.all(EdgeInsets.symmetric(
                horizontal: padding!, vertical: (padding!) / 2))
            : null,
      ),
    );
  }
}

class AppOutlinedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final double? fontSize, padding;
  const AppOutlinedButton(
      {required this.onPressed,
      required this.text,
      this.fontSize,
      this.padding,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(fontSize: fontSize, color: AppColors.buttonColor),
      ),
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          padding: padding != null
              ? MaterialStateProperty.all(EdgeInsets.symmetric(
                  horizontal: padding!, vertical: (padding!) / 2))
              : null,
          side: MaterialStateProperty.all(
              BorderSide(color: AppColors.buttonColor, width: 2))),
    );
  }
}
