import 'package:destock/ProductPages/editProductSlider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class editProduct extends StatefulWidget {
  @override
  _editProductState createState() => _editProductState();
}

class _editProductState extends State<editProduct> {

  final GlobalKey<FormState> _formKeyEditProduct = GlobalKey<FormState>();

  String productName =  "Cast Iron Gears 15 inch 1050 rounded egdes - PVC";   
  String productQuantity = '200';
  String productPrice = '45,000';
  String productDescription = 'Gears can be made of all sorts of materials, including many types of steel, brass, bronze, cast iron, ductile iron, aluminum, powdered metals, and plastics.';  
  String productDimension = '46m x 34m x 45m';
  String productWeight = '365 kg';
  String productMaterial = 'Cast iron';
  String pickupLocation = '103-104 Pithampur main road near indore, MP';
  String selectedUnit; 

  var _selectUnit = {
    "kg",
    "pieces",
    "litre"
  };

  Widget _buildProductName() {
    return TextField(
      maxLines: 2,
      enabled: false,
      decoration: new InputDecoration(
          labelText: productName,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          )),
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

  Widget _buildQuantity(){
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          )
      ),
      initialValue: productQuantity,
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

   Widget _buildProductPrice() {
    return TextFormField(
      maxLines: 1,
      initialValue: productPrice,
      decoration: new InputDecoration(
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

   Widget _buildProductDescription() {
    return TextFormField(
      maxLines: 4,
      initialValue: productDescription,
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

  Widget _buildSpecification() {
    return Column(
      children:[
        Row(
          //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            Container(
              width: MediaQuery.of(context).size.width*0.3,
              child: Text("Dimension",style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0,
                          fontFamily: "Arial",
                          fontWeight: FontWeight.bold),
                    ),
            ),
            //SizedBox(width:30),
            Container(
              width: MediaQuery.of(context).size.width*0.5,
              child: TextFormField(
                //maxLines: 1,
                initialValue: productDimension,
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
            Container(
              width: MediaQuery.of(context).size.width*0.3,
              child: Text("Weight",style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: "Arial",
                          fontWeight: FontWeight.bold),
                    ),
            ),
            //SizedBox(width:30),
            Container(
              width: MediaQuery.of(context).size.width*0.5,
              child: TextFormField(
                //maxLines: 1,
                initialValue: productWeight,
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
          //mainAxisAlignment: MainAxisAlignment.start,
          children:[
            Container(
              width: MediaQuery.of(context).size.width*0.3,
              child: Text("Material",style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontFamily: "Arial",
                          fontWeight: FontWeight.bold),
                    ),
            ),
            //SizedBox(width:30),
            Container(
              width: MediaQuery.of(context).size.width*0.5,
              child: TextFormField(
                //maxLines: 1,
                initialValue: productMaterial,
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

  Widget _buildPickupLocation() {
    return TextFormField(
      maxLines: 4,
      initialValue: pickupLocation,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset("assets/images/Group_166.png"),
            Form(
              key: _formKeyEditProduct,
               child: Column(
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
                  Container(
                    margin: EdgeInsets.symmetric(horizontal:20),
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
                    editProductSlider(),
                    //SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
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
                                  Row(
                                    children: [
                                      Text('Availability of the Product', style: TextStyle(fontSize:16,fontWeight:FontWeight.bold),),
                                    ],
                                  ),
                                  SizedBox(height: 10.0,),
                                  //Switch > Available / Out of Stock
                                  SizedBox(height: 30.0,),
                                  Row(
                                    children: [
                                      Text(
                                        "EDIT QUANTITY",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 18.0,
                                            fontFamily: "Arial",
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10.0,),
                                  Row(
                                    children: [
                                      Flexible(child: _buildQuantity()),
                                      //SizedBox(width:5),
                                      Flexible(child: _buildUnit())
                                    ],
                                  ),

                                ],
                              ),
                             )
                            ),
                          ]
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal:20,vertical: 20),
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
                            padding: const EdgeInsets.symmetric(horizontal:20,vertical: 20),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: [
                                    Text(
                                      "EDIT SELLING PRICE",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0,
                                          fontFamily: "Arial",
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.0,),
                                _buildProductPrice(),
                                SizedBox(height: 30.0,),
                                Row(
                                  children: [
                                    Text('Disclose price to customer?', style: TextStyle(fontSize:16,fontWeight:FontWeight.bold),),
                                    //Switch > yes / no
                                  ],
                                ),
                              ],
                            ),
                            )
                          ),
                          Container(
                              margin: EdgeInsets.symmetric(horizontal:20,vertical:20),
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
                                      SizedBox(height: 10.0,),
                                      Row(
                                      children: [
                                        Text(
                                          "EDIT PRODUCT DESCRIPTION",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18.0,
                                              fontFamily: "Arial",
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                      ),
                                      SizedBox(height: 10.0,),
                                      _buildProductDescription(),
                                      SizedBox(height: 10,),
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
                                Container(
                                  margin: EdgeInsets.symmetric(horizontal:20,vertical:20),
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
                                          SizedBox(height: 10.0,),
                                          Row(
                                          children: [
                                            Text(
                                              "ENTER PRODUCT SPECIFICATION",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18.0,
                                                  fontFamily: "Arial",
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                          ),
                                          SizedBox(height: 10.0,),
                                          _buildSpecification(),
                                          SizedBox(height: 10,),
                                        ],
                                      ),
                                  )),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal:20,vertical:20),
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
                                            SizedBox(height: 10.0,),
                                            Row(
                                              //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                            children: [
                                              Text(
                                                "ENTER PICKUP LOCATION",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 18.0,
                                                    fontFamily: "Arial",
                                                    fontWeight: FontWeight.bold),
                                              ),
                                            ],
                                            ),
                                            SizedBox(height: 10.0,),
                                            _buildPickupLocation(),
                                            SizedBox(height: 10,),
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
                                      SizedBox(height:20),
                                      GestureDetector(
                                        onTap: () {
                                          if(!_formKeyEditProduct.currentState.validate()){
                                            return;
                                          }
                                          _formKeyEditProduct.currentState.save();
                                          //Enter Data here
                                        },
                                        child: Container(
                                          width: 280,
                                          height: 60,
                                          margin: EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(30),
                                              color: Colors.redAccent,
                                          ),
                                          child: Center(
                                            child: Text("UPDATE CHANGES", style: TextStyle(color: Colors.white, fontSize: 20,fontWeight: FontWeight.bold)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height:20)
                        ]
                      ),
            ),
          ]
       ),
      )
    );
  }
}