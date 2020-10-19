import 'dart:convert';
import 'dart:io';
import 'dart:developer';

import 'package:destock/CONSTANTS.dart';
import 'package:destock/wishlist/wishlist_card_contact.dart'; //remove this
import 'package:destock/wishlist/wishlist_card_note.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:shared_preferences/shared_preferences.dart';


class MyWishlist extends StatefulWidget {
  MyWishlist({
    Key key,
    this.userId,
    this.shareableKey
  }) : super(key: key);

  String userId;
  String shareableKey; //also pass the key to this (from wishlist_user.dart) because it is used for auth

  @override
  _MyWishlistState createState() => _MyWishlistState();
}

class _MyWishlistState extends State<MyWishlist> {
  // List productList = new List();
  List productList = [{"quotation_received": true},{"quotation_received": true},{"quotation_received": true}];

  @override
  initState() {
    super.initState();
    // _fetchData();
    // PushNotificationsManager notifMan = new PushNotificationsManager();
    // await notifMan.init();
    if( widget.userId == null ) { //use this to go for wishlist in
      print("User id is null");
    }
  }

  Future _fetchData() async {
    String url = localhostAddress+"/wishlist/?user_id=1";
    var response = await http.get(url);
    var respJson = jsonDecode(response.body);
    if( respJson["Status"] == "Failure" ) {
      print("Failure");
      Get.snackbar(
          "Unknown Error", "Please try again!"
      );
      return;
    }

    // print(respJson["products"].length);
    productList = respJson["products"];
    // log(jsonDecode(respJson["products"]));
    return productList;
  }

  Widget productCard(var data) {
    var enquiryData = data["quotation_received"] ? data["quotation"]["enquiry"] : "";

    // return Column(
    //   children: [
    //     WishlistCardNotes(
    //       productName: "Cast Iron gears 15 inch 1050 rounded edges- PVC",
    //       productImage: "",
    //       maxQty: "300 kg",
    //       productCategory: "Steel Pipes",
    //       productDescription: "Some random stuff that decribes the product... But keep it short, don't get carried away!",
    //       enquiry: "Hello sir,we have stock of about 100 kgs and you can visit our pithampur based factory on August 21 to pick up the stock. 100 kgs stock would cost you ₹ 50,000",
    //       note: "Ask for the quote, about 1000kgs, later in the month.material not required now. Also ask for the durability of the material and ...",
    //       productPrice: "7,000",
    //       scrollController: ScrollController(),
    //       views: "300",
    //     ),
    //     SizedBox(height: 12,)
    //   ],
    // );
    return WishlistCardNotes(
      productName: data["product_name"],
      productImage: data["product_image"],
      maxQty: data["max_quantity"].toString(),
      productCategory: data["product_category"],
      productDescription: data["details"],
      note: data["notes"],
      enquiry: enquiryData,
      productPrice: data["product_price"].toString(),
      scrollController: ScrollController(),
      views: data["views"].toString(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetchData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) return Center(child: CircularProgressIndicator(),);
        // print(snapshot.data[0]);
        //TODO return one of the placeholder images if snapshot length is 0 i.e. no products added to wishlist
        return ListView(
          children: snapshot.data.map<Widget>((product) => productCard(product)).toList(),
        );
      },
    );
  }
}
