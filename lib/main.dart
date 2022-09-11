import 'package:bmi/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          canvasColor: Colors.black,
          primarySwatch: Colors.teal,
          textTheme: const TextTheme(
              headline1: TextStyle(
                fontSize: 46,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              headline2: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
              bodyText1: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ))),
      home: const MyHomePage(),
    );
  }
}
