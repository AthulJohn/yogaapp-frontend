import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga_frontend/interface/components/arc_background.dart';
import 'package:yoga_frontend/interface/screens/register_form/proceed_to_pay_button.dart';
import 'package:yoga_frontend/interface/screens/register_form/slot_radio_buttons.dart';
import 'package:yoga_frontend/services/complete_payment.dart';

import '../../../constants/colors.dart';
import '../../../constants/text_styles.dart';
import '../../../constants/values.dart';
import '../../../models/person_model.dart';
import '../../../services/register.dart';
import '../../components/buttons.dart';
import '../../components/text_fields.dart';
import 'payment_tile.dart';

class PaymentsPage extends StatelessWidget {
  const PaymentsPage(this.id, {this.dueno = -1, Key? key}) : super(key: key);
  final int id;
  final int dueno;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: ArcBackground(
      child: PaymentsBody(id, dueno: dueno),
    ));
  }
}

class PaymentsBody extends StatelessWidget {
  const PaymentsBody(this.id, {this.dueno = -1, Key? key}) : super(key: key);
  final int id;
  final int dueno;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      RichText(
        text: TextSpan(
          children: [
            const TextSpan(
                text: "Your Registration Id is ",
                style: TextStyle(color: Colors.black)),
            TextSpan(
                text: "$id",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black)),
          ],
        ),
      ),
      dueno > -1
          ? RichText(
              text: TextSpan(
                  style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                      color: Colors.black),
                  children: [
                    const TextSpan(text: "Your total fees amount:"),
                    TextSpan(
                      text: "Rs.${500 * dueno}",
                      style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    TextSpan(text: "(Fees due for last $dueno months)."),
                  ]),
              textAlign: TextAlign.center,
            )
          : RichText(
              text: TextSpan(
                  style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                      color: Colors.black),
                  children: [
                    const TextSpan(text: "You need to pay "),
                    const TextSpan(
                      text: "Rs.500",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    TextSpan(
                        text:
                            " as the fees for the month of ${months[DateTime.now().month - 1]} to complete your registration."),
                  ]),
              textAlign: TextAlign.center,
            ),
      const Text("Select your Payment Option"),
      PaymentTile(
        text: "Pay via UPI",
        id: id,
        image:
            "https://resize.indiatvnews.com/en/resize/newbucket/715_-/2017/11/upi-1509594508.jpg",
      ),
      PaymentTile(
        text: "Pay via Netbanking",
        id: id,
        icon: const Icon(Icons.mouse_rounded),
      ),
      PaymentTile(
        text: "Pay using Debit/Credit Card",
        id: id,
        icon: const Icon(Icons.credit_card),
      ),
      Container(),
      Container(),
    ]);
  }
}
