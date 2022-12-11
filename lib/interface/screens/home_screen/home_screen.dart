import 'package:flutter/material.dart';
import 'package:yoga_frontend/constants/colors.dart';
import 'package:yoga_frontend/interface/components/arc_background.dart';
import 'package:yoga_frontend/interface/components/academy_logo.dart';
import 'package:yoga_frontend/interface/screens/user_auth_screen/auth_screen.dart';
import '../../components/buttons.dart';
import '../know_more_page/know_more.dart';
import '../register_form/registration_form_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        // resizeToAvoidBottomInset: false,
        body: ArcBackground(
      heading: "Welcome to Nirvana",
      subheading: "Professional Yoga and Meditation Classes",
      child: HomeBody(),
    ));
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AcademyLogo(),
          AppElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const RegisterPage())));
            },
            text: "New Registration",
          ),
          AppElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const AuthorizePage())));
            },
            text: "Student Dashboard",
          ),
          AppOutlinedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: ((context) => const KnowMorePage())));
            },
            text: "Know more about the class",
          ),
        ]);
  }
}
