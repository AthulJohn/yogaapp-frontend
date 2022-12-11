import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yoga_frontend/interface/components/arc_background.dart';
// import 'package:yoga_frontend/interface/screens/register_form/proceed_to_pay_button.dart';
import 'package:yoga_frontend/interface/screens/register_form/slot_radio_buttons.dart';

import '../../../constants/colors.dart';
import '../../../constants/text_styles.dart';
import '../../../models/person_model.dart';
import '../../../services/register.dart';
import '../../components/buttons.dart';
import '../../components/text_fields.dart';
import '../payment_screen/payment.dart';
import 'text_fields_with_validation.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: ArcBackground(
      child: RegisterBody(),
    ));
  }
}

class RegisterBody extends StatefulWidget {
  RegisterBody({Key? key}) : super(key: key);

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  String name = '', phone = '';
  bool logging = false;
  int age = 0, slot = 1;

  void registerUser({Function(int)? onSuccess, VoidCallback? onFailure}) async {
    int result = await registerPerson(
        Person(name: name, phone: phone, slot: slot, age: age));
    if (result == -1) {
      onFailure!.call();
    } else {
      onSuccess!.call(result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Text(
        "Register for Yoga Classes here. You should be between 18 to 65 years old to be eligible for the class. You can choose any of the slots given below based in availability. You should pay the first month fees of Rs.500 to complete the registration.",
        style: AppTextStyles.body,
      ),
      // Column(
      // children: [
      AppTextField(
        hintText: 'Name',
        labelText: 'Name',
        onChanged: (val) {
          name = val;
        },
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: AgeField(
              onChanged: (val) {
                age = val;
              },
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 2,
            child: PhoneField(
              onChanged: (val) {
                phone = val;
              },
            ),
          ),
        ],
      ),

      //TODO: Extract Radio Widget
      SlotRadioButtons(
        onChanged: (val) {
          slot = val;
        },
      ),
      Container(),
      Container(),
      logging
          ? Row(
              children: const [
                Text(
                  'Signing Up...  ',
                  style: AppTextStyles.body,
                ),
                CircularProgressIndicator(
                  color: Colors.black,
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppElevatedButton(
                    onPressed: () async {
                      if (age == -1) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            'Please Enter a Valid Age',
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                        ));
                        return;
                      } else if (phone == 'X') {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            'Please Enter a Valid Phone Number',
                            style: TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.red,
                        ));
                        return;
                      } else {
                        setState(() {
                          logging = true;
                        });
                        registerUser(onFailure: () {
                          if (!mounted) return;
                          setState(() {
                            logging = false;
                          });

                          ScaffoldMessenger.of(context)
                              .showSnackBar(const SnackBar(
                            content: Text(
                              'An Error Occured',
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.red,
                          ));
                        }, onSuccess: (id) {
                          if (!mounted) return;
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PaymentsPage(id)));
                        });
                      }
                    },
                    text: 'PROCEED TO PAYMENT'),
              ],
            ),
    ]);
  }
}
