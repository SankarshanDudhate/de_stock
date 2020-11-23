import 'dart:convert';
import 'dart:developer';

import 'package:destock/GoogleMapWidget.dart';
import 'package:destock/profile/edit_contact_person_details.dart';
import 'package:destock/profile/my_profile.dart';
import 'package:destock/utils/onOffSwitchSlider.dart';
import 'package:destock/utils/profile_header.dart';
import 'package:destock/validatons.dart';
import 'package:flutter/material.dart';
import 'package:destock/utils/bg_clip.dart';
import 'package:destock/utils/input_card.dart';
import 'package:destock/utils/raised_container.dart';
import 'package:get/get.dart';

//needed to make maps work
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditCompanyDetails extends StatefulWidget {
  String companyName = '';
  String companyPan = '';
  String companyGst = '';
  String companyFactoryAddress = '';
  var factoryLatLongs;
  String officeAddress = '';
  String whatYouSell = '';
  String contactPersonName;
  String contactPersonEmail;
  String contactPersonPhone;

  EditCompanyDetails({Key key, this.companyName, this.companyPan, this.companyGst, this.companyFactoryAddress, this.officeAddress, this.factoryLatLongs, this.whatYouSell, this.contactPersonName='', this.contactPersonEmail='', this.contactPersonPhone=''}) :super(key: key);

  @override
  _EditCompanyDetailsState createState() => _EditCompanyDetailsState();
}

class _EditCompanyDetailsState extends State<EditCompanyDetails> {
  final _formKey = GlobalKey<FormState>();
  final _companyNameController = TextEditingController();
  final _panNumberController = TextEditingController();
  final _gstNumberController = TextEditingController();
  final _factoryAddressController = TextEditingController();
  final _officeAddressController = TextEditingController();
  final _sellController = TextEditingController();

