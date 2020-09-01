import 'package:flutter/material.dart';

class PostAd extends StatefulWidget {
  @override
  _PostAdState createState() => _PostAdState();
}

class _PostAdState extends State<PostAd> {
  String productName;

  Widget _buildProductName() {
    return TextFormField(
      maxLines: 2,
      decoration: new InputDecoration(
          labelText: "eg. Cast Iron Gears 15 inch 1050\nrounded egdes - PVC",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
      // ignore: missing_return
      validator: (String details) {
        if (details.isEmpty) {
          return "Required";
        }
      },
      onSaved: (String str) {
        productName = str;
      },
    );
  }

  Widget _buildQuantity() {
    return TextFormField();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(children: [
      SizedBox(
        height: 50,
      ),
      Container(
          //width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(0, 30, 30, 30),
          decoration: BoxDecoration(
            color: Colors.redAccent,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0)),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 20, 0),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      'POST AN AD',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    Text('and start de-stocking your dead stock',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        )),
                  ],
                ),
              ],
            ),
          )),
      SizedBox(height: 40),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Row(
              children: [
                Text('ENTER PRODUCT DETAILS',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromRGBO(120, 95, 27, .3),
                        blurRadius: 2.0,
                        offset: Offset(0, 5))
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
                      _buildProductName(),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Text(
                            "Include the material name, size and characteristics of your product.\nCharascter limit - 20 words.",
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize: 10.0,
                                fontFamily: "Arial",
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Please recheck name as it cannot be changed later",
                            style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 10.0,
                                fontFamily: "Arial",
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
            SizedBox(
              height: 20,
            ),
            Container(
              //padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Color.fromRGBO(120, 95, 27, .3),
                              blurRadius: 2.0,
                              offset: Offset(0, 5))
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
                                  "ENTER MAXIMUM QUANTITY",
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
                            _buildQuantity(),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      )
    ])));
  }
}
