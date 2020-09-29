import 'dart:io';
import 'dart:developer';
import 'package:destock/PostAnAd/postAd_4.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:file/file.dart';

class postAd_3 extends StatefulWidget {
  @override
  _postAd_3State createState() => _postAd_3State();
}

class _postAd_3State extends State<postAd_3> {

  final GlobalKey<FormState> _formKeyProductPrice = GlobalKey<FormState>();

  String productPrice;

   Widget _buildProductPrice() {
    return TextFormField(
      maxLines: 1,
      decoration: new InputDecoration(
          hintText: "₹ eg. 45,000",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
          keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
      ],
      // ignore: missing_return
      validator: (String details) {
        if (details.isEmpty) {
          return "Required";
        }
      },
      onSaved: (String str) {
        productPrice = str;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKeyProductPrice,
              child: Container(
          padding: EdgeInsets.symmetric(horizontal:20),
          child: Column(
            children:[
              SizedBox(height:50),
              Row(
              children: [
                Text(
                  "Step 3",
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 20.0,
                      fontFamily: "Arial",
                      fontWeight: FontWeight.bold),
                ),
              ],
              ),
              SizedBox(height:10),
              Row(
                children: [
                  Text('PRODUCT PRICE',
                  style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  )),
                ],
                ),
                SizedBox(height: 50),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 10,
                          color: Colors.black.withOpacity(.16),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(22, 22, 22, 12),
                      child: Column(
                        children: <Widget>[
              SizedBox(
              height: 10.0,
              ),
              Row(
              children: [
                Text(
                  "ENTER SELLING PRICE",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontFamily: "Arial",
                      fontWeight: FontWeight.bold),
                ),
              ],
              ),
              SizedBox(
              height: 10.0,
              ),
              _buildProductPrice(),
              SizedBox(height: 30,),
              Row(
              children: [
                Text(
                  "Disclose price to customers?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontFamily: "Arial",
                      fontWeight: FontWeight.bold),
                ),
              ],
              ),
              SizedBox(height:30),
              GestureDetector(
                      onTap: () async {
                           if(!_formKeyProductPrice.currentState.validate()){
                            return;
                          }
                          _formKeyProductPrice.currentState.save();
                           SharedPreferences prefs = await SharedPreferences.getInstance();
                           var adData = prefs.getString("postAnAdData");
                           //print(adData);
                           var adDataJson = jsonDecode(adData);
                           //print(adDataJson);
                           adData = jsonEncode(adDataJson);
                           prefs.setString("postAnAdData", adData);
                           List imageStrings = [];
                           File imageFile;
                           var fileBytes,fileString;
                           print(adDataJson);

                           //This loop converts file paths into base64 string and adds them in imageStrings list
                           for ( var image in jsonDecode(adDataJson["images"]) ) {
                             imageFile = new File(image.toString());
                             fileBytes = await imageFile.readAsBytesSync();
                             fileString = base64Encode(fileBytes);
                             imageStrings.add(fileString);
                           }

                           // log(imageStrings.toString());
                           String url = "http://192.168.43.167:5000/products/add/";
                           var resp = await http.post(url, body: {
                             "name": adDataJson["name"],
                             "quantity": adDataJson["quantity"],
                             "unit": adDataJson["unit"],
                             "description": adDataJson["description"],
                             "dimension": adDataJson["dimensions"],
                             "material": adDataJson["material"],
                             "weight": adDataJson["weight"],
                             "images": imageStrings[0],
                             "price": productPrice.toString()
                           });
                           print(resp.body);
                           var respJson = jsonDecode(resp.body);
                           if( respJson["Status"] == "Success" ) {
                              print("faf");
                             Navigator.pushReplacement(context, new MaterialPageRoute(
                                 builder: (BuildContext context) => new postAd_3() ),
                             );
                           } else {
                             print(respJson["Details"]);
                           }
                      },

                          child: Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(horizontal: 30),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color(0xFFFC0151),
                              ),
                              child: Center(
                                child: Text("Save and add a new product", style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold)),
                              ),
                            ),
                    ),
                    SizedBox(height:20),
                    GestureDetector(
                          onTap: () {
                                if(!_formKeyProductPrice.currentState.validate()){
                                return;
                              }
                              _formKeyProductPrice.currentState.save();
                                Navigator.pushReplacement(context, new MaterialPageRoute(
                                    builder: (BuildContext context) => new PostAd4() ),
                                );
                          },
                          child: Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(horizontal: 80),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  border: Border.all(
                                    color: Color(0xFFFC0151),
                                  )
                              ),
                              child: Center(
                                child: Text("CHECKOUT", style: TextStyle(color:  Color(0xFFFC0151), fontSize: 18,fontWeight: FontWeight.bold)),
                              ),
                            ),
                    ),
                    SizedBox(height:30)

            ]
          )
        ),)])),
      )
    );
  }
}