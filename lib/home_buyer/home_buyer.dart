import 'package:destock/cards/latest_products.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:destock/cards/product_card_home.dart';
import 'package:destock/cards/product_card_suggest.dart';
import 'package:destock/cards/product_near_you.dart';
import 'package:destock/cards/search_product_card_small.dart';


class homebuyer extends StatefulWidget {
  homebuyer({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _homebuyerState createState() => _homebuyerState();
}
class _homebuyerState extends State<homebuyer> {




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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                Image.asset("assets/images/cutting_tool.png",height: 60),
                                SizedBox(height: 10,),
                                Text("Cutting Tools",
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset("assets/images/pipes.png",height: 60),
                                SizedBox(height: 10,),
                                Text("Pipes",
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset("assets/images/measure.png",height: 60),
                                SizedBox(height: 10,),
                                Text("Measuring\nInstruments",textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),),
                              ],
                            ),
                            Column(
                              children: [
                                Image.asset("assets/images/tools.png",height: 60),
                                SizedBox(height: 10,),
                                Text("Tools",
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: Colors.black),),
                              ],
                            ),
                          ],
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

                        SizedBox(height: 30,),

                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Suggested for you",
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),),
                                Text("based on your wishlist",
                                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: Color(0xff949494),),)
                              ],
                            ),
                          ),
                        ),

                        SizedBox(height: 20,),

                        suggest_you(),

                        SizedBox(height: 20,),

                        Image.asset("assets/images/pricing plans banner.png"),

                        SizedBox(height: 20,),


                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Near your location",
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),),
                          ),
                        ),

                        SizedBox(height: 20,),

                        near_you(),

                        SizedBox(height: 20,),

                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Latest Products",
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),),
                          ),
                        ),
                        SizedBox(height: 20,),

                        latest(),

                        SizedBox(height: 20,),

                        Image.asset("assets/images/refer a friend banner.png"),

                        SizedBox(height: 20,),

                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text("Trending Now",
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: Colors.black),),
                          ),
                        ),

                        SizedBox(height: 20,),

                        trending_now(),

                        SizedBox(height: 20,),

                        additional_category(),

                        SizedBox(height: 20,),

                        Image.asset("assets/images/become a seller.png"),

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
                      padding: const EdgeInsets.all(0),
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

class suggest_you extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        /*Container(
          height: 120,
          width: double.infinity,
          margin: EdgeInsets.fromLTRB(0, 160, 0, 0),
          decoration: BoxDecoration(
              color: Color(0xffD84764),
              ),

        ),*/
        Container(
            margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Image.asset("assets/images/pink bg.png")),

        Container(

          margin: EdgeInsets.fromLTRB(30, 0, 30, 25), //from only horizontal to tlrb
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all( Radius.circular(10) ),
            color: Color(0xffffffff),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              ),
            ],
          ),
          child: Column(
            children: <Widget>[

              product_card_suggest(
                product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                product_price: "7000",
                description: "A little brief about the product comes brief about",
                image: "assets/images/product image.png",
              ),
              Divider(
                  color: Colors.black
              ),
              product_card_suggest(
                product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                product_price: "7000",
                description: "A little brief about the product comes brief about",
                image: "assets/images/product image.png",
              ),
              Divider(
                  color: Colors.black
              ),
              product_card_suggest(
                product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                product_price: "7000",
                description: "A little brief about the product comes brief about",
                image: "assets/images/product image.png",
              ),

            ],
          ),
        ),
      ],
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

class latest extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        latest_products(
          color: Color(0xff2DDDB7).withOpacity(.07),
          product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
          product_price: "7000",
          description: "A little brief about the product comes brief about",
          image: "assets/images/product image.png",
        ),
        latest_products(
          color: Color(0xffD84764).withOpacity(.07),
          product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
          product_price: "7000",
          description: "A little brief about the product comes brief about",
          image: "assets/images/product image.png",
        ),
        latest_products(
          color: Color(0xff4060B8).withOpacity(.07),
          product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
          product_price: "7000",
          description: "A little brief about the product comes brief about",
          image: "assets/images/product image.png",
        ),
      ],
    );

  }
}

    class trending_now extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            product_card_trending(
              product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
              product_price: "7000",
              image: "assets/images/product image.png",
            ),
            product_card_trending(
              product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
              product_price: "7000",
              image: "assets/images/product image.png",
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            product_card_trending(
              product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
              product_price: "7000",
              image: "assets/images/product image.png",
            ),
            product_card_trending(
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

class additional_category extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Stack(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          margin: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              color: Color(0xffD84764),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(15))),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Text(
                'Additional Category',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600)),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 175),
          child: Container(
            margin: EdgeInsets.only(top: 50,left: 0),

            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                searchcardsmall(
                  product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                  product_price: "7000",
                  views: "112",
                  image: "assets/images/product image.png" ,
                ),
                searchcardsmall(
                  product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                  product_price: "7000",
                  views: "112",
                  image: "assets/images/product image.png" ,
                ),
                searchcardsmall(
                  product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                  product_price: "7000",
                  views: "112",
                  image: "assets/images/product image.png" ,
                ),
                searchcardsmall(
                  product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                  product_price: "7000",
                  views: "112",
                  image: "assets/images/product image.png" ,
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