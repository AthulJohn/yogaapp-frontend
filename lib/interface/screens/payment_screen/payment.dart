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
  const PaymentsPage(this.id, {Key? key}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: ArcBackground(
      child: PaymentsBody(id),
    ));
  }
}

class PaymentsBody extends StatelessWidget {
  const PaymentsBody(this.id, {Key? key}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Text(
          "You need to pay Rs.500 as the fees for the month of ${months[DateTime.now().month - 1]} to complete your registration."),
      Text("Select your Payment Option"),
      PaymentTile(
        text: "Pay via UPI",
        id: id,
        image:
            "https://resize.indiatvnews.com/en/resize/newbucket/715_-/2017/11/upi-1509594508.jpg",
      ),
      PaymentTile(
        text: "Pay via Netbanking",
        id: id,
        icon: Icon(Icons.mouse_rounded),
      ),
      PaymentTile(
        text: "Pay using Debit/Credit Card",
        id: id,
        icon: Icon(Icons.credit_card),
      ),
      Container(),
      Container(),
    ]);
  }
}
