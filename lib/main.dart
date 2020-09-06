import 'package:destock/SignupScreen1.dart';
import 'package:destock/loginscreen1.dart';
import 'package:flutter/material.dart';
import 'package:destock/getstarted.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: "Poppins",
          ),
      home: getstarted(),
    );
  }
}

