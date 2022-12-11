import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga_frontend/constants/colors.dart';
import 'package:yoga_frontend/interface/screens/register_form/registration_form_screen.dart';
import 'package:yoga_frontend/models/person_model.dart';

import '../../../constants/text_styles.dart';
import '../../../services/complete_payment.dart';

class PaymentTile extends StatefulWidget {
  const PaymentTile(
      {required this.id, required this.text, this.image, this.icon, super.key});
  final int id;
  final String text;
  final String? image;
  final Icon? icon;
  @override
  State<PaymentTile> createState() => _PaymentTileState();
}

class _PaymentTileState extends State<PaymentTile> {
  bool logging = false;

  void payFees({VoidCallback? onSuccess, VoidCallback? onFailure}) async {
    bool result = await completePayment(widget.id);
    await Future.delayed(Duration(seconds: 3));
    if (!result) {
      onFailure!.call();
    } else {
      onSuccess!.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    return logging
        ? Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Payment processing...  ',
                style: AppTextStyles.body,
              ),
              CircularProgressIndicator(
                color: Colors.black,
              )
            ],
          )
        : Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.buttonColor, width: 2),
            ),
            child: ListTile(
                title: Text(widget.text),
                leading: widget.image == null
                    ? widget.icon
                    : SizedBox(width: 50, child: Image.network(widget.image!)),
                onTap: () async {
                  setState(() {
                    logging = true;
                  });
                  payFees(
                    onFailure: () {
                      if (!mounted) return;
                      setState(() {
                        logging = false;
                      });

                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          'An Error Occured',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                      ));
                    },
                    onSuccess: () {
                      if (!mounted) return;
                       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          'Payment Successful',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.green,
                      ));
                      Provider.of<Person>(context, listen: false).payFees();
                      Navigator.pop(context);
                    },
                  );
                }),
          );
  }
}
