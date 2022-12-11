// import 'package:flutter/material.dart';
// import 'package:yoga_frontend/interface/screens/payment_screen/payment.dart';
// import 'package:yoga_frontend/models/person_model.dart';
// import 'package:yoga_frontend/services/register.dart';

// import '../../../constants/text_styles.dart';
// import '../../components/buttons.dart';

// class ProceedButton extends StatefulWidget {
//   final int age, slot;
//   final String name, phone;
//   const ProceedButton(
//       {required this.age,
//       required this.slot,
//       required this.name,
//       required this.phone,
//       super.key});

//   @override
//   State<ProceedButton> createState() => _ProceedButtonState();
// }

// class _ProceedButtonState extends State<ProceedButton> {
//   bool logging = false;
//   @override
//   Widget build(BuildContext context) {
//     return logging
//         ? Row(
//             children: const [
//               Text(
//                 'Signing Up...  ',
//                 style: AppTextStyles.body,
//               ),
//               CircularProgressIndicator(
//                 color: Colors.black,
//               )
//             ],
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//           )
//         : Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               AppElevatedButton(
//                   onPressed: () async {
//                     if (widget.age == -1) {
//                       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                         content: Text(
//                           'Please Enter a Valid Age',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                         backgroundColor: Colors.red,
//                       ));
//                       return;
//                     } else if (widget.phone == 'X') {
//                       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                         content: Text(
//                           'Please Enter a Valid Phone Number',
//                           style: TextStyle(color: Colors.white),
//                         ),
//                         backgroundColor: Colors.red,
//                       ));
//                       return;
//                     } else {
//                       setState(() {
//                         logging = true;
//                       });
//                       int result = await registerPerson(Person(
//                           name: widget.name,
//                           phone: widget.phone,
//                           slot: widget.slot,
//                           age: widget.age));
//                       if (result==-1) {
//                         setState(() {
//                           print("setting ;ogging");
//                           logging = false;
//                         });

//                         ScaffoldMessenger.of(context)
//                             .showSnackBar(const SnackBar(
//                           content: Text(
//                             'An Error Occured',
//                             style: TextStyle(color: Colors.white),
//                           ),
//                           backgroundColor: Colors.red,
//                         ));

//                         return;
//                       }
//                       Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => PaymentsPage(result)));

//                       //   Navigator.pushNamed(context, '/verification');
//                       // } else {
//                       //   setState(() {
//                       //     logging = false;
//                       //   });

//                       //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//                       //     content: Text(
//                       //       result,
//                       //       style: TextStyle(color: Colors.white),
//                       //     ),
//                       //     backgroundColor: Colors.red,
//                       //   ));
//                       // }
//                     }
//                   },
//                   text: 'PROCEED TO PAYMENT'),
//             ],
//           );
//   }
// }
