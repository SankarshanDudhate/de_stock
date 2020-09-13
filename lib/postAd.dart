import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:destock/postAd_2.dart';

class PostAd extends StatefulWidget {
  @override
  _PostAdState createState() => _PostAdState();
}

class _PostAdState extends State<PostAd> {

  final GlobalKey<FormState> _formKeyPostAd = GlobalKey<FormState>();

  //---------------------All these variables to be added in db
  String productName;   //Required
  String productQuantity;  //Required
  String productDescription; //Required
  String selectedUnit;  //Required
  String productDimension;  //Optional
  String productWeight;  //Optional
  String productMaterial;  //Optional
  String pickupLocation; //Required
  //-----------------------------------------------------------

  var _selectUnit = {
    "kg",
    "pieces",
    "litre"
  };


  Widget _buildUnit(){
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor : Colors.black
      ),
          child: DropdownButtonFormField<String>(
          items: _selectUnit.map((String dropDownStringItem){
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Center(child: Text(dropDownStringItem,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
            );
          }).toList(),
          onChanged: (_value) {
            setState(() {
              this.selectedUnit = _value;
              print(selectedUnit);
            });
          },
          hint: Text("Select unit",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
          value: selectedUnit,
        // ignore: missing_return
        validator: (String value){
          if(value == null){
            return "Required";
          }
        },
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(30, 17, 30, 17),
          filled : true,
          fillColor: Colors.black,
        ),
      ),
    );
  }


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

 Widget _buildQuantity(){
    return TextFormField(
      decoration: new InputDecoration(
          labelText: "eg. 450",
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
      ],
      // ignore: missing_return
      validator: (String details){
        if(details.isEmpty){
          return "Required";
        }
      },
      onSaved: (String str){
        productQuantity = str;
      },
    );
  }

  Widget _buildProductDescription() {
    return TextFormField(
      maxLines: 4,
      decoration: new InputDecoration(
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
        productDescription = str;
      },
    );
  }

  Widget _buildPickupLocation() {
    return TextFormField(
      maxLines: 4,
      decoration: new InputDecoration(
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
        pickupLocation = str;
      },
    );
  }

  Widget _buildSpecification() {
    return Column(
      children:[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            Expanded(child: Text("Dimension",style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontFamily: "Arial",
                        fontWeight: FontWeight.bold),
                  ),),
            SizedBox(width:30),
            Expanded(
              child: TextFormField(
                //maxLines: 1,
                decoration: new InputDecoration(
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                )),
                  onSaved: (String str){
                    productDimension = str;
                  },
                ),
            ),
          ]
        ),
        SizedBox(height: 20,),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:[
            Expanded(child: Text("Weight",style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontFamily: "Arial",
                        fontWeight: FontWeight.bold),
                  ),),
            SizedBox(width:30),
            Expanded(
              child: TextFormField(
                //maxLines: 1,
                decoration: new InputDecoration(
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                )),
                  onSaved: (String str){
                    productWeight = str;
                  },
                ),
            ),
          ]
        ),
        SizedBox(height: 20,),
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            Expanded(child: Text("Material",style: TextStyle(
                        color: Colors.black,
                        fontSize: 15.0,
                        fontFamily: "Arial",
                        fontWeight: FontWeight.bold),
                  ),),
            SizedBox(width:30),
            Expanded(
              child: TextFormField(
                //maxLines: 1,
                decoration: new InputDecoration(
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                )),
                  onSaved: (String str){
                    productMaterial = str;
                  },
                ),
            ),
          ]
        )
      ]
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Form(
            key: _formKeyPostAd,
        child: ListView(children: [
        SizedBox(
            height: 40,
        ),
        Container(
        //width: MediaQuery.of(context).size.width,
        margin: EdgeInsets.fromLTRB(0, 0, 80, 0),
        padding: EdgeInsets.fromLTRB(0, 30, 0, 30),
        decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0)),
        ),
        child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 0, 0),
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
                          offset: Offset(0, 4),
                          blurRadius: 40,
                          color: Colors.black.withOpacity(.16),
                        ),]
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
                "Include the material name, size and characteristics of your product.\nCharacter limit - 20 words.",
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
                Row(
                  children: [
                    Flexible(child: _buildQuantity()),
                    SizedBox(width:5),
                    Flexible(child: _buildUnit())
                  ],
                ),
              ],
            ),
            )),
            SizedBox(height:20),
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
                "ENTER PRODUCT DESCRIPTION",
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
            _buildProductDescription(),
            SizedBox(
            height: 10,
            ),
            Row(
            children: [
              Text(
                "Tell the customers what this product is.",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 10.0,
                    fontFamily: "Arial",
                    fontWeight: FontWeight.bold),
              ),
            ],
            ),
                      ],
                    ),
                  )),
                  SizedBox(height:20),
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
                "ENTER PRODUCT SPECIFICATION",
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
            _buildSpecification(),
            SizedBox(
            height: 10,
            ),
                      ],
                    ),
                  )),
                  SizedBox(height:20),
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
                          //mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "ENTER PICKUP LOCATION",
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
                        _buildPickupLocation(),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Address from where the user can pick up",
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10.0,
                                  fontFamily: "Arial",
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
                   SizedBox(height: 20,),
                  GestureDetector(
                    onTap: () async {
                      if(!_formKeyPostAd.currentState.validate()){
                        return;
                      }
                      _formKeyPostAd.currentState.save();
                      //Save all data here!!!!!
                      SharedPreferences prefs = await SharedPreferences.getInstance();
                      var adData = {
                        "unit": selectedUnit,
                        "name": productName,
                        "description": productDescription,
                        "dimensions": productDimension,
                        "mateiral": productMaterial,
                        "quantity": productQuantity,
                        "weight": productWeight
                      };
                      await prefs.setString("postAnAdData", adData.toString());
                      Navigator.push(context, new MaterialPageRoute(
                          builder: (BuildContext context) => new postAd_2() ),
                      );
                    },
                    child: Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.redAccent,
                        ),
                        child: Center(
                          child: Text("NEXT", style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold)),
                        ),
                      ),
                  ),
                  SizedBox(height:30)
                  ],
                ),
              ),
            ],
            ),
        ),
        
      ]),
          ),
    );
  }
}
