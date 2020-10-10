import 'dart:convert';
import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:destock/notification_seller/product_wishlisted_notification.dart';
import 'package:destock/notification_seller/request_quote_notification.dart';
import 'package:destock/notification_seller/product_view_notification.dart';
import 'package:destock/notification_seller/ad_expire_notification.dart';
import 'package:shared_preferences/shared_preferences.dart';

class notification_seller extends StatefulWidget {
  notification_seller({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _notification_sellerState createState() => _notification_sellerState();
}

class _notification_sellerState extends State<notification_seller> {
  List notifList = [];
  bool modifiledFlag = false; // to check if a notification status has been modified, if yes, save notifs

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
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Today",
                    style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.black),
                  ),
                  // Text(
                  //   "Mark All as Read",
                  //   style: TextStyle(
                  //       fontSize: 13,
                  //       fontWeight: FontWeight.w400,
                  //       color: Color(0xff4B69FF)),
                  // ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // request_quote_notification(
            //   product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
            //   time: "4 min",
            //   buyer_image: "assets/images/buyer_image.png",
            //   product_image: "assets/images/product image.png",
            //   buyer_name: "Tanmay Patil",
            //   is_read: false,
            // ),
            // product_view(
            //   product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
            //   views: "200",
            //   product_image: "assets/images/product image.png",
            //   is_read: false,
            // ),
            // product_wishlisted(
            //   product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
            //   wishlist_count: "200",
            //   product_image: "assets/images/product image.png",
            //   is_read: false,
            // ),
            // ad_expire(
            //   product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
            //   days_left: "7",
            //   product_image: "assets/images/product image.png",
            //   is_read: false,
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // Image.asset("assets/images/verified seller.png"),
            // SizedBox(
            //   height: 20,
            // ),
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(17, 0, 0, 0),
            //   child: Text(
            //     "Yesterday",
            //     style: TextStyle(
            //         fontSize: 13,
            //         fontWeight: FontWeight.w700,
            //         color: Colors.black),
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
            // request_quote_notification(
            //   product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
            //   time: "4 min",
            //   buyer_image: "assets/images/buyer_image.png",
            //   product_image: "assets/images/product image.png",
            //   buyer_name: "Tanmay Patil",
            //   is_read: true,
            // ),
            // product_view(
            //   product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
            //   views: "200",
            //   product_image: "assets/images/product image.png",
            //   is_read: true,
            // ),
            // product_wishlisted(
            //   product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
            //   wishlist_count: "200",
            //   product_image: "assets/images/product image.png",
            //   is_read: true,
            // ),
            // ad_expire(
            //   product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
            //   days_left: "7",
            //   product_image: "assets/images/product image.png",
            //   is_read: true,
            // ),
            notification_list(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget notification_list() {
    return FutureBuilder(
      future: loadNotifications(),
      builder: (context, snapshot) {
        if( !snapshot.hasData ) return Center(child:  CircularProgressIndicator(),);

        return Column(
          // ListView.builder(
          // itemCount: notifList.length,
          // itemBuilder: (BuildContext context, int index) {
          //   return render_notification(notifList[index], index);
          // },
          children: snapshot.data.map<Widget>((snap) => render_notification(snap)).toList(),
        );
      }
    );
  }

  Future loadNotifications() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String notifString = prefs.getString("notifications");
    if( notifString == null) {
      log("No notifications\n");
    } else {
      // log(notifString);
      notifList = jsonDecode(notifString);
    }
    return notifList;
  }

  Widget render_notification(data) {
    log("Notification 1: "+data.toString());
    // if(data["type"] == "enquiry")
    DateTime now = DateTime.now();
    DateTime receivedTime = DateTime.parse(data["received_date"]);
    Duration diff = now.difference(receivedTime);
    // log("Difference: "+diff.toString());
    String diffString;
    if(diff.inDays > 0) diffString = diff.inDays.toString()+" days ago";
    else if(diff.inHours > 0) diffString = diff.inHours.toString()+" hours ago";
    else if(diff.inMinutes > 0) diffString = diff.inMinutes.toString()+" min ago";
    else diffString = "Just now";

    bool is_read = true;
    int notifIndex = notifList.indexOf(data);

    if(is_read != data["read"]) {
      data["read"] = true;
      notifList[notifIndex] = data;
      is_read = false;
      modifiledFlag = true;
    }

    // log("\n\nis_read: "+ is_read.toString()+"\nread: "+data["read"].toString());

    if( modifiledFlag && notifIndex == notifList.length-1 )
      saveNotificationReadStatus();

    if(data["data"]["type"] == "enquiry")
      return request_quote_notification(
        product_name: data["data"]["product_name"],
        time: diffString, //time diff
        buyer_image: data["data"]["user_image_link"],
        product_image: data["data"]["product_image_link"],
        buyer_name: data["data"]["user_name"],
        is_read: is_read,
      );
    else
      return product_wishlisted(
        product_name: data["data"]["product_name"],
        wishlist_count: data["data"]["wishlisted_count"],
        product_image: data["data"]["product_image_link"],
        is_read: is_read,
      );
  }

  Future saveNotificationReadStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("notifications", jsonEncode(notifList));
  }
}

class header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Color(0xfffafafa),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 2),
            blurRadius: 10,
            color: Colors.black.withOpacity(.10),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          Text(
            "Notification",
            style: TextStyle(
                fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
