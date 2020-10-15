import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class abus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/AboutUsBG.png'),
              fit: BoxFit.fill)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(top: 50),
              height: 100,
              width: 350,
              decoration: BoxDecoration(
                  color: Color(0xff0B868A),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10))),
              child: Row(
                children: [
                  SizedBox(width: 10),
                  Icon(Icons.arrow_back_ios, color: Colors.white),
                  SizedBox(width: 10),
                  Text("About Us",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 24))
                ],
              )),
          SizedBox(height: 30),
          Container(
            padding: EdgeInsets.only(left: 40),
            width: 390,
            height: 250,
            child: Text(
              "Hello De-Stock is a platform that will connect buyers to sellers of non- moving/unused stock. The non-moving stock market in India is huge with a lot of companies having tonnes of non-moving and unused stock lying around that could be useful to other companies. We at De-Stock aim to bridge this gap by giving these companies a platform where they can sell their non-moving/unused stock and earn money from it.\n\nDue to the Covid-19 pandemic, companies have been finding it difficult than ever to manage cash flow. Non-moving stock has taken a lot of storage and maintenance costs from companies and we aim to help them sell their non-moving/unused stock to increase their working capital.Using De-stock, buyers will have access to reliable sources of materials at a reasonable price. ",
              //textAlign: TextAlign.justify,
              style: TextStyle(
                  fontFamily: "OpenSans",
                  fontSize: 14,
                  color: Color(0xFF6F6F6F)),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Mission Statemeny",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFFD84764),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    fontFamily: "OpenSans"),
              ),
            ],
          ),
          SizedBox(height: 10),
          Container(
              width: 390,
              padding: EdgeInsets.only(left: 40),
              child: Text(
                  "Helping MSME’s get rid of their non-moving/unused stock to increase their cash flow and helping buyers get materials at a reasonable price.",
                  style: TextStyle(
                      color: Color(0xFF6F6F6F),
                      fontFamily: "OpenSans",
                      fontSize: 14))),
        ],
      ),
    ));
  }
}
