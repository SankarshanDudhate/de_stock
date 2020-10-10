import 'package:flutter/material.dart';

class footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 60, horizontal: 40),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/footerbg.png"),
          ),
          color: Color(0xffFFEEF1),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "About us",
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff792B3B)),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Pricing Plans",
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff792B3B)),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "FAQs",
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff792B3B)),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Help",
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff792B3B)),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Feedback",
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff792B3B)),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Terms & Conditions",
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff792B3B)),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Refer a friend",
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff792B3B)),
            ),
          ],
        ));
  }
}
