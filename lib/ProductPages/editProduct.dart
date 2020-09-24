import 'package:flutter/material.dart';

class editProduct extends StatefulWidget {
  @override
  _editProductState createState() => _editProductState();
}

class _editProductState extends State<editProduct> {

  String productName =  "Cast Iron Gears 15 inch 1050 rounded egdes - PVC";   
  String productQuantity;
  String productDescription; 
  String selectedUnit;  
  String productDimension;
  String productWeight;
  String productMaterial;
  String pickupLocation;

  Widget _buildProductName() {
    return TextFormField(
      maxLines: 2,
      enabled: false,
      decoration: new InputDecoration(
          labelText: productName,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset("assets/images/Group_166.png"),
            Column(
              children: [
                SizedBox(height: 60,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20),
                  child: Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.arrow_back_ios),
                      SizedBox(width: 20,),
                      Flexible(child: Text('EDIT PRODUCT DETAILS', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                      //Icon(Icons.share)
                      Container()
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                //---------------
                Container(
                  margin: EdgeInsets.symmetric(horizontal:20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, 4),
                          blurRadius: 40,
                          color: Colors.black.withOpacity(.16),
                        ),]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(22, 22, 22, 12),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 10.0,),
                        Row(
                        children: [
                          Text(
                            "PRODUCT NAME",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.0,
                                fontFamily: "Open Sans",
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                        ),
                          SizedBox(height: 10.0,),
                          _buildProductName(),
                          SizedBox(
                          height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "This cannot be edited.",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10.0,
                                  fontFamily: "Open Sans",
                                  fontStyle: FontStyle.italic,
                            ),),
                            SizedBox(width: 5,),
                            Text(
                              "Check FAQs",
                              style: TextStyle(
                                  color: Colors.blueAccent,
                                  fontSize: 12.0,
                                  fontFamily: "Open Sans",
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                          ),
                      ],
                    ),
                  )),
             ]
            ),
          ]
        ),
      )
    );
  }
}