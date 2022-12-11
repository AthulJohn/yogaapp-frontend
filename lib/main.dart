import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga_frontend/interface/screens/home_screen/home_screen.dart';
import 'package:yoga_frontend/interface/screens/payment_screen/payment.dart';
import 'package:yoga_frontend/interface/screens/register_form/registration_form_screen.dart';

import 'models/person_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Person>(
        create: (context) => Person.empty(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(),
        ));
  }
}
