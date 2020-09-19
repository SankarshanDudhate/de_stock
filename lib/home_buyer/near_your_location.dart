import 'package:destock/cards/pro_card_hor_scroll.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:destock/cards/product_near_you.dart';
import 'package:destock/cards/search_product_card_small.dart';
import 'dart:math';



class near_your_location extends StatefulWidget {
  near_your_location({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _near_your_locationState createState() => _near_your_locationState();
}
class _near_your_locationState extends State<near_your_location> {




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

            SizedBox(height: 20,),

            near_you(),

            SizedBox(height: 20,),

            horizontal_scroll(),

            SizedBox(height: 20,),

            near_you(),

            footer(),
          ],
        ),
      ),
    );
  }

}

class header extends StatelessWidget {
  final String headline1;
  final String headline2;
  final String headline3;
  final String image;
  const header({Key key, this.headline1, this.headline2,this.headline3, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10,0,20,0),
      width: double.infinity,
      height: 150,
      decoration:BoxDecoration(
        color: Color(0xffD84764),
        borderRadius: BorderRadius.only( bottomRight: Radius.circular(70), ),
      ) ,

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
       Icon(Icons.arrow_back_ios,color: Colors.white,),

              SizedBox(width: 10,),
              Text("Near your location",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),),
            ],
          ),
    Transform.rotate(
    angle: 90 * pi / 180,
    child:Icon(Icons.tune,color: Colors.white,),
    ),
        ],
      ),

    );
  }
}


class near_you extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        product_near_you(
          product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
          product_price: "7000",
          distance: "15",
          image: "assets/images/product image.png",
        ),
        product_near_you(
          product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
          product_price: "7000",
          distance: "15",
          image: "assets/images/product image.png",
        ),
        product_near_you(
          product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
          product_price: "7000",
          distance: "15",
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
              color: Color(0xff2DDDB7),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(15))),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Text(
                'Within 8 km of your location',
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 15,
                    fontWeight: FontWeight.w600)),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 300),
          child: Container(
            margin: EdgeInsets.only(top: 50,left: 30),

            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                pro_card_hor_scroll(
                  product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                  product_price: "7000",
                  image: "assets/images/product image.png",
                ),
                pro_card_hor_scroll(
                  product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                  product_price: "7000",
                  image: "assets/images/product image.png",
                ),
                pro_card_hor_scroll(
                  product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                  product_price: "7000",
                  image: "assets/images/product image.png",
                ),
                pro_card_hor_scroll(
                  product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
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
        padding: EdgeInsets.symmetric(vertical: 60,horizontal: 40),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/footerbg.png"),),
          color: Color(0xffFFEEF1),

        ),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("About us",
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xff792B3B)),),
            SizedBox(height: 10,),
            Text("Pricing Plans",
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xff792B3B)),),
            SizedBox(height: 10,),
            Text("FAQs",
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xff792B3B)),),
            SizedBox(height: 10,),
            Text("Help",
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xff792B3B)),),
            SizedBox(height: 10,),
            Text("Feedback",
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xff792B3B)),),
            SizedBox(height: 10,),
            Text("Terms & Conditions",
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xff792B3B)),),
            SizedBox(height: 10,),
            Text("Refer a friend",
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Color(0xff792B3B)),),
          ],
        )
    );
  }
}