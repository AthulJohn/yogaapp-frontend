import 'package:flutter/material.dart';
import 'package:yoga_frontend/interface/components/arc_background.dart';

import '../../../constants/values.dart';
import 'payment_tile.dart';

///The [PaymentsPage] is the screen that is used to show the payment options
///Shown when a user clicks the payment button from the register screen or the user dashboard
class PaymentsPage extends StatelessWidget {
  const PaymentsPage(this.id, {this.dueno = -1, Key? key}) : super(key: key);
  final int id;

  ///dueNo is the number of months the user has not paid the fees for.
  ///Will be -1, if the user is redirected from the Register Screen
  final int dueno;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

      //Different Messages are shown, depending on whether the user is redirected from the Register Screen or the User Dashboard
      //If the user is redirected from the Register Screen, then the user has to pay the fees as a registration fees
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
                      //The total fees amount is calculated by multiplying the fees for each month by the number of months the user has not paid the fees for
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
      //Different Payment Options are shown, Butall the methods does the same thing, i.e. calls the completePayment Function in the backend
      PaymentTile(
        text: "Pay via UPI",
        id: id,
        image:
            "https://resize.indiatvnews.com/en/resize/newbucket/715_-/2017/11/upi-1509594508.jpg",
        fromdashboard: dueno != -1,
      ),
      PaymentTile(
        text: "Pay via Netbanking",
        id: id,
        icon: const Icon(Icons.mouse_rounded),
        fromdashboard: dueno != -1,
      ),
      PaymentTile(
        text: "Pay using Debit/Credit Card",
        id: id,
        icon: const Icon(Icons.credit_card),
        fromdashboard: dueno != -1,
      ),
      Container(),
      Container(),
    ]);
  }
}
