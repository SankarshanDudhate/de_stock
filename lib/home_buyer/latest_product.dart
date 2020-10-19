import 'package:destock/cards/pro_card_hor_scroll.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:destock/cards/product_card_suggest_withtag.dart';
import 'dart:math';

class latest_product extends StatefulWidget {
  latest_product({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _latest_productState createState() => _latest_productState();
}

class _latest_productState extends State<latest_product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xF8F9FF),
        ),
        child: ListView(
          children: <Widget>[
            header(),
            SizedBox(
              height: 20,
            ),
            category_list_latest(),
            SizedBox(
              height: 20,
            ),
            horizontal_scroll(),
            SizedBox(
              height: 20,
            ),
            category_list_latest(),
            footer(),
          ],
        ),
      ),
    );
  }
}

class header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: Color(0xffD84764),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(70),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Latest products",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ],
          ),
          Transform.rotate(
            angle: 90 * pi / 180,
            child: Icon(
              Icons.tune,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class category_list_latest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        product_card_suggest_withtag(
          product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
          product_price: "7000",
          description: "A little brief about the product comes brief about",
          image: "assets/images/product image.png",
        ),
        product_card_suggest_withtag(
          product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
          product_price: "7000",
          description: "A little brief about the product comes brief about",
          image: "assets/images/product image.png",
        ),
        product_card_suggest_withtag(
          product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
          product_price: "7000",
          description: "A little brief about the product comes brief about",
          image: "assets/images/product image.png",
        ),
      ],
    );
  }
}

class horizontal_scroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 190,
          width: double.infinity,
          margin: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              color: Color(0xff4B69FF),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(15))),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Not what you’re looking for ?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700)),
                Text('Try Recommended for you',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 310),
          child: Container(
            margin: EdgeInsets.only(top: 60, left: 30),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                pro_card_hor_scroll(
                  product_name:
                      "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                  product_price: "7000",
                  image: "assets/images/product image.png",
                ),
                pro_card_hor_scroll(
                  product_name:
                      "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                  product_price: "7000",
                  image: "assets/images/product image.png",
                ),
                pro_card_hor_scroll(
                  product_name:
                      "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                  product_price: "7000",
                  image: "assets/images/product image.png",
                ),
                pro_card_hor_scroll(
                  product_name:
                      "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                  product_price: "7000",
                  image: "assets/images/product image.png",
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

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