  //map variables
  LatLng
      location; //use location.latitude and .longitude to push it into database
  GoogleMapController mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);
  Set<Marker> markerSet = {};
  String _factoryAddress =
      "Plot No. - 123, Sector – III, Industrial Area, Pithampur, Dist.: Dhar – 454 775, Madhya Pradesh";
  Geolocator locator;
  Marker initMarker;

  Widget renderMap() {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 17.0,
      ),
      // markers: markerSet, //this throws error so no markers for now
      onTap: (LatLng latlong) async {
        LocationResult loc = await showLocationPicker(
          context, "AIzaSyBc6qcBEICmGINDtMUTqewxzylvhOCw0Eo",
          // initialCenter: LatLng(31.1975844, 29.9598339),
          initialCenter: location,
          myLocationButtonEnabled: true,
          layersButtonEnabled: true,
          // countries: ['AE', 'NG'],
        );
        print(loc.toString());
        List<Placemark> currentPlaces = await locator.placemarkFromCoordinates(
            loc.latLng.latitude, loc.latLng.longitude);
        Placemark place = currentPlaces[0];
        await mapController.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(target: loc.latLng, zoom: 17)));
        setState(() {
          //markerSet.add( Marker(markerId: null,position: loc.latLng) );
          _factoryAddressController.text =
              ("${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, ${place.administrativeArea}, - ${place.postalCode}");
          location = loc.latLng;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _companyNameController.text = widget.companyName;
    _panNumberController.text = widget.companyPan;
    _gstNumberController.text = widget.companyGst;
    _factoryAddressController.text = widget.companyFactoryAddress;
    _officeAddressController.text = widget.officeAddress;
    _sellController.text = widget.whatYouSell;
    location = LatLng(double.parse(widget.factoryLatLongs['lat']), double.parse(widget.factoryLatLongs['long']));
    locator = Geolocator();
    initMarker =
        Marker(markerId: MarkerId("current_location"), position: _center);
    markerSet.add(initMarker);
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ProfileHeader(),
      body: ListView(
        children: [
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Edit Company Details ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                        TextSpan(
                            text: " ( 2/3 ) ",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 10,
                            ))
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24.0),
                        child: BgClip(
                          height: 450,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: RaisedContainer(
                          child: Padding(
                            padding: const EdgeInsets.all(24.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                InputCard(
                                  title: "COMPANY NAME",
                                  controller: _companyNameController,
                                  placeholder:
                                      "Mittal steel corp near indore pvt ltd",
                                  subtitle:
                                      "Enter your registered company name",
                                ),
                                SizedBox(
                                  height: 24,
                                ),
                                InputCard(
                                  title: "PAN NUMBER",
                                  controller: _panNumberController,
                                  placeholder: "ABCDE 1234F",
                                  subtitle: "Enter company’s PAN number",
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                                InputCard(
                                  title: "GST NUMBER",
                                  controller: _gstNumberController,
                                  placeholder: "eg. 22 AAAAA 000AA 1Z5",
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                                InputCard(
                                  title: "FACTORY ADDRESS",
                                  controller: _factoryAddressController,
                                  placeholder:
                                      "Plot No. - 123, Sector – III, Industrial Area, Pithampur, Dist.: Dhar – 454 775, Madhya Pradesh",
                                  maxlines: 5,
                                  subtitle:
                                      "Enter your registered company name",
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                                // Container(
                                //   child: Text("Set your location on map", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
                                // ),
                                RichText(
                                  text: TextSpan(
                                    text: "Set your location on map",
                                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
                                    children: [
                                      TextSpan(text: '*', style: TextStyle(color: Colors.red)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8,),
                                Container(
                                  height: 300,
                                  color: Colors.amber,
                                  // child: renderMap(), //TODO change it to user GoogleMapWidget class that we created
                                  child: GoogleMapWidget(picker: true, initialLocation: location, onResult: (LatLng loc, String address){},), //TODO change it to user GoogleMapWidget class that we created
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 280,
                                      child: RichText(
                                        text: TextSpan(
                                          text: "OFFICE ADDRESS",
                                          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                                          children: [
                                            TextSpan(text: '*', style: TextStyle(color: Colors.red)),
                                          ],
                                        ),
                                      ),
                                    ),
                                    onOffSwitchSlider(onTap: (bool state) {
                                      if(state) {
                                        _officeAddressController.text = _factoryAddressController.text;
                                      } else {
                                        _officeAddressController.text = '';
                                      }
                                    }),
                                  ],
                                ),
                                InputCard(
                                  // title: "OFFICE ADDRESS",
                                  controller: _officeAddressController,
                                  placeholder:
                                      "Plot No. - 123, Sector – III, Industrial Area, Pithampur, Dist.: Dhar – 454 775, Madhya Pradesh",
                                  maxlines: 5,
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                                InputCard(
                                  title: "WHAT DO YOU SELL?",
                                  controller: _sellController,
                                  placeholder:
                                      "we sell all types of steel goods which include Steel, flat steel products, coated steel, tubes and pipes.",
                                  maxlines: 5,
                                  isRequired: false,
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      onPressed: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => Profile()));
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            color: Color(0xffD84764),
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    FlatButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                      color: Color(0xffD84764),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      onPressed: () async {
                        String companyName = _companyNameController.text;
                        String panNumber = _panNumberController.text;
                        String gstNumber = _gstNumberController.text;
                        String factoryAddreess = _factoryAddressController.text;
                        String officeAddreess = _officeAddressController.text;
                        String productsSold = _sellController.text;

                        if (!validatePan(panNumber)) {
                          // print("Please enter a valid name!");
                          Get.snackbar("Invalid details",
                              "Please enter a valid pan Number!");
                          return;
                        }
                        if (!validateGST(gstNumber)) {
                          // print("Please enter a valid name!");
                          Get.snackbar("Invalid details",
                              "Please enter a valid GST Number!");
                          return;
                        }

                        SharedPreferences prefs = await SharedPreferences.getInstance();

                        //TODO implement the latch for factory and office address to be same and make changes accordingly
                        Map<String, dynamic> profileData = jsonDecode(prefs.getString("profileEditDetails"));
                        profileData["company_edited"] = true.toString();
                        profileData["company_name"] = companyName;
                        profileData["panNo"] = panNumber;
                        profileData["gstNo"] = gstNumber;
                        profileData["factory_address"] = factoryAddreess;
                        profileData["factory_lat"] = location.latitude.toString();
                        profileData["factory_long"] = location.longitude.toString();
                        profileData["office_address"] = officeAddreess;
                        profileData["products_sold"] = productsSold;

                        prefs.setString(
                            "profileEditDetails", jsonEncode(profileData));
                        log("Contact Person Name: ${widget.contactPersonName}\n");
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EditContactPersonDetails(contactPersonName: widget.contactPersonName, contactPersonEmail:  widget.contactPersonEmail, contactPersonPhone: widget.contactPersonPhone,)));
                      },
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }
}
