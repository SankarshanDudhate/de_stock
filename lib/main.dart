import 'package:destock/Feedback1.dart';
import 'package:destock/Plans.dart';
import 'package:destock/Quicktour1.dart';
import 'package:destock/loginscreen1.dart';
import 'package:flutter/material.dart';
import 'package:destock/getstarted.dart';
import 'package:destock/FAQ.dart';

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
      // home: tnc(),
      // home: plan());
      home: FAQ(),
    );
  }
}
