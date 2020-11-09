import 'dart:io';
import 'dart:developer';
import 'package:destock/PostAnAd/postAd_4.dart';
import 'package:destock/PostAnAd/reviewNameDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
// import 'package:file/file.dart';

class PostAd3 extends StatefulWidget {
  @override
  _PostAd3State createState() => _PostAd3State();
}

class _PostAd3State extends State<PostAd3> {

  final GlobalKey<FormState> _formKeyProductPrice = GlobalKey<FormState>();

  String productPrice;
  bool disclosePrice = false;

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
      body: SingleChildScrollView(
              child: Form(
          key: _formKeyProductPrice,
                child: Container(
            padding: EdgeInsets.symmetric(horizontal:20),
            child: Column(
              children:[
                SizedBox(height:50),
                Center(
                child: Text(
                  "4 Out of 5",
                  style: TextStyle(
                      color: Color(0xff979797),
                      fontWeight: FontWeight.w400,
                      fontSize: 18),
                ),
              ),
              SvgPicture.asset("assets/icons/progress_step_4.svg"),
              SizedBox(height:20),
                Row(
                children: [
                  Text(
                    "Step 4",
                    style: TextStyle(
                        color: Color(0xFF4B69FF),
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
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      //width: 220,
                      margin: EdgeInsets.symmetric(horizontal:50),
                      padding: EdgeInsets.symmetric(horizontal:2, vertical:2),
                      decoration: BoxDecoration(
                        border: Border.all( 
                          color : Color(0xFFE6E6E6),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(60)
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState((){
                                this.disclosePrice = false;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal:20, vertical:10),
                              decoration: BoxDecoration(
                                color : disclosePrice == false ? Color(0xFF000000) : Color(0xFFFFFFFF),
                                // border: Border.all( 
                                //   color : Color(0xFFFFFF),
                                // ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30)
                                ),
                              ),
                              child: Text('NO', style: disclosePrice == false ? TextStyle( fontSize : 20, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)) : TextStyle( fontSize: 18 , color: Color(0xFF979797)))
                              
                              ),
                          ),
                          //SizedBox(width:10),
                          GestureDetector(
                            onTap: () {
                              setState((){
                                this.disclosePrice = true;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal:20, vertical:10),
                              decoration: BoxDecoration(
                                color : disclosePrice == true ? Color(0xFF4B69FF) : Color(0xFFFFFFFF),
                                // border: Border.all( 
                                //   color : Color(0xFFFFFF),
                                // ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30)
                                ),
                              ),
                              child: Text('YES', style: disclosePrice == true ? TextStyle( fontSize : 20, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)) : TextStyle( fontSize: 18 , color: Color(0xFF979797)))
                              ),
                          )
                        ],
                      ),
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
                             //Add disclosePrice to db
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
                               Navigator.push(context, new MaterialPageRoute(
                                   builder: (BuildContext context) => new PostAd4() ),
                               );
                             } else {
                               print(respJson["Details"]);
                             }
                        },
                            child: GestureDetector(
                              onTap: (){
                                _buildEditDialogue(context);
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
                      ),
                      SizedBox(height:20),
                      GestureDetector(
                            onTap: () {
                                  if(!_formKeyProductPrice.currentState.validate()){
                                  return;
                                }
                                _formKeyProductPrice.currentState.save();
                                  Navigator.push(context, new MaterialPageRoute(
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
        ),
      )
    );
  }

  void _buildEditDialogue(BuildContext context) {
   
    var alertDialog = AlertDialog(
      content : reviewNameDialog(),
      shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.all(Radius.circular(5.0))
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