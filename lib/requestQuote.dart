import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

class requestQuote extends StatefulWidget {
  @override
  _requestQuoteState createState() => _requestQuoteState();
}

class _requestQuoteState extends State<requestQuote> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(100),
        child:  GestureDetector(
              onTap: (){
                _buildRequestQuote(context,'4','1','adharashive@gmail.com','500','KG');
              },
              child: Text("Request Quote",style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700, color: Color(0xff4DA4D6)),)),    
      ),
    );
  }


  void _buildRequestQuote(BuildContext context, String product_id, String user_id, String email,String maxQuantity, String unit) {

   TextEditingController remarkController = new TextEditingController();
   TextEditingController quantityController = new TextEditingController();
    var alertDialog = AlertDialog(
      content :
          Container(
            width: MediaQuery.of(context).size.width*0.8,
            child: SingleChildScrollView(
              child: Column(
                children: [ 
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal:40,vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topRight:  Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)
                        ),
                    ),
                    child: Text('REQUEST A QUOTE', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
                  ),
                  SizedBox(height:30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(child: Text('Quantity', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
                      //SizedBox(width: 10,),
                      Flexible(
                        child: TextField(
                          maxLines: 1,
                          controller: quantityController,
                          decoration: new InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          )
                          ),
                        ),
                      ),
                      //SizedBox(width:10),
                      Flexible(child: Text(maxQuantity + unit + ' max quantity',style: TextStyle(color:Colors.grey[400],fontWeight: FontWeight.bold,fontSize: 14),)),
                    ]
                  ),
                  SizedBox(height:20),
                  Row(
                    children: [
                      Text('Remark', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                    ],
                  ),
                  SizedBox(height:10),
                  TextField(
                    maxLines: 6,
                    controller: remarkController,
                    decoration: new InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )
                    ),
                  ),
                  SizedBox(height:20),
                  Row(
                    children: [
                      Flexible(child: Text('Quote will be sent to you as a notification and same on ' + email,textAlign: TextAlign.left,style: TextStyle(fontSize:14),))
                    ],
                  ),
                  SizedBox(height:20),
                  GestureDetector(
                    onTap: () async {
                      DateTime enqDate = DateTime.now();
                      DateFormat formatter = DateFormat("yyyy-MM-dd");
                      String formattedDate = formatter.format(enqDate);
                      print(formattedDate);

                      String remark = remarkController.text;

                      if( int.parse(quantityController.text) > 500 ) {
                        Fluttertoast.showToast(msg: "Please enter a valid quantity!", toastLength: Toast.LENGTH_LONG, );
                        return;
                      }

                      String url = 'http://192.168.43.167:5000/products/enquiries/enquire/';
                      var dataObj = {'product_id': product_id, 'date':formattedDate, 'buyer_id':user_id,'enquiry':remark,'quantity':quantityController.text};
                      var res = await http.post(url, body: dataObj);
                      var resJson = jsonDecode(res.body);
                      print(resJson["Status"]);

                      if( resJson["Status"] == "Success" ) {
                        Fluttertoast.showToast(msg: "Replied Successfully!");
                        // setState(() {
                        // Not needed right now... use it to disable the request quote button later on an actual screen
                        //   widget.enquiry_data[productIndex]["replied"] = true; //this is just an example
                        // });
                      } else {
                        Fluttertoast.showToast(msg: "Error - failed to reply!");
                      }

                      //TODO close the alertDialog
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: Color(0xFFFC0151),
                      ),
                      child: Center(
                        child: Text("Send Enquiry", style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  SizedBox(height:20),
                  Text('Cancel', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color:Color(0xFFFC0151),),),
                ]
              ),
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
}
