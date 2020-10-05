import 'dart:io';
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import 'enquiry_product_card.dart';

class EnquiredProducts extends StatefulWidget {
  @override
  _EnquiredProductsState createState() => _EnquiredProductsState();
}

class _EnquiredProductsState extends State<EnquiredProducts> {
  List productList = new List();

  _getEnquiryData() async {
    print("\n\nSOmeStirng\n\n");
    String url = "http://192.168.43.167:5000/users/enquiries/?user_id=2";
    var response = await http.get(url);
    var respJson = jsonDecode(response.body);
    if( respJson["Status"] == "Failure" ) {
      print("Failure");
      Fluttertoast.showToast(msg: "Error occured... Please try again!");
      return;
    }

    // print(respJson["products"].length);
    productList = respJson["products"];
    // log(productList.toString());
    return productList;
  }

  Widget enquiryCard(data) {
    String replyDate='',replyMesage='';
    if(data["seller_name"] != null) {
      replyDate = data["reply"]["date"];
      replyMesage = data["reply"]["seller_reply"];
    }
    return EnquiryProductCard(
      productName: data["name"],
      productImage: 'assets/images/product.png',
      productCategory: data["category"],
      productCost: data["price"].toString(),
      profileName: data["seller_name"],
      profileImage: 'assets/images/product.png',
      qty: data["quantity"],
      date: replyDate,
      message: replyMesage,
      enquiryMessage: data["enquiry"],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getEnquiryData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: snapshot.data.map<Widget>((snap) => enquiryCard(snap)).toList()
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
