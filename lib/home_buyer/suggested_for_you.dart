import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:destock/cards/product_card_suggest_withtag.dart';
import 'package:destock/cards/search_product_card_small.dart';



class suggested_for_you extends StatefulWidget {
  suggested_for_you({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _suggested_for_youState createState() => _suggested_for_youState();
}
class _suggested_for_youState extends State<suggested_for_you> {




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

            category_list_suggest(),

            SizedBox(height: 20,),

            horizontal_scroll(),

            SizedBox(height: 20,),

            category_list_suggest(),

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
      padding: EdgeInsets.fromLTRB(10,0,0,0),
      width: double.infinity,
      height: 150,
      decoration:BoxDecoration(
        color: Color(0xffD84764),
        borderRadius: BorderRadius.only( bottomRight: Radius.circular(90), ),
      ) ,

      child: Row(
        children: [
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios,color: Colors.white,)),
          SizedBox(width: 10,),
          Text("Suggested for you",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),),
        ],
      ),

    );
  }
}


class category_list_suggest extends StatelessWidget {

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
          height: 120,
          width: double.infinity,
          margin: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              color: Color(0xff0B868A),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(15))),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Text(
                'Because you viewed Cast Iron gears 15 inch 1050 rounded edges- PVC ',
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 12,
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