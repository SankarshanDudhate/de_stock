import 'package:destock/utils/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:destock/utils/bg_clip.dart';
import 'package:destock/utils/input_card.dart';
import 'package:destock/utils/raised_container.dart';

//needed to make maps work
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';


class EditCompanyDetails extends StatefulWidget {
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
  LatLng location; //use location.latitude and .longitude to push it into database
  GoogleMapController mapController;
  final LatLng _center = const LatLng(45.521563, -122.677433);
  Set<Marker> markerSet = {};
  String _factoryAddress = "Plot No. - 123, Sector – III, Industrial Area, Pithampur, Dist.: Dhar – 454 775, Madhya Pradesh";
  Geolocator locator;
  Marker initMarker;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    locator = Geolocator();
    initMarker = Marker(position: _center);
    markerSet.add(initMarker);
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

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
          initialCenter: LatLng(31.1975844, 29.9598339),
          myLocationButtonEnabled: true,
          layersButtonEnabled: true,
          // countries: ['AE', 'NG'],
        );
        print(loc.toString());
        List<Placemark> currentPlaces = await locator.placemarkFromCoordinates(loc.latLng.latitude, loc.latLng.longitude);
        Placemark place = currentPlaces[0];
        await mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: loc.latLng, zoom: 17)));
        setState(() {
          //markerSet.add( Marker(markerId: null,position: loc.latLng) );
          _factoryAddress = "${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, ${place.administrativeArea}, - ${place.postalCode}";
          location = loc.latLng;
        });
      },
    );
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
                  child: Text(
                    "Edit Company details",
                    style: TextStyle(fontWeight: FontWeight.bold),
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
                                  title: "COMPANY NAME*",
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
                                  title: "PAN NUMBER*",
                                  controller: _panNumberController,
                                  placeholder: "ABCDE 1234F",
                                  subtitle: "Enter company’s PAN number",
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                                InputCard(
                                  title: "GST NUMBER*",
                                  controller: _gstNumberController,
                                  placeholder: "eg. 22 AAAAA 000AA 1Z5",
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                                InputCard(
                                  title: "FACTORY ADDRESS*",
                                  controller: _factoryAddressController,
                                  placeholder:
                                      _factoryAddress,
                                  maxlines: 5,
                                  subtitle:
                                      "Enter your registered company name",
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                                Container(
                                  child: Text("Set your location on map*"),
                                ),
                                Container(
                                  height: 300,
                                  color: Colors.amber,
                                  child: renderMap(),
                                ),
                                SizedBox(
                                  height: 32,
                                ),
                                InputCard(
                                  title: "OFFICE ADDRESS",
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
                      onPressed: () {},
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            color: Color(0xffD84764),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    FlatButton(
                      padding:
                          EdgeInsets.symmetric(horizontal: 32, vertical: 8),
                      color: Color(0xffD84764),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      onPressed: () {},
                      child: Text(
                        'Update',
                        style: TextStyle(color: Colors.white),
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
