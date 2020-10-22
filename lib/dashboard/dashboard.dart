import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dashboard_empty.dart';
import 'package:destock/cards/productCard.dart';

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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[

                            Text("Your Products",
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                            Text("View all",
                              style: TextStyle(fontSize: 12, color: Colors.blue),),
                          ],

                        ),
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
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[

                            Text("Latest Enquiries",
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                            Text("View all",
                              style: TextStyle(fontSize: 12, color: Colors.blue),),
                          ],

                        ),
                      ),
                      SizedBox(height: 20,),

                      enquiry_card(
                        product_id: "#786GFHDR",
                        product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                        product_price: "7000",
                        image: "assets/images/product image.png",
                        user_image: "assets/images/user_image.png",
                        user_name: "Tanmay Patil",
                        user_enquiry: "I wanted to enquire about the price of this product",
                        quantity: "300",
                      ),


                      SizedBox(height: 30,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[

                            Text("Upcoming Renewals",
                              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black),),
                            Text("View all",
                              style: TextStyle(fontSize: 12, color: Colors.blue),),
                          ],

                        ),
                      ),
                      SizedBox(height: 20,),

                  renewal_card(
                    product_id: "#786GFHDR",
                    renew_edit: "EDIT",
                    status: "August 19,2020",
                    image: "assets/images/product image.png",
                  ),
                      footer(),

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



class enquiry_card extends StatelessWidget {
  final String product_id;
  final String product_name;
  final String product_price;
  final String image;
  final String user_name;
  final String user_enquiry;
  final String user_image;
  final String quantity;

  const enquiry_card({Key key, this.product_id,this.product_name,this.product_price,this.image,this.user_name,this.quantity,this.user_enquiry,this.user_image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20),),
        color: Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 40,
            color: Color(0xffe5e5e5).withOpacity(1),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(

            padding: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20),),
              color: Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 2),
                  blurRadius: 10,
                  color: Color(0xffe5e5e5).withOpacity(1),
                ),
              ],
            ),
            child: Row(
              children: [
                Image.asset(image, height: 60,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        width: 190,
                        child: Text(product_name,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),),
                      ),
                      SizedBox(height: 5,),

                      Container(
                        width: 240,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(product_id,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Color(0xff6e6e6e)),),
                            Row(

                              children: [
                                Image.asset("assets/images/ruppee.png", height: 11,),
                                Text(" "+product_price,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(50),),
                    child: Image.asset(user_image, height: 50,)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        width: 240,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(user_name,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black),),

                            Text("QTY "+quantity+" kg",
                              textAlign: TextAlign.right,
                              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),

                      Container(
                        width: 190,
                        child: Text(user_enquiry,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff6F6F6F)),),
                      ),
                      SizedBox(height: 10,),
                      Text("Reply",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xff4DA4D6)),),



                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(50),),
                    child: Image.asset(user_image, height: 50,)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        width: 240,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(user_name,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black),),

                            Text("QTY "+quantity+" kg",
                              textAlign: TextAlign.right,
                              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),

                      Container(
                        width: 190,
                        child: Text(user_enquiry,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff6F6F6F)),),
                      ),
                      SizedBox(height: 10,),
                      Text("Reply",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xff4DA4D6)),),



                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class renewal_card extends StatelessWidget {
  final String product_id;
  final String image;
  final String status;
  final String renew_edit;

  const renewal_card(
      {Key key, this.product_id, this.image,this.status,this.renew_edit})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20),),
        color: Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 0),
            blurRadius: 40,
            color: Color(0xffe5e5e5).withOpacity(1),
          ),
        ],
      ),
      child: Container(

        padding: EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20),),
          color: Color(0xffffffff),

        ),
        child: Column(
          children: [
            Row(
              children: [
                Image.asset(image, height: 60,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        width: 190,
                        child: Text(product_id,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),),
                      ),
                      SizedBox(height: 5,),

                      Container(
                        width: 240,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Auto-renewal on",
                                  style: TextStyle(fontSize: 10, fontWeight: FontWeight
                                      .w400, color: Color(0xff6e6e6e)),),
                                Text(status,
                                  style: TextStyle(fontSize: 13, fontWeight: FontWeight
                                      .w400, color: Color(0xff6e6e6e)),),
                              ],
                            ),

                            Text(renew_edit,
                              textAlign: TextAlign.right,
                              style: TextStyle(fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff2DDDB7)),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Image.asset(image, height: 60,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        width: 190,
                        child: Text(product_id,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),),
                      ),
                      SizedBox(height: 5,),

                      Container(
                        width: 240,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Auto-renewal on",
                                  style: TextStyle(fontSize: 10, fontWeight: FontWeight
                                      .w400, color: Color(0xff6e6e6e)),),
                                Text(status,
                                  style: TextStyle(fontSize: 13, fontWeight: FontWeight
                                      .w400, color: Color(0xff6e6e6e)),),
                              ],
                            ),

                            Text(renew_edit,
                              textAlign: TextAlign.right,
                              style: TextStyle(fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff2DDDB7)),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
              offset: Offset(0, 2),
              blurRadius: 10,
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


