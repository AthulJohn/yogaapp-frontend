import 'package:flutter/material.dart';
import 'package:yoga_frontend/interface/components/arc_background.dart';
import 'package:yoga_frontend/interface/screens/user_auth_screen/auth_screen.dart';
import '../../components/buttons.dart';
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
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      AppElevatedButton(
        onPressed: () {},
        text: "Know more about the class",
      ),
      AppElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const RegisterPage())));
        },
        text: "Register for the class",
      ),
      AppElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => const AuthorizePage())));
        },
        text: "Student Dashboard",
      ),
      Container(),
      Container(),
    ]);
  }
}
