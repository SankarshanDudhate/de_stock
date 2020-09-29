import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:destock/PostAnAd/postAd_2.dart';

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
  String newSpec;
  //-----------------------------------------------------------

  var _selectUnit = {
    "kg",
    "pieces",
    "litre"
  };

List<String> specName = [
  'Material','Weight','Dimensions'
];

List<String> specDetails = ['','',''];
List<Map<String,String>> _specs= new List();

@override
  void initState() {
    // TODO: implement initState
    super.initState();
      for(int i=0;i<specName.length;i++){
        _specs.add({
          "name":specName[i],
          "details":specDetails[i],
        });
      }
      print(_specs);
  }


  Widget _buildProductName() {
    return TextFormField(
      maxLines: 2,
      decoration: new InputDecoration(
          hintText: "eg. Cast Iron Gears 15 inch 1050\nrounded egdes - PVC",
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
          hintText: "eg. 450",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          )
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
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          )
        ),
      ),
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

    Widget _buildSpecification(){
    return ListView.builder(
      itemCount: _specs.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, index) => Column(
        children: [
          Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_specs[index]['name'],style: TextStyle(fontWeight: FontWeight.bold,fontSize:16),),
                  ],
                ),
              ),
              Stack(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width*0.5,
                    child: TextFormField(
                      //maxLines: 1,
                      //initialValue: productDimension,
                      decoration: new InputDecoration(
                      border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      )),
                        onSaved: (String str){
                          //productDimension = str;
                          //this.specDetails.insert(index, str);
                          _specs[index]['details'] = str;
                        },
                      ),
                  ),
                  Positioned(
                            top: -10,
                            right: -10,
                            child: IconButton(
                              onPressed: () {
                                _removeFromList(context, index);
                                
                              },
                              icon: Icon(Icons.cancel,color: Color(0xFFD3E3FF),size: 24,),
                            ),
                          ),
                ]
              ),
            ],
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }

  _addtoList(BuildContext context,String newSpec){
    setState(() {
      //_specs[]
      this._specs.add({
        "name": newSpec,
        "details":"",
      });
    });
  }

  _removeFromList(BuildContext context,index){
    setState(() {
      this._specs.removeAt(index);
    });
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
        color: Color(0xFFFC0151),
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
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Step 1",
                      style: TextStyle(
                          color: Color(0xFF4B69FF),
                          fontSize: 20.0,
                          fontFamily: "Arial",
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width:20),
                    Center(
                        child: Text(
                          "(1 Out of 4)",
                          style: TextStyle(
                              color: Color(0xff979797),
                              fontWeight: FontWeight.w400,
                              fontSize: 18),
                        ),
                      ),
                  ],
                ),
                  SvgPicture.asset("assets/icons/progress_step_2.svg"),
              ],
            ),
          ),
            SizedBox(height:20),
        Container(
          margin: EdgeInsets.symmetric(horizontal:10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
            children: [
              Row(
                children: [
                  Text('ENTER PRODUCT DETAILS',
                      style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
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
                          blurRadius: 10,
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
                    fontSize: 16.0,
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
                    color: Color(0xFF4B69FF),
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
                              "ENTER MAXIMUM QUANTITY",
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
                        Row(
                          children: [
                            Flexible(child: _buildQuantity()),
                            //SizedBox(width:5),
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
                        "ENTER PRODUCT DESCRIPTION",
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
                        "ENTER PRODUCT SPECIFICATION",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontFamily: "Arial",
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                    ),
                    SizedBox(height: 10.0,),
                    _buildSpecification(),
                    //SizedBox(height: 10,),
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.4,
                          child: TextFormField(
                            decoration: new InputDecoration(
                                hintText: "New Specs",
                            ),
                            onChanged: (String str){
                              newSpec = str;
                            },
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add_box),
                          color: Color(0xFFD3E3FF), 
                          onPressed: () {
                            if(newSpec.isNotEmpty){
                              print(newSpec);
                              _addtoList(context, newSpec);
                            }  
                          },
                          )
                      ],
                    ),
                    SizedBox(height: 10,)
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
                                  //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    "ENTER PICKUP LOCATION",
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
                              print(_specs);
                              //Save all data here!!!!!
                              //_specs list contains all the dynamic list
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              var adData = {
                                "unit": selectedUnit,
                                "name": productName,
                                "description": productDescription,
                                "dimensions": productDimension,
                                "material": productMaterial,
                                "quantity": productQuantity,
                                "weight": productWeight
                              };
                              await prefs.setString("postAnAdData", jsonEncode(adData));
                              Navigator.push(context, new MaterialPageRoute(
                                  builder: (BuildContext context) => new PostAd2() ),
                              );
                            },
                            child: Container(
                                height: 50,
                                margin: EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Color(0xFFFC0151),
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
