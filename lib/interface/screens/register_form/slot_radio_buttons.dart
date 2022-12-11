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
              child: InkWell(
                splashColor: AppColors.buttonColor,
                onTap: () {
                  setState(() {
                    slot = 1;
                  });
                  widget.onChanged?.call(1);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: slot == 1 ? AppColors.buttonColor : Colors.grey,
                        width: slot == 1 ? 4 : 2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text("6 AM - 7 AM",
                      style: slot == 1
                          ? AppTextStyles.radioTextSelected
                          : AppTextStyles.radioText),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: InkWell(
                splashColor: AppColors.buttonColor,
                onTap: () {
                  setState(() {
                    slot = 2;
                  });
                  widget.onChanged?.call(2);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: slot == 2 ? AppColors.buttonColor : Colors.grey,
                        width: slot == 2 ? 4 : 2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text("7 AM - 8 AM",
                      style: slot == 2
                          ? AppTextStyles.radioTextSelected
                          : AppTextStyles.radioText),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: InkWell(
                splashColor: AppColors.buttonColor,
                onTap: () {
                  setState(() {
                    slot = 3;
                  });
                  widget.onChanged?.call(3);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: slot == 3 ? AppColors.buttonColor : Colors.grey,
                        width: slot == 3 ? 4 : 2),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text("8 AM - 9 AM",
                      style: slot == 3
                          ? AppTextStyles.radioTextSelected
                          : AppTextStyles.radioText),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: InkWell(
                  splashColor: AppColors.buttonColor,
                  onTap: () {
                    setState(() {
                      slot = 4;
                    });
                    widget.onChanged?.call(4);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color:
                              slot == 4 ? AppColors.buttonColor : Colors.grey,
                          width: slot == 4 ? 4 : 2),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Text("5 PM - 6 PM",
                        style: slot == 4
                            ? AppTextStyles.radioTextSelected
                            : AppTextStyles.radioText),
                  )),
            )
          ],
        ),
      ],
    );
  }
}
