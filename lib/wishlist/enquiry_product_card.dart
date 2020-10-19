import 'package:destock/CONSTANTS.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:destock/utils/conversions.dart';

class EnquiryProductCard extends StatelessWidget {
  final String productName;
  final String productImage;
  final String productCategory;
  final String productCost;
  final String profileImage;
  final String profileName;
  final String qty;
  final String date;
  final String message;
  final String enquiryMessage;
  EnquiryProductCard({
    this.productName,
    this.productImage,
    this.productCategory,
    this.productCost,
    this.profileImage,
    this.profileName,
    this.qty,
    this.date,
    this.message,
    this.enquiryMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              spreadRadius: 2,
              blurRadius: 5,
              color: Colors.grey.withOpacity(0.2),
            )
          ],
          color: Colors.white),
      child: Column(
        children: [
          buildHeader(
            productName: this.productName,
            productImage: this.productImage,
            productCategory: this.productCategory,
            productCost: this.productCost,
          ),
          buildBody(
            profileImage: this.profileImage,
            profileName: this.profileName,
            qty: this.qty,
            date: this.date,
            message: this.message,
          ),
          buildEnquiry(
            enquiryMessage: this.enquiryMessage,
          ),
        ],
      ),
    );
  }

  ExpansionTile buildEnquiry({String enquiryMessage}) {
    return ExpansionTile(
      backgroundColor: Color(0xeeF9F9F9),
      tilePadding: EdgeInsets.symmetric(horizontal: 32),
      childrenPadding: EdgeInsets.only(bottom: 16),
      title: Text(
        'VIEW MY ENQUIRY',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      ),
      children: [
        Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(8)),
          child: Text(
            enquiryMessage,
          ),
        ),
      ],
    );
  }

  Container buildBody({
    String profileImage,
    String profileName,
    String qty,
    String date,
    String message,
  }) {
    if (profileName != null) {
      return Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  margin: EdgeInsets.only(right: 16, left: 8),
                  // padding: EdgeInsets.only(right: 16),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        // image: AssetImage(profileImage),
                        image: NetworkImage(localhostAddress+profileImage),
                      ),
                      borderRadius: BorderRadius.circular(100)),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: new TextSpan(
                        style: new TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        children: <TextSpan>[
                          new TextSpan(
                              text: profileName + ' ',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          new TextSpan(
                              text: 'replied',
                              style: new TextStyle(fontWeight: FontWeight.w300)),
                        ],
                      ),
                    ),
                    SizedBox(height: 4,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        RichText(
                          text: new TextSpan(
                            style: new TextStyle(
                              fontSize: 14.0,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              new TextSpan(
                                  text: 'Qty  ',
                                  style: TextStyle(color: Colors.grey)),
                              new TextSpan(
                                  text: qty,
                                  style:
                                      new TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        SizedBox(width: 140,),
                        Container(
                          child: Text(
                            dateToMMMddyyyy(date),
                            style: TextStyle(
                                fontSize: 10, fontStyle: FontStyle.italic),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: 170,
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.fromLTRB(8,16,8,16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                color: Color(0xffFFDDE9),
              ),
              child: Text(
                message,
                style: TextStyle(fontSize: 18),
                maxLines: 5,
              ),
            ),
            Container(
              width: 360,
              margin: EdgeInsets.only(top: 4),
              child: FlatButton(
                onPressed: () {},
                shape: StadiumBorder(),
                color: Color(0xffD84764),
                padding: EdgeInsets.symmetric(horizontal: 80, vertical: 16),
                child: Text(
                  'Contact Seller',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      );
    } else {
      // print("No reply found!");
      return Container(
        padding: EdgeInsets.all(12),
        child: Container(
            padding: EdgeInsets.only(top: 20),
            child: Text("No reply yet!", style: TextStyle(fontWeight: FontWeight.bold),) //change this to have an image too
        ),
      );
    }
  }

  Container buildHeader({
    String productImage,
    String productName,
    String productCategory,
    String productCost,
  }) {
    return Container(
      padding: EdgeInsets.fromLTRB(16,16,16,16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey.withOpacity(0.2))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: 80,
            margin: EdgeInsets.only(right: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              image: DecorationImage(image: NetworkImage(localhostAddress+productImage)),
            ),
          ),
          SizedBox(width: 8,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 250,
                height: 50,
                child: Text(
                  productName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15.5),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    color: Color(0xffD84764).withOpacity(0.15),
                    child: Text(
                      productCategory,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: Color(0xff626161)),
                    ),
                  ),
                  SizedBox(width: 60),
                  //cost text should float right
                  Text(
                    "₹ " + productCost,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
