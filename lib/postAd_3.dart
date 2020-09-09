import 'package:destock/postAd_4.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
          labelText: "₹ eg. 45,000",
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
                          blurRadius: 40,
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
                  "ENTER PRODUCT NAME",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.0,
                      fontFamily: "Arial",
                      fontWeight: FontWeight.bold),
                ),
              ],
              ),
              SizedBox(
              height: 10.0,
              ),
              _buildProductPrice(),
              SizedBox(
              height: 30,
              ),
              Row(
              children: [
                Text(
                  "Disclose price to customers?",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                      fontFamily: "Arial",
                      fontWeight: FontWeight.bold),
                ),
              ],
              ),
              SizedBox(height:30),
              GestureDetector(
                      onTap: () {
                               if(!_formKeyProductPrice.currentState.validate()){
                                return;
                              }
                              _formKeyProductPrice.currentState.save();
                                // Navigator.pushReplacement(context, new MaterialPageRoute(
                                //     builder: (BuildContext context) => new postAd_3() ),
                                // );
                      },
                          child: Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(horizontal: 30),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.redAccent,
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
                                    builder: (BuildContext context) => new postAd_4() ),
                                );
                      },
                          child: Container(
                              height: 50,
                              margin: EdgeInsets.symmetric(horizontal: 80),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  border: Border.all(
                                    color: Colors.redAccent,
                                  )
                                  //color: Colors.redAccent,
                              ),
                              child: Center(
                                child: Text("CHECKOUT", style: TextStyle(color: Colors.redAccent, fontSize: 18,fontWeight: FontWeight.bold)),
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