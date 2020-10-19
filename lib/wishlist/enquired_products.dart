import 'dart:io';
import 'dart:convert';
import 'dart:developer';

import 'package:destock/CONSTANTS.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'enquiry_product_card.dart';

class EnquiredProducts extends StatefulWidget {
  @override
  _EnquiredProductsState createState() => _EnquiredProductsState();
}

class _EnquiredProductsState extends State<EnquiredProducts> {
  // List productList = new List();
  List productList = [
    {"quotation_received": true},
    {"quotation_received": true},
    {"quotation_received": true}
  ];

  _getEnquiryData() async {
    // print("\n\nSOmeStirng\n\n");
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = (prefs.getString('user_id') == null) ? '2' : prefs.getString('user_id');
    String url = localhostAddress + "/users/buyerEnquiries/?user_id=$userId";
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
    log(productList.toString());
    return productList;
  }

  Widget enquiryCard(data) {
    String replyDate = '', replyMesage = '';
    if (data["seller_name"] != null) {
      replyDate = data["reply"]["date"];
      replyMesage = data["reply"]["seller_reply"];
    }
    // return Column(
    //   children: [
    //     EnquiryProductCard(
    //       productName:"Cast Iron gears 15 inch 1050 rounded edges- PVC",
    //       productImage: 'assets/images/product.png',
    //       productCategory: "Steel Pipes",
    //       productCost: "7,000",
    //       profileName: "Lakshmi Mittal",
    //       profileImage: 'assets/images/product.png',
    //       qty: "300 kg",
    //       date: "2020-10-12",
    //       message: "Ask for the quote, about 1000kgs, later in the month.material not required now. Also ask for the durability of the material and...",
    //       enquiryMessage: "Hello sir,we have stock of about 100 kgs and you can visit our pithampur based factory on August 21 to pick up the stock. 100 kgs stock would cost you ₹ 50,000",
    //     ),
    //     SizedBox(height: 12,),
    //   ],
    // );
    return Column(
      children: [
        EnquiryProductCard(
          productName: data["name"],
          productImage: data['image'],
          productCategory: data["category"],
          productCost: data["price"].toString(),
          profileName: data["seller_name"],
          profileImage: data['seller_image'],
          qty: data["quantity"],
          date: replyDate,
          message: replyMesage,
          enquiryMessage: data["enquiry"],
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getEnquiryData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          //TODO return one of the placeholder images if snapshot length is 0 i.e. no product enquiries are pending
          return ListView(
              children: snapshot.data
                  .map<Widget>((snap) => enquiryCard(snap))
                  .toList());
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
