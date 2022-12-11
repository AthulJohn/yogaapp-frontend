import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/text_styles.dart';

class AppTextField extends StatelessWidget {
  final String? hintText, errorText, labelText;
  final Function(String) onChanged;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffix;
  final TextEditingController? tec;
  const AppTextField(
      {required this.onChanged,
      this.obscureText = false,
      this.keyboardType = TextInputType.text,
      this.hintText,
      this.errorText,
      this.labelText,
      this.suffix,
      this.tec,
      Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: tec,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        filled: true,
        labelText: labelText,
        floatingLabelStyle: TextStyle(color: AppColors.tertiary),
        errorText: errorText,
        errorMaxLines: 3,
        hintText: hintText,
        hintStyle: AppTextStyles.hintStyle,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.secondary,
            width: 1,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: Colors.red,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: AppColors.tertiary,
            width: 1,
          ),
        ),
        fillColor: const Color.fromRGBO(255, 255, 255, 1),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15, horizontal: 14),
        isDense: true,
        suffixIconConstraints: const BoxConstraints(maxHeight: 33),
        suffixIcon: suffix,
      ),
      style: AppTextStyles.body.copyWith(fontSize: 18),
      cursorColor: AppColors.tertiary,
      obscureText: obscureText,
      onChanged: onChanged,
    );
  }
}

class AppCalenderField extends StatelessWidget {
  final String? hintText;
  final Function(String) onChanged;
  final bool isDob;
  final TextEditingController tec;
  const AppCalenderField(
      {required this.onChanged,
      this.hintText,
      this.isDob = false,
      required this.tec,
      Key? key})
      : super(key: key);
  String dateToString(DateTime date) {
    return '${date.year}-${date.month}-${date.day} ${date.hour}:${date.minute}';
  }

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      onChanged: onChanged,
      hintText: hintText,
      tec: tec,
      suffix: InkWell(
        onTap: () async {
          DateTime dt = await showDatePicker(
                  context: context,
                  initialDate: isDob ? DateTime(2000) : DateTime.now(),
                  firstDate: DateTime(isDob ? 1910 : 2022),
                  lastDate: DateTime(isDob ? 2030 : 2100)) ??
              DateTime.now();
          if (!isDob) {
            TimeOfDay tm = await showTimePicker(
                    context: context, initialTime: TimeOfDay.now()) ??
                TimeOfDay.now();
            dt = dt.add(Duration(hours: tm.hour, minutes: tm.minute));
          }

          if (isDob)
            tec.text = '${dt.day}-${dt.month}-${dt.year}';
          else
            tec.text = dateToString(dt);
          ;
          onChanged(tec.text);
        },
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Icon(Icons.calendar_today),
        ),
      ),
    );
  }
}

// class AppPasswordField extends StatefulWidget {
//   final String? hintText;
//   final Function(String) onChanged;
//   const AppPasswordField({required this.onChanged, this.hintText, Key? key})
//       : super(key: key);

//   @override
//   State<AppPasswordField> createState() => _AppPasswordFieldState();
// }

// class _AppPasswordFieldState extends State<AppPasswordField> {
//   bool textVisible = false;
//   TextEditingController tec = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return AppTextField(
//       onChanged: widget.onChanged,
//       hintText: widget.hintText,
//       suffix: AnimatedIconButton(
//         onPressed: () {
//           setState(() {
//             textVisible = !textVisible;
//           });
//         },
//         icons: const [
//           AnimatedIconItem(
//             icon: Icon(
//               Icons.visibility_outlined,
//               color: Colors.black54,
//             ),
//           ),
//           AnimatedIconItem(
//             icon: Icon(
//               Icons.visibility_off_outlined,
//               color: Colors.black54,
//             ),
//           ),
//         ],
//         size: 20,
//       ),
//       obscureText: !textVisible,
//     );
//   }
// }
