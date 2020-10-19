import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:destock/CONSTANTS.dart';
import 'package:destock/GoogleMapWidget.dart';
import 'package:destock/ProductPages/editProductSlider.dart';
import 'package:destock/ProductPages/productPage.dart';
import 'package:destock/ProductPages/productPageSeller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:destock/GoogleMapWidget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class editProduct extends StatefulWidget {
  Map data;

  editProduct({this.data});

  @override
  _editProductState createState() => _editProductState();
}

class _editProductState extends State<editProduct> {
  final GlobalKey<FormState> _formKeyEditProduct = GlobalKey<FormState>();
  final GlobalKey<GoogleMapWidgetState> editProductMapKey =
      GlobalKey(debugLabel: "editProductMapKey");
  final GlobalKey<editProductSliderState> editSliderKey = GlobalKey();
  TextEditingController addressController = new TextEditingController(
      text: '103-104 Pithampur main road near indore, MP');

  Map data;
  LatLng location = LatLng(45.521563, -122.677433);

  String productName = "Cast Iron Gears 15 inch 1050 rounded egdes - PVC";
  String productQuantity = '200';
  String productPrice = '45000';
  String productDescription =
      'Gears can be made of all sorts of materials, including many types of steel, brass, bronze, cast iron, ductile iron, aluminum, powdered metals, and plastics.';
  String productDimension = '46m x 34m x 45m';
  String productWeight = '365 kg';
  String productMaterial = 'Cast iron';
  String selectedUnit = "kg";
  String newSpec;

  var _selectUnit = {"kg", "pieces", "litre"};

  List<String> specName = ['Material', 'Weight', 'Dimensions'];

  List<String> specDetails = ['Cast iron', '365 kg', '46m x 34m x 45m'];
  List<Map<String, String>> _specs = new List();

