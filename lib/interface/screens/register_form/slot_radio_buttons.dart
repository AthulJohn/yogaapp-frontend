import 'package:flutter/material.dart';
import 'package:yoga_frontend/constants/colors.dart';
import 'package:yoga_frontend/constants/text_styles.dart';

class SlotRadioButtons extends StatefulWidget {
  final Function(int)? onChanged;
  final int slot;
  const SlotRadioButtons({this.onChanged, this.slot = 1, super.key});

  @override
  State<SlotRadioButtons> createState() => _SlotRadioButtonsState();
}

class _SlotRadioButtonsState extends State<SlotRadioButtons> {
  @override
  void initState() {
    super.initState();
    slot = widget.slot;
  }

  int slot = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: Row(children: [
                Radio(
                  activeColor: AppColors.buttonColor,
                  value: 1,
                  groupValue: slot,
                  onChanged: (val) {
                    setState(() {
                      slot = 1;
                    });
                    widget.onChanged?.call(1);
                  },
                ),
                const Text("6 AM - 7 AM", style: AppTextStyles.radioText),
              ]),
            ),
            Expanded(
              child: Row(children: [
                Radio(
                  activeColor: AppColors.buttonColor,
                  value: 2,
                  groupValue: slot,
                  onChanged: (val) {
                    setState(() {
                      slot = 2;
                    });
                    widget.onChanged?.call(2);
                  },
                ),
                const Text("7 AM - 8 AM", style: AppTextStyles.radioText),
              ]),
            )
          ],
        ),
        Row(
          children: [
            Expanded(
              child: Row(children: [
                Radio(
                  activeColor: AppColors.buttonColor,
                  value: 3,
                  groupValue: slot,
                  onChanged: (val) {
                    setState(() {
                      slot = 3;
                    });
                    widget.onChanged?.call(3);
                  },
                ),
                const Text("8 AM - 9 AM", style: AppTextStyles.radioText),
              ]
                  // contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  ),
            ),
            Expanded(
              child: Row(children: [
                Radio(
                  activeColor: AppColors.buttonColor,
                  value: 4,
                  groupValue: slot,
                  onChanged: (val) {
                    setState(() {
                      slot = 4;
                    });
                    widget.onChanged?.call(4);
                  },
                ),
                const Text("5 PM - 6 PM", style: AppTextStyles.radioText),
              ]),
            )
          ],
        ),
      ],
    );
  }
}
