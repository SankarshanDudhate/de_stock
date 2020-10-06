import 'dart:convert';
import 'dart:developer';

import 'package:cashfree_pg/cashfree_pg.dart';
import 'package:destock/CONSTANTS.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:destock/CONSTANTS.dart';

class PaymentTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => PaymentTestState();
}

class PaymentTestState extends State<PaymentTest> {
  String paymentToken = '';
  String orderId = '';
  String stage = "TEST"; //change it to PROD later
  String orderAmount = "1";
  String customerName = "Customer Name";
  String orderNote = "Mention the product id and some other details here";
  String orderCurrency = "INR";
  String appId = "34637a696651117db77e9bdc673643";
  String customerPhone = "9999999999";
  String customerEmail = "sample@gmail.com";
  String notifyUrl = "https://test.gocashfree.com/notify"; //prod.gocash...

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
    log("$orderId $url");
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
      "txTime" : txTime.toString()
    });
    log(resp.body);

  }

  void makeCardPayment() {
    inputParams[ "paymentOption"] = "card";
    inputParams[ "card_number"] = "4434260000000008"; //Replace Card number
    inputParams[ "card_expiryMonth"] = "05"; // Card Expiry Month in MM
    inputParams[ "card_expiryYear"] = "2021"; // Card Expiry Year in YYYY
    inputParams[ "card_holder"] = "John Doe"; // Card Holder name
    inputParams[ "card_cvv"] = "123"; // Card CVV
    // {
    //   "orderId": orderId,
    //   "orderAmount": orderAmount,
    //   "tokenData": paymentToken,
    //   "customerName": customerName,
    //   "orderNote": orderNote,
    //   "orderCurrency": orderCurrency,
    //   "appId": appId,
    //   "customerPhone": customerPhone,
    //   "customerEmail": customerEmail,
    //   "stage": stage,
    //   "notifyUrl": notifyUrl
    // };
    log("Params: \n$inputParams");
    CashfreePGSDK.doPayment(inputParams).then((value) => handlePaymentCompletion(value));
  }
}
