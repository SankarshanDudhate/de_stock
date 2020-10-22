import 'package:destock/cards/product_card_suggest_withtag.dart';
import 'package:destock/category/category_page.dart';
import 'package:destock/category/category_list.dart';
import 'package:destock/home_buyer/home_buyer.dart';
import 'package:destock/loginscreen1.dart';
import 'package:destock/home_buyer/recently_viewed.dart';
import 'package:destock/notification_buyer/notification_buyer.dart';
import 'package:destock/refer_a_friend.dart';
import 'package:flutter/material.dart';
import 'package:destock/getstarted.dart';
import 'post_an_ad 4.dart';
import 'widgets/home.dart';


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
      home:Home(),
    );
  }
}

