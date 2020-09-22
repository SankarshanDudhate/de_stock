import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class enquiry_card extends StatelessWidget {
  final String product_id;
  final String product_name;
  final String product_price;
  String image;
  List<dynamic> enquiry_data;
  String formattedDate;

  enquiry_card({Key key, this.product_id,this.product_name,this.product_price, this.image, this.enquiry_data, this.formattedDate})
      : super(key: key);

  Widget replyText(BuildContext context, data) {
    print(data["enquiry"]["replied"]);
    if (!data["enquiry"]["replied"]){
      return GestureDetector(
        onTap: () {
          _buildReply(context,/*data["enquiry"]["user_image"],*/ product_id,data["enquiry"]["user_name"],data["enquiry"]["buyer_enquiry"],product_name,data["enquiry"]["quantity"],image);
        },
        child: Text("REPLY",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xff4DA4D6)),),
      );
    } else {
      return GestureDetector(
        onTap: () {
          _buildReply(context,/*data["enquiry"]["user_image"],*/ product_id,data["enquiry"]["user_name"],data["enquiry"]["buyer_enquiry"],product_name,data["enquiry"]["quantity"],image);
        },
        child: Text("REPLIED",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700, color: Color(0xffD84764)),),
      );
    }
  }

  Widget enquiriesBuilder(BuildContext context) {
    return Column(
      children: enquiry_data.map((enquiry) => enquiries(context, enquiry)).toList(),
    );
  }

  Widget enquiries(BuildContext context, data) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(50),),
              child: Image.asset("assets/images/user_image_2.png", height: 50,)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 210,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(data["enquiry"]["user_name"],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black),),
                      Text(formattedDate,
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  width: 200,
                  child: Text(data["enquiry"]["buyer_enquiry"],
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff6F6F6F)),),
                ),
                SizedBox(height: 10,),
                Container(
                  width: 210,
                  child: Row(
                    children: [
                      Text("Qty "+data["enquiry"]["quantity"],
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black),),
                      SizedBox(width: 50,),
                      replyText(context, data),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20),),
        color: Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 40,
            color: Colors.black.withOpacity(.16),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20),),
              color: Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 10,
                  color: Colors.black.withOpacity(.16),
                ),
              ],
            ),
            child: Row(
              children: [
                Image.asset("assets/images/user_image_1.png", height: 60,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 190,
                        child: Text(product_name,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),),
                      ),
                      SizedBox(height: 5,),

                      Container(
                        width: 220,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(product_id,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Color(0xff6e6e6e)),),
                            Row(
                              children: [
                                // Image.asset("assets/images/ruppee.png", height: 11,),
                                Text("₹ "+product_price,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          enquiriesBuilder(context),
        ],
      ),
    );
  }
}






void _buildReply(BuildContext context,String product_id, String user_name,String user_enquiry,String product_name,String quantity,String image) {

  TextEditingController replyController = new TextEditingController();
  var alertDialog = AlertDialog(
    content :
    Container(
      width: MediaQuery.of(context).size.width*0.8,
      child: ListView(
        // mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(30),),
                  child: Image.asset("assets/images/user_image_1.png", height: 50,)),
              SizedBox(width:20),
              Flexible(child: Text(user_name + ' has requested a quote for your product',textAlign: TextAlign.left,style: TextStyle(fontSize:16),))
            ],
          ),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.grey[400],
                )
            ),
            child: Row(
                children: [
                  Flexible(child: Text(product_name,maxLines: 2,style: TextStyle(color:Colors.grey,fontSize: 14),)),
                  ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5),),
                      child: Image.asset("assets/images/user_image_1.png", height: 50,)),
                ]
            ),
          ),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('ENQUIRY',style: TextStyle(color:Colors.grey[400],fontWeight: FontWeight.bold,fontSize: 14),),
              Text('Qty  ' + quantity, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),)
            ],
          ),
          SizedBox(height:10),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: const Color(0xFFFFF1F6),
            ),
            child: Flexible(child: Text(user_enquiry, style: TextStyle(fontSize:16),)),
          ),
          SizedBox(height: 20,),
          Row(
            children: [
              Text('Enter your reply', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            ],
          ),
          SizedBox(height:10),
          TextField(
            maxLines: 4,
            controller: replyController,
            decoration: new InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                )
            ),
          ),
          SizedBox(height:20),
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 80),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: Color(0xFFFC0151),
            ),
            child: GestureDetector(
              onTap: () async {
                //TODO send reply to the enquiry
                // String dateString = prod["enquiries"][0]["enquiry"]["enquiry_date"];
                // List dateParts = dateString.split("-");
                DateTime enqDate = DateTime.now();
                DateFormat formatter = DateFormat("MMM dd, yyyy");
                String formattedDate = formatter.format(enqDate);
                print(formatter.format(enqDate));

                String reply = replyController.text;

                String url = 'http://192.168.43.167:5000/products/enquiries/reply/';
                var dataObj = {'product_id': product_id, 'enquiry_date':formattedDate, 'buyer_id':'1','reply':reply};
                var res = await http.post(url, body: dataObj);
                var resJson = jsonDecode(res.body);
                print(resJson["Status"]);
              },
              child: Center(
                child: Text("REPLY", style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    ),
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10.0))
    ),
  );

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      }
  );
}