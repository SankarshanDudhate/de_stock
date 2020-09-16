import 'package:destock/cards/latest_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:destock/cards/product_card_home.dart';
import 'package:destock/cards/product_card_suggest.dart';
import 'package:destock/cards/product_near_you.dart';
import 'package:destock/cards/search_product_card_small.dart';


class recently_viewed extends StatefulWidget {
  recently_viewed({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _recently_viewedState createState() => _recently_viewedState();
}
class _recently_viewedState extends State<recently_viewed> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(

          decoration: BoxDecoration(
            color: Color(0xF8F9FF),
          ),

          child: Column(

            children: <Widget>[
              SizedBox(height: 70,),
              header(
                image: "assets/images/destocklogo.png",
              ),


              SizedBox(height: 40,),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text("Items you viewed recently",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),),
                ),
              ),
              SizedBox(height: 20,),

              recent_view(),


              SizedBox(height: 20,),









              footer(),
            ],
          ),
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
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,


        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset(image, height: 50),
            Container(
              width: 250,
              height: 40,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 40,
                    color: Colors.black.withOpacity(.16),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 0),
                      child: SizedBox(
                          height: 3,
                          child: Icon(Icons.search)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    hintStyle: new TextStyle(color: Colors.grey,fontSize: 12),
                    hintText: "Search for pipes, valves etc.",
                    fillColor: Colors.white),
              ),
            )
          ],
        )
    );
  }
}


class recent_view extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            product_card_home(
              product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
              product_price: "7000",
              image: "assets/images/product image.png",
            ),
            product_card_home(
              product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
              product_price: "7000",
              image: "assets/images/product image.png",
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            product_card_home(
              product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
              product_price: "7000",
              image: "assets/images/product image.png",
            ),
            product_card_home(
              product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
              product_price: "7000",
              image: "assets/images/product image.png",
            ),
          ],
        ),

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