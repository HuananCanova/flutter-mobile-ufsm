
import 'package:fitness_track/screens/homepage.dart';
import 'package:flutter/material.dart';

void main() {


  WidgetsFlutterBinding.ensureInitialized();
    runApp(const FitApp());
}

class FitApp extends StatelessWidget {
  const FitApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: Colors.white,
      ),
      title: 'Fitness Tracker - dev',
      home: HomePage(),

    );
  }
}
