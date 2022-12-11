import 'package:flutter/material.dart';
import 'package:yoga_frontend/constants/text_styles.dart';

import '../../../constants/colors.dart';

class OutlineMessage extends StatelessWidget {
  const OutlineMessage({required this.child, this.heading = "", super.key});
  final Widget child;
  final String heading;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "$heading:",
          style: AppTextStyles.strongStyle.copyWith(fontSize: 20),
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.buttonColor, width: 2),
          ),
          padding: EdgeInsets.all(10),
          child: child,
        ),
      ],
    );
  }
}