  @override
  void initState() {
    super.initState();
    data = widget.data;

    productName = data['name'];
    productQuantity = data['maxQty'].toString();
    productPrice = data['price'].toString();
    productDescription = data['details'].toString();
    addressController.text = data['address'];
    selectedUnit = data['unit'];

    _specs.clear();
    var specJson = Map<String, String>.from(jsonDecode(data['specifications']));
    // print( specJson );
    specJson.forEach((key, value) {
      _specs.add({"name": key, "details": value,});
    });

    Map jsonLatLongs = jsonDecode(data['latLongs']);
    location = LatLng(jsonLatLongs['lat'], jsonLatLongs['long']);
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

  Widget _buildUnit() {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.black),
      child: DropdownButtonFormField<String>(
        items: _selectUnit.map((String dropDownStringItem) {
          return DropdownMenuItem<String>(
            value: dropDownStringItem,
            child: Center(
                child: Text(
              dropDownStringItem,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )),
          );
        }).toList(),
        onChanged: (_value) {
          setState(() {
            this.selectedUnit = _value;
            print(selectedUnit);
          });
        },
        hint: Text("Select unit",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        value: selectedUnit,
        // ignore: missing_return
        validator: (String value) {
          if (value == null) {
            return "Required";
          }
        },
        decoration: InputDecoration(
            contentPadding: EdgeInsets.fromLTRB(30, 17, 30, 17),
            filled: true,
            fillColor: Colors.black,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(0),
            )),
      ),
    );
  }

  Widget _buildQuantity() {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(0),
      )),
      initialValue: productQuantity,
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
    int i=0;
    return Container(
      child: Column(
        children: _specs.map<Widget>((spec) => Column(
          children: [
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        spec['name'],
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Stack(children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    child: TextFormField(
                      //maxLines: 1,
                      initialValue: spec['details'],
                      decoration: new InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                      onSaved: (String str) {
                        //productDimension = str;
                        //this.specDetails.insert(index, str);
                        spec['details'] = str;
                      },
                    ),
                  ),
                  Positioned(
                    top: -10,
                    right: -10,
                    child: IconButton(
                      onPressed: () {
                        _removeFromList(context, i++);
                      },
                      icon: Icon(
                        Icons.cancel,
                        color: Color(0xFFD3E3FF),
                        size: 24,
                      ),
                    ),
                  ),
                ]),
              ],
            ),
            SizedBox(
              height: 20,
            )
          ],
        )).toList(),
      ),
    );
  }

  _addtoList(BuildContext context, String newSpec) {
    setState(() {
      //_specs[]
      this._specs.add({
        "name": newSpec,
        "details": "",
      });
    });
  }

  _removeFromList(BuildContext context, index) {
    setState(() {
      this._specs.removeAt(index);
    });
  }

  Widget _buildPickupLocation() {
    return TextFormField(
      maxLines: 4,
      controller: addressController,
      // initialValue: pickupLocation,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(children: [
        Image.asset("assets/images/Group_166.png"),
        Form(
          key: _formKeyEditProduct,
          child: Column(children: [
            SizedBox(
              height: 60,
            ),
            buildHeader(),
            SizedBox(
              height: 30,
            ),
            buildProductNameContainer(),
            editProductSlider(imageList: List<String>.from(data['images']), key: editSliderKey,),
            //SizedBox(height: 20,),
            buildAvailabilityAndQuantityContainer(),
            buildPriceContainer(),
            buildDescriptionContainer(),
            buildSpecificationsContainer(context),
            buildPickupLocationContainer(),
            SizedBox(
              height: 10,
            ),
            buildMapContainer(),
            SizedBox(height: 20),
            buildUpdateButton(context),
            SizedBox(height: 20)
          ]),
        ),
      ]),
    ));
  }

  Widget buildUpdateButton(BuildContext context) {
    return GestureDetector(
            onTap: () async {
              // if (!_formKeyEditProduct.currentState.validate()) {
              //   Get.snackbar("Invalid data", "Please enter valid data");
              //   return;
              // }
              _formKeyEditProduct.currentState.save();

              //convert list of maps to map
              Map prodSpecs = {};
              _specs.forEach((element) {
                prodSpecs[element["name"]] = element["details"];
              });
              print("Specs map: \n" + prodSpecs.toString());

              Map latLongs = {
                "lat": location.latitude,
                "long": location.longitude
              };

              // print("Unit: "+selectedUnit);
              String prodId = (data['id'] == null) ? '1' : data['id'].toString();

              List imageList = editSliderKey.currentState.allFiles;
              log("Images: "+imageList.toString());
              List imageStrings = []; //Contains base64 of chosen images
              File imageFile;
              var fileBytes,fileString;

              for ( var image in imageList ) {
                if(image['type'] == 'network') {
                  imageStrings.add(image['path']);
                } else {
                  imageFile = new File(image['path'].toString());
                  fileBytes = await imageFile.readAsBytesSync();
                  fileString = base64Encode(fileBytes);
                  imageStrings.add(fileString);
                }
              }

              SharedPreferences prefs = await SharedPreferences.getInstance();
              String userId = (prefs.getString("userId") == null) ? '2' : prefs.getString("userId");
              String url = localhostAddress + "/products/" + prodId + '/edit/';
              var resp = await http.post(url, body: {
                'user_id': userId,
                'name': productName,
                'description': productDescription,
                'price': productPrice,
                'available': true.toString(),
                'quantity': productQuantity,
                'unit': selectedUnit,
                'specifications': jsonEncode(prodSpecs),
                'location_address': addressController.text,
                'location_latLong': jsonEncode(latLongs),
                'images': jsonEncode(imageStrings),
              });

              var respJson = jsonDecode(resp.body);
              print(respJson["Status"]);

              if(respJson["Status"] == "Success")
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => productPageSeller()));
              else
                Get.snackbar("Error!", respJson["Details"]);
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
                child: Text("UPDATE CHANGES",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          );
  }

  Container buildMapContainer() {
    return Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                          "Edit Location on Map",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
                              fontFamily: "Arial",
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    GoogleMapWidget(
                      picker: true,
                      initialLocation: location,
                      key: editProductMapKey,
                      onResult: (LatLng loc, String address) {
                        addressController.text = address;
                        location = loc;
                      },
                    ),
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
              ));
  }

  Container buildPickupLocationContainer() {
    return Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                              fontSize: 18.0,
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
              ));
  }

  Container buildSpecificationsContainer(BuildContext context) {
    return Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                              fontSize: 18.0,
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
                    Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: TextFormField(
                            decoration: new InputDecoration(
                              hintText: "New Specs",
                            ),
                            onChanged: (String str) {
                              newSpec = str;
                            },
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.add_box),
                          color: Color(0xFFD3E3FF),
                          onPressed: () {
                            if (newSpec.isNotEmpty) {
                              print(newSpec);
                              _addtoList(context, newSpec);
                            }
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ));
  }

  Container buildDescriptionContainer() {
    return Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                          "EDIT PRODUCT DESCRIPTION",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.0,
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
              ));
  }

  Container buildPriceContainer() {
    return Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                    SizedBox(
                      height: 10.0,
                    ),
                    _buildProductPrice(),
                    SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      children: [
                        Text(
                          'Disclose price to customer?',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        //Switch > yes / no
                      ],
                    ),
                  ],
                ),
              ));
  }

  Container buildAvailabilityAndQuantityContainer() {
    return Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(children: [
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
                            Text(
                              'Availability of the Product',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        //Switch > Available / Out of Stock
                        SizedBox(
                          height: 30.0,
                        ),
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
            ]),
          );
  }

  Container buildProductNameContainer() {
    return Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 4),
                      blurRadius: 10,
                      color: Colors.black.withOpacity(.16),
                    ),
                  ]),
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
                          "PRODUCT NAME",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.0,
                              fontFamily: "Open Sans",
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "This cannot be edited.",
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 10.0,
                            fontFamily: "Open Sans",
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        SizedBox(
                          width: 5,
                        ),
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
              ));
  }

  Padding buildHeader() {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.arrow_back_ios),
                SizedBox(
                  width: 20,
                ),
                Flexible(
                    child: Text(
                  'EDIT PRODUCT DETAILS',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                )),
                //Icon(Icons.share)
                Container()
              ],
            ),
          );
  }
}
