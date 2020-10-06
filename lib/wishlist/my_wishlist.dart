import 'dart:convert';
import 'dart:io';
import 'dart:developer';

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
  List productList = new List();

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
    String url = "http://192.168.43.167:5000/wishlist/?user_id=1";
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
        return ListView(
          children: snapshot.data.map<Widget>((product) => productCard(product)).toList(),
        );
      },
    );
  }
}
