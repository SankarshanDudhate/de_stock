import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:destock/cards/product_card_home.dart';



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
      body:  Container(

          decoration: BoxDecoration(
            color: Color(0xF8F9FF),
          ),

          child: ListView(

            children: <Widget>[

              header(),

              SizedBox(height: 20,),

              recent_view(),

              SizedBox(height: 20,),

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
            Text("Items viewed recently",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),),
          ],
        ),

    );
  }
}


class recent_view extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Column(

      children: [

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