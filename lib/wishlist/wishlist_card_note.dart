import 'dart:convert';

import 'package:destock/CONSTANTS.dart';
import 'package:flutter/material.dart';

class WishlistCardNotes extends StatelessWidget {
  WishlistCardNotes({
    Key key,
    @required this.productImage,
    @required this.views,
    @required this.productName,
    @required this.productPrice,
    @required this.productCategory,
    @required this.maxQty,
    @required this.productDescription,
    @required this.note,
    this.enquiry="",
    @required ScrollController scrollController,
  })  : _scrollController = scrollController,
        super(key: key);

  final String productImage;
  final String views;
  final String productName;
  final String productCategory;
  final String productPrice;
  final ScrollController _scrollController;
  final String maxQty;
  final String productDescription;
  final String note;
  String enquiry;

  Widget quotationBox() {
    if( this.enquiry.isEmpty ) return SizedBox.shrink();
    else {
      // print("ENquiry" + this.enquiry);
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Color(0xffD84764).withOpacity(0.2)),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Quotation received',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Container(
              height: 140,
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                this.enquiry,
              ),
            ),
            SizedBox(
              height: 24,
            ),
            // SizedBox(
            //   height: 8,
            // )
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(12,12,12,12),
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 140,
            child: Row(
              children: [
                Container(
                  width: 120,
                  height: 130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      // image: MemoryImage(base64Decode(this.productImage)),
                      // image: AssetImage("assets/images/product_2.png"),
                      image: NetworkImage(localhostAddress+this.productImage),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                        padding: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black.withOpacity(0.6),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(
                              Icons.remove_red_eye,
                              size: 16,
                              color: Colors.white,
                            ),
                            Text(
                              ' ' + this.views,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 200,
                          padding: EdgeInsets.only(right: 8, top: 2),
                          child: Text(
                            this.productName,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                              padding: EdgeInsets.only(top: 2, left: 25),
                              child: Icon(Icons.favorite, color: Colors.pink,)
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 4),
                      width: 150,
                      child: Text(
                        "Category : " + this.productCategory,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontWeight: FontWeight.w400, color: Colors.grey, fontSize: 14),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "₹" + productPrice,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                          text: 'Max Qty  ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: this.maxQty),
                    ],
                  ),
                ),
                Text(
                  'SHARE',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Text(
            this.productDescription,
            maxLines: 3,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xff4B69FF).withOpacity(0.2)),
            padding: EdgeInsets.all(12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                  child: Text(
                    'NOTES',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Container(
                    height: 140,
                    // width: 240,
                    margin: EdgeInsets.all(8),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Scrollbar(
                      controller: _scrollController,
                      // isAlwaysShown: true,
                      child: ListView(
                        padding: EdgeInsets.all(8),
                        children: [
                          Text(
                            this.note,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20,),
          quotationBox(),
          Container(
            margin: EdgeInsets.symmetric(vertical: 32, horizontal: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 180,
                  height: 50,
                  padding: EdgeInsets.all(0),
                  margin: EdgeInsets.all(0),
                  child: FlatButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.phone,
                      color: Color(0xff4B69FF),
                    ),
                    label: Text(
                      "Contact Seller",
                      style: TextStyle(
                          color: Color(0xff4B69FF), fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    shape:
                        StadiumBorder(side: BorderSide(color: Color(0xff4B69FF))),
                  ),
                ),
                Container(
                  width: 180,
                  height: 50,
                  padding: EdgeInsets.all(0),
                  margin: EdgeInsets.fromLTRB(2,0,0,0),
                  child: FlatButton(
                    onPressed: () {},
                    child: Text(
                      'Request a quote',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    shape: StadiumBorder(),
                    color: Color(0xff4B69FF),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
