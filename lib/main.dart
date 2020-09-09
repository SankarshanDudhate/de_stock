/*-------------------------------------------------
All the data from postAd,postAd_2,postAd_3 to be added in db
---------------------------------------------------*/


import 'package:destock/manageProducts.dart';
import 'package:destock/postAd.dart';
import 'package:destock/postAd_2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'De-Stock',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: "Poppins",
      ),
      home: manageProducts(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        // body: 
        //  Container(
        //   child: Column(
        //     children: [
        //       GestureDetector(
        //         onTap: () {
        //           Navigator.push(
        //               context,
        //               new MaterialPageRoute(
        //                   builder: (BuildContext context) => postAd_2()));
        //         },
        //         child: Text(
        //           'POST AN AD',
        //           style: TextStyle(fontSize: 30),
        //         ),
        //       ),
        //       SizedBox(height:20),
        //       GestureDetector(
        //         onTap: () {
        //           Navigator.push(
        //               context,
        //               new MaterialPageRoute(
        //                   builder: (BuildContext context) => manageProducts()));
        //         },
        //         child: Text(
        //           'Manage Products',
        //           style: TextStyle(fontSize: 30),
        //         ),
        //       ),
        //     ],
        //   ),
        // )
        );
  }
}
