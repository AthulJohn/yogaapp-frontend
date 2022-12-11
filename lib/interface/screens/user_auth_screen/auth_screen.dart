import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:yoga_frontend/interface/components/arc_background.dart';
import 'package:yoga_frontend/interface/screens/dashboard/dashboard.dart';
import 'package:yoga_frontend/interface/screens/register_form/proceed_to_pay_button.dart';
import 'package:yoga_frontend/interface/screens/register_form/slot_radio_buttons.dart';
import 'package:yoga_frontend/services/authorize.dart';
import 'package:yoga_frontend/services/complete_payment.dart';

import '../../../constants/colors.dart';
import '../../../constants/text_styles.dart';
import '../../../models/person_model.dart';
import '../../../services/register.dart';
import '../../components/buttons.dart';
import '../../components/text_fields.dart';
import '../register_form/registration_form_screen.dart';

class AuthorizePage extends StatelessWidget {
  const AuthorizePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        body: ArcBackground(
      child: AuthorizeBody(),
      heading: "Student Authorize",
      subheading: "Authorization",
    ));
  }
}

class AuthorizeBody extends StatefulWidget {
  const AuthorizeBody({Key? key}) : super(key: key);

  @override
  State<AuthorizeBody> createState() => _AuthorizeBodyState();
}

class _AuthorizeBodyState extends State<AuthorizeBody> {
  String phone = "";

  String id = "";
  bool logging = false;

  void authorizeUser(
      {Function(Person)? onSuccess, VoidCallback? onFailure}) async {
    print("Calling auth");
    Person? pers = await authorize(id, phone);
    if (pers == null) {
      onFailure!.call();
    } else {
      onSuccess!.call(pers);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      AppTextField(
        hintText: 'Register ID',
        labelText: 'Enter your Register ID',
        onChanged: (val) {
          id = val;
        },
      ),
      AppTextField(
        hintText: 'XXXXXXXXXX',
        labelText: 'Enter your Registered Phone Number',
        onChanged: (val) {
          phone = val;
        },
      ),
      Container(),
      Container(),
      logging
          ? Row(
              children: const [
                Text(
                  'Authorizing...  ',
                  style: AppTextStyles.body,
                ),
                CircularProgressIndicator(
                  color: Colors.black,
                )
              ],
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
            )
          : Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              AppElevatedButton(
                  onPressed: () async {
                    setState(() {
                      logging = true;
                    });
                    authorizeUser(onFailure: () {
                      if (!mounted) return;
                      setState(() {
                        logging = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                          'Authorization Failed',
                          style: TextStyle(color: Colors.white),
                        ),
                        backgroundColor: Colors.red,
                      ));
                    }, onSuccess: (Person pers) {
                      if (!mounted) return;
                      Provider.of<Person>(context, listen: false)
                          .setPerson(pers);
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Dashboard()));
                    });
                  },
                  text: 'AUTHORIZE'),
            ]),
    ]);
  }
}
