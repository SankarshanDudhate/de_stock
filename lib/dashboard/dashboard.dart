import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dashboard_empty.dart';

class dashboard extends StatefulWidget {
  dashboard({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _dashboardState createState() => _dashboardState();
}
class _dashboardState extends State<dashboard> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child:Stack(
              children: [
                Container(

                  decoration: BoxDecoration(
                    color: Color(0xF8F9FF),
                  ),

                  child: Column(

                    children: <Widget>[
                      header(
                        headline1:'Hello Ajay',
                        headline2:'Welcome to your dashboard !',
                        headline3:'Complete you profile for better reach!',
                        image: "assets/images/USER PROFILE PIC.png",
                      ),

                      SizedBox(height: 70,),
                      option_cards(),
                      SizedBox(height: 10,),
                      options_like(
                        title: "Products I would like to buy",
                        image: "assets/images/product_like.png",
                      ),
                      SizedBox(height: 20,),
                      Title_with_no(
                        title: "Your Products",
                        number: "(0)",
                      ),
                      SizedBox(height: 20,),
                      product_card(
                        product_id: "#786GFHDR",
                        product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                        product_price: "7000",
                        views: "112",
                        favorite: "19",
                        enquiries: "45",
                        expiry_date: "12 August 2020",
                        image: "assets/images/product image.png",
                      ),
                      SizedBox(height: 20,),
                      product_card(
                        product_id: "#786GFHDR",
                        product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                        product_price: "7000",
                        views: "112",
                        favorite: "19",
                        enquiries: "45",
                        expiry_date: "12 August 2020",
                        image: "assets/images/product image.png",
                      ),
                      SizedBox(height: 20,),


                      SizedBox(height: 10,),
                      Title_with_no(
                        title: "Latest Enquiries",
                        number: "(0)",
                      ),



                      SizedBox(height: 50,),
                      Title_with_no(
                        title: "Upcoming Renewals",
                        number: "(0)",
                      ),
                      SizedBox(height: 20,),


                      Text("Post your first ad",textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xffD84764)),),
                      SizedBox(height: 20,),
                      submitButton(
                        title: "VIEW ALL PLANS",
                      ),
                      SizedBox(height: 40,),
                    ],
                  ),
                ),
                Positioned(
                  top:150,
                  left: 71.5,
                  child: product_view_card(
                    products:'0',
                    pro_text:'Active\nProducts',
                    views:'0',
                    view_text: "Total\nviews",
                  ),
                ),
              ],
            )
        )
    );
  }

}

class product_card extends StatelessWidget {
  final String product_id;
  final String product_name;
  final String product_price;
  final String expiry_date;
  final String image;
  final String views;
  final String favorite;
  final String enquiries;
  const product_card({Key key, this.product_id,this.product_name,this.product_price,this.expiry_date, this.views,this.favorite, this.enquiries,this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.all(20),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20),),
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 40,
              color: Colors.black.withOpacity(.16),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(image, height: 100,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product_id,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Color(0xff6e6e6e)),),
                      SizedBox(height: 3,),
                      Container(
                       width: 190,
                        child: Text(product_name,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),),
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Image.asset("assets/images/ruppee.png", height: 13,),
                          Text(" "+product_price,
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),
                        ],
                      ),
                      SizedBox(height: 15,),
                      Container(
                        height: 15,
                        child: Row(
                          children: [
                            Text("EDIT",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),
                            VerticalDivider(color: Colors.black,),
                            Text("CHANGE QTY",
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Container(
              width: double.infinity,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10),),
                color: Color(0xff0B868A),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.remove_red_eye,color: Colors.white,),
                      Text(views+" views",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white),),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite,color: Colors.white,),
                      Text(favorite+" times",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white),),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(enquiries,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),),
                      Text("Enquiries",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white),),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween ,
              children: [
                Text("Ad expires on "+ expiry_date,
                  style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),
                Text("Renew Now",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xff4DA4D6)),),
              ],
            ),

          ],
        ),
    );
  }
}

class options_like extends StatelessWidget {
  final String title;
  final String image;
  const options_like({Key key, this.title, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 43),
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10),),
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 20,
              color: Color(0xffE5E5E5).withOpacity(1),
            ),
          ],
        ),
        child: Row(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(image, height: 18,),
            SizedBox(width: 5,),
            Text(title,
              style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.black),),
          ],
        )
    );
  }
}


