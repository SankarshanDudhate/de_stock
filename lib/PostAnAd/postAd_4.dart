import 'package:flutter/material.dart';

class postAd_4 extends StatefulWidget {
  @override
  _postAd_4State createState() => _postAd_4State();
}

class _postAd_4State extends State<postAd_4> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal:20),
        child: Column(
          children: [
            SizedBox(height:50),
            Row(
            children: [
              Text(
                "Step 4",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 20.0,
                    fontFamily: "Arial",
                    fontWeight: FontWeight.bold),
              ),
            ],
            ),
            SizedBox(height:10),
            Row(
              children: [
                Text('SELECT A PAYMENT PLAN',
                style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                )),
              ],
              ),
              Row(
                  children: [
                    
                  ],
              ),
          ]
        ),
      )
    );
  }
}