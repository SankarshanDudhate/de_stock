import 'package:destock/cards/pro_card_hor_scroll.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:destock/cards/latest_products.dart';
import 'package:destock/cards/category_list_product_card.dart';
import 'dart:math';



class category_list extends StatefulWidget {
  category_list({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _category_listState createState() => _category_listState();
}
class _category_listState extends State<category_list> {

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

            category_list_gearbox(),

            SizedBox(height: 20,),

            horizontal_scroll(),

            SizedBox(height: 20,),

            category_list_gearbox(),


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
              Text("Gearbox",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),),
            ],
          ),
          // Transform.rotate(
          //   angle: 90 * pi / 180,
          //   child:Icon(Icons.tune,color: Colors.white,),
          // ),
        ],
      ),

    );
  }
}


class category_list_gearbox extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        category_list_product_card(
          views: "200",
          product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
          product_price: "7000",
          description: "A little brief about the product comes brief about",
          image: "assets/images/product image.png",
        ),
        category_list_product_card(
          views: "200",
          product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
          product_price: "7000",
          description: "A little brief about the product comes brief about",
          image: "assets/images/product image.png",
        ),
        category_list_product_card(
          views: "200",
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
              color: Color(0xff0B868A),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(15))),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Not what you’re looking for ?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700)),
                Text(
                    'Try these',
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
          constraints: BoxConstraints(maxHeight: 300),
          child: Container(
            margin: EdgeInsets.only(top: 50),


            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.only(left: 30),
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




