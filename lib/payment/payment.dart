import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:destock/CONSTANTS.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Payment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PaymentState();
}

class PaymentState extends State<Payment> {
  String paymentToken = '';
  String orderId = '';
  String stage = "PROD"; //change it to PROD later
  String orderAmount = "1";
  String customerName = "Sankarshan Dudhate";
  String orderNote = "Mention the customer id and some other details here";
  String orderCurrency = "INR";
  String appId = "793036fb9dc8738c0d594aa4530397";
  String customerPhone = "9881266239";
  String customerEmail = "sandudhate@gmail.com";
  // String notifyUrl = "https://test.gocashfree.com/notify"; //prod.gocash...
  String notifyUrl = "https://destock.in/payments/webhook/";

  Map<String, String> inputParams = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          // height: MediaQuery.of(context).size.height,
          children: [
            paymentFutureBuilder(),
            RaisedButton(
              child: Text(
                  "Pay"
              ),
              onPressed: makeCardPayment,
            ),
          ],
        ),
      ),
    );
  }

  Widget paymentFutureBuilder() {
    return FutureBuilder(
        future: getTokenId(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();

          return Text(snapshot.data);
        });
  }

  Future getTokenId() async {
    this.orderId = 'order2'+DateTime.now().millisecondsSinceEpoch.toString();

    String url = localhostAddress + '/payments/getToken/';
    // log("$orderId $url");
    // var resp = await http.get(url);
    var resp = await http.post(url, body: {
      'orderId': this.orderId,
      'orderAmount': "1" //has to be string
    }).catchError((error) => log("Error: $error"));
    // log("token gened");
    var respJson = jsonDecode(resp.body);
    paymentToken = respJson["cftoken"];
    // paymentToken = "abc";

    inputParams = {
      "orderId": orderId,
      "orderAmount": orderAmount,
      "tokenData": paymentToken,
      "customerName": customerName,
      "orderNote": orderNote,
      "orderCurrency": orderCurrency,
      "appId": appId,
      "customerPhone": customerPhone,
      "customerEmail": customerEmail,
      "stage": stage,
      "notifyUrl": notifyUrl
    };
    return paymentToken;
  }

  //Cahfree handles payment methods and all
  void makePayment() async {
    CashfreePGSDK.doPayment(inputParams).then((value) => handlePaymentCompletion(value));
    // log("\nPayment Response: \n".padLeft( 10, '-'));
    // paymentResp.forEach((key, value) {
    //   print("$key : $value");
    //   //Do something with the result
    // });
  }

  Future<void> handlePaymentCompletion(Map paymentResponse) async {
    log("Payment Response: "+paymentResponse.toString());

    if(paymentResponse["txStatus"] == "CANCELLED" || paymentResponse["txStatus"] == "FAILED") {
      Get.snackbar("Payment Cancelled", "Please try again!");
      return;
    }

    //TODO handle PENDING payments and other payment statuses

    String orderId = paymentResponse["orderId"];
    String orderAmount = paymentResponse["orderAmount"];
    String referenceId = paymentResponse["referenceId"];
    String txStatus = paymentResponse["txStatus"];
    String paymentMode = paymentResponse["paymentMode"];
    String txMsg = paymentResponse["txMsg"];
    String txTime = paymentResponse["txTime"];

    var resp = await http.post(localhostAddress+'/payments/verifySignature/', body: {
      "orderId" : orderId,
      "orderAmount" : orderAmount.toString(),
      "referenceId" : referenceId.toString(),
      "txStatus" : txStatus,
      "paymentMode" : paymentMode,
      "txMsg" : txMsg.toString(),
      "signature" : paymentResponse["signature"].toString().trim(),
      "txTime" : txTime.toString(),
    });
    // log(resp.body);
    var respJson = jsonDecode(resp.body);
    if(respJson["Status"] == "Success") {
      // Get.snackbar("Payment Done", "Successfully completed the paytemnt!");
      // await Future.delayed(Duration(seconds: 3));
      Get.back(result: true);
    } else {
      Get.snackbar("Payment failed", "Unable to validate payment signature. Please try again!");
      await Future.delayed(Duration(seconds: 3));
      Get.back(result: false);
    }
  }

  void makeCardPayment() {
    // inputParams[ "paymentOption"] = "card";
    // inputParams[ "card_number"] = "4434260000000008"; //Replace Card number
    // inputParams[ "card_expiryMonth"] = "05"; // Card Expiry Month in MM
    // inputParams[ "card_expiryYear"] = "2021"; // Card Expiry Year in YYYY
    // inputParams[ "card_holder"] = "John Doe"; // Card Holder name
    // inputParams[ "card_cvv"] = "123"; // Card CVV
    CashfreePGSDK.doPayment(inputParams).then((value) => handlePaymentCompletion(value));
  }
}