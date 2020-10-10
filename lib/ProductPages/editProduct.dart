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
  String newSpec;
  bool availablity = true;
  bool disclosePrice = true;

  var _selectUnit = {
    "kg",
    "pieces",
    "litre"
  };

List<String> specName = [
  'Material','Weight','Dimensions'
];

List<String> specDetails = ['Cast iron','365 kg','46m x 34m x 45m'];
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
      initialValue: productName,
      enabled: false,
      decoration: new InputDecoration(
          //labelText: productName,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          // disabledBorder: OutlineInputBorder(
          //   borderRadius: BorderRadius.circular(5),
          //   borderSide: BorderSide(color: Color(0xFFFC0151)),
          // )
          ),
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
                      initialValue: _specs[index]['details'],
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
                                  Row(
                                    children: [
                                      Container(
                                        //width: 220,
                                        //margin: EdgeInsets.symmetric(horizontal:40),
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
                                                  this.availablity = true;
                                                });
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(horizontal:20, vertical:10),
                                                decoration: BoxDecoration(
                                                  color : availablity == true ? Color(0xFF4B69FF) : Color(0xFFFFFFFF),
                                                  // border: Border.all( 
                                                  //   color : Color(0xFFFFFF),
                                                  // ),
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(30)
                                                  ),
                                                ),
                                                child: Text('Available', style: availablity == true ? TextStyle( fontSize : 20, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)) : TextStyle( fontSize: 18 , color: Color(0xFF979797)))
                                                ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                setState((){
                                                  this.availablity = false;
                                                });
                                              },
                                              child: Container(
                                                padding: EdgeInsets.symmetric(horizontal:20, vertical:10),
                                                decoration: BoxDecoration(
                                                  color : availablity == false ? Color(0xFF000000) : Color(0xFFFFFFFF),
                                                  // border: Border.all( 
                                                  //   color : Color(0xFFFFFF),
                                                  // ),
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(30)
                                                  ),
                                                ),
                                                child: Text('Out of Stock', style: availablity == false ? TextStyle( fontSize : 20, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)) : TextStyle( fontSize: 18 , color: Color(0xFF979797)))
                                                
                                                ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                        //SizedBox(width:10),
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Disclose price to customer?', style: TextStyle(fontSize:16,fontWeight:FontWeight.bold),),
                                    Container(
                                      //width: 220,
                                      //margin: EdgeInsets.symmetric(horizontal:2),
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
                                              child: Text('NO', style: disclosePrice == false ? TextStyle( fontSize : 16, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)) : TextStyle( fontSize: 14 , color: Color(0xFFCBCBCB)))
                                              
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
                                              child: Text('YES', style: disclosePrice == true ? TextStyle( fontSize : 16, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)) : TextStyle( fontSize: 14 , color: Color(0xFFCBCBCB)))
                                              ),
                                          )
                                        ],
                                      ),
                                  ),
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
                                              color: Color(0xFFFC0151),
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