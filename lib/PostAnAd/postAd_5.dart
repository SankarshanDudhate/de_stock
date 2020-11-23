import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:destock/CONSTANTS.dart';
import 'package:destock/payment/payment.dart';
import 'package:destock/payment/payment_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/dialog/dialog_route.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostAd5 extends StatefulWidget {
  const PostAd5({
    Key key,
  }) : super(key: key);

  @override
  _PostAd5State createState() => _PostAd5State();
}

class _PostAd5State extends State<PostAd5> {
  int _selected = 0;
  int adsCount = 0;
  final String _planBg = "assets/background/bg_payment_plan.png";
  final String _planBgSelected =
      "assets/background/bg_payment_plan_selected.png";

  int totalAmount = 0;

  @override
  void initState() {
    super.initState();

    setPlan();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 80, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: Text(
                  "5 Out of 5",
                  style: TextStyle(
                      color: Color(0xff979797),
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ),
              ),
              SvgPicture.asset("assets/icons/progress_step_5.svg"),
              SizedBox(height: 8),
              Text(
                "Step 5",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Color(0xff4B69FF),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "SELECT A PAYMENT PLAN",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                      textColor: (_selected == 1) ? Colors.white : null,
                      onPressed: () {
                        //Do not uncomment, supposed to be like this
                        // setState(() {
                        //   (_selected == 1) ? _selected = 0 : _selected = 1;
                        // });
                      },
                      padding: EdgeInsets.all(0),
                      child: PaymentPlanCard(
                        bgImg: (_selected == 1) ? _planBgSelected : _planBg,
                        minVisible: false,
                        adQty: 1,
                        adRate: 100,
                      )),
                  FlatButton(
                      textColor: (_selected == 2) ? Colors.white : null,
                      onPressed: () {
                        //Do not uncomment, supposed to be like this
                        // setState(() {
                        //   (_selected == 2) ? _selected = 0 : _selected = 2;
                        // });
                      },
                      padding: EdgeInsets.all(0),
                      child: PaymentPlanCard(
                        bgImg: (_selected == 2) ? _planBgSelected : _planBg,
                        minVisible: true,
                        adQty: 10,
                        adRate: 90,
                      )),
                  FlatButton(
                      textColor: (_selected == 3) ? Colors.white : null,
                      onPressed: () {
                        //Do not uncomment, supposed to be like this
                        // setState(() {
                        //   (_selected == 3) ? _selected = 0 : _selected = 3;
                        // });
                      },
                      padding: EdgeInsets.all(0),
                      child: PaymentPlanCard(
                        bgImg: (_selected == 3) ? _planBgSelected : _planBg,
                        minVisible: true,
                        adQty: 50,
                        adRate: 80,
                      )),
                ],
              ),
              SizedBox(
                height: 32,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "PRICE DETAILS",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    (adsCount == 1) ? "($adsCount AD)" : "($adsCount ADS)",
                    style: TextStyle(
                        color: Color(0xff979797),
                        fontWeight: FontWeight.bold,
                        fontSize: 12),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                    border: Border.symmetric(
                        vertical:
                            BorderSide(color: Colors.grey.withOpacity(0.5)))),
                // color: Colors.grey.withOpacity(0.5),
                height: 1,
                width: 172,
              ),
              buildTotalAmountRow(),
              SizedBox(
                height: 8,
              ),
              // buildReferralRow(),
              // Container(
              //   margin: EdgeInsets.symmetric(vertical: 16),
              //   decoration: BoxDecoration(
              //       border: Border.symmetric(
              //           vertical:
              //               BorderSide(color: Colors.grey.withOpacity(0.5)))),
              //   height: 1,
              // ),
              // buildPayableAmountRow(),
              buildPaymentButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPaymentButton() {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 80),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 54),
          color: Color(0XFFFC0151),
          onPressed: () async {
            //TODO check for 'productsChanged' flag, if yes read and upload ads otherwise just go for payments

            SharedPreferences prefs = await SharedPreferences.getInstance();
            String user_id = prefs.getString('user_id');
            user_id = (user_id==null) ? '1' : user_id;

            List<String> adsList = prefs.getStringList('adsList');
            // print(jsonDecode(adsList[0]));

            List productsList = [];

            for (var ad in adsList) {
              Map adJson = jsonDecode(ad);
              // var imagesList = jsonDecode(adJson["images"]);
              var imagesList = [];
              // imagesList = imagesList.map((imagePath) => imagePathToBase64(imagePath)).toList();
              adJson["images"] = imagesList;
              productsList.add(adJson);
            }

            log(jsonEncode(productsList));

            Get.defaultDialog(content: Text("Pushing ads to server..."));

            String url = "$localhostAddress/payments/save_temp_products/";
            var resp = await post(url, body: {
              'user_id': user_id,
              'products': jsonEncode(productsList),
            });

            //TODO clear the 'productsChanged' flag which will help us know if we should upload the products or not

            Get.back();

            //  TODO clear the adList from prefs after payment is successful (when notification is received)
            // bool wasPaymentSuccessful = await Get.to(Payment());
            // log("Payment return value: "+wasPaymentSuccessful.toString());
            // Get.snackbar(wasPaymentSuccessful.toString(), "");
          },
          textColor: Colors.white,
          child: Text(
            "PROCEED TO PAYMENT",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        ),
      ),
    );
  }

  Row buildPayableAmountRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "TOTAL PAYABLE AMOUNT",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        Text(
          "₹ $totalAmount", //TODO change it to reflect referral code
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )
      ],
    );
  }

  Widget buildReferralRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Referral code applied",
          style: TextStyle(fontSize: 16),
        ),
        Text(
          "data",
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }

  Row buildTotalAmountRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Total amount",
          style: TextStyle(fontSize: 16),
        ),
        Text(
          "₹ $totalAmount",
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }

  Future setPlan() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> adsList = prefs.getStringList("adsList");
    int selectionIndexTemp = 0;
    if (adsList.length == 1) {
      selectionIndexTemp = 1;
      totalAmount = adsList.length * 100;
    }
    if (adsList.length >= 10) {
      selectionIndexTemp = 2;
      totalAmount = adsList.length * 90;
    }
    if (adsList.length >= 50) {
      selectionIndexTemp = 3;
      totalAmount = adsList.length * 80;
    }

    setState(() {
      _selected = selectionIndexTemp;
      adsCount = adsList.length;
      totalAmount = totalAmount;
    });
  }
}

imagePathToBase64(imagePath) {
  File imageFile = new File(imagePath);
  var fileBytes = imageFile.readAsBytesSync();
  var base64String = base64Encode(fileBytes);
  return base64String;
}

class PaymentPlanCard extends StatelessWidget {
  PaymentPlanCard({this.bgImg, this.adQty, this.adRate, this.minVisible});

  final String bgImg;
  final int adQty;
  final int adRate;
  final bool minVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152,
      width: 110,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage(this.bgImg),
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: 12,
          ),
          (minVisible)
              ? Text(
                  "minimum",
                  style: TextStyle(fontWeight: FontWeight.w300),
                )
              : Text(
                  "",
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                adQty.toString(),
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  (adQty == 1) ? " Ad" : " Ads",
                  style: TextStyle(fontSize: 10),
                ),
              )
            ],
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "₹ " + adRate.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Text(
                  " /Ad",
                  style: TextStyle(fontSize: 8),
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "2 months",
                style: TextStyle(fontWeight: FontWeight.bold),
              )
            ],
          )
        ],
      ),
    );
  }
}
