import 'package:destock/notification_seller/product_wishlisted_notification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:destock/notification_seller/request_quote_notification.dart';
import 'package:destock/notification_seller/product_view_notification.dart';
import 'package:destock/notification_seller/ad_expire_notification.dart';


class notification_seller extends StatefulWidget {
  notification_seller({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _notification_sellerState createState() => _notification_sellerState();
}
class _notification_sellerState extends State<notification_seller> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
        ),

        child: ListView(

          children: <Widget>[

            header(),

            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Today",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black),),
                  Text("Mark All as Read",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w400, color: Color(0xff4B69FF)),),
                ],
              ),
            ),
            SizedBox(height: 20,),

            request_quote_notification(
              product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
              time: "4 min",
              buyer_image: "assets/images/buyer_image.png",
              product_image: "assets/images/product image.png",
              buyer_name: "Tanmay Patil",
              is_read: false,
            ),
            product_view(
              product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
              views: "200",
              product_image: "assets/images/product image.png",
              is_read: false,
            ),
            product_wishlisted(
              product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
              wishlist_count: "200",
              product_image: "assets/images/product image.png",
              is_read: false,
            ),
            ad_expire(
              product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
              days_left: "7",
              product_image: "assets/images/product image.png",
              is_read: false,
            ),

            SizedBox(height: 20,),

            Image.asset("assets/images/verified seller.png"),

            SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.fromLTRB(17,0,0,0),
              child: Text("Yesterday",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black),),
            ),
            SizedBox(height: 20,),

            request_quote_notification(
              product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
              time: "4 min",
              buyer_image: "assets/images/buyer_image.png",
              product_image: "assets/images/product image.png",
              buyer_name: "Tanmay Patil",
              is_read: true,
            ),
            product_view(
              product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
              views: "200",
              product_image: "assets/images/product image.png",
              is_read: true,
            ),
            product_wishlisted(
              product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
              wishlist_count: "200",
              product_image: "assets/images/product image.png",
              is_read: true,
            ),
            ad_expire(
              product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
              days_left: "7",
              product_image: "assets/images/product image.png",
              is_read: true,
            ),

            SizedBox(height: 20,),







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
      height: 50,
      decoration:BoxDecoration(
        color: Color(0xfffafafa),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 10,
            color: Colors.black.withOpacity(.10),
          ),
        ],
      ) ,

        child: Row(
          children: [
            SizedBox(width: 10,),
            Text("Notification",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),),
          ],
        ),


    );
  }
}