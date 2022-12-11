import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga_frontend/interface/screens/home_screen/home_screen.dart';

import 'models/person_model.dart';

void main() {
  runApp(const MyApp());
}

//State Management Technique used: Provider(Partially)
//Provider is used to store the data of the user, so that it can be accessed from anywhere in the app
//All other state management is done using setState, but making sure that the performance is not affected
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Person>(
        create: (context) => Person.empty(),
        child: MaterialApp(
          title: 'Yoga App',
          theme: ThemeData(
            fontFamily: 'Poppins',
          ),
          home: const HomePage(),
        ));
  }
}
