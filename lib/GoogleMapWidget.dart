import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_map_location_picker/google_map_location_picker.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

typedef MapResultCallback = void Function(LatLng location, String address);

class GoogleMapWidget extends StatefulWidget {
  bool picker;

  GoogleMapWidget({Key key, this.picker, this.onResult, this.initialLocation}) : super(key: key);

  MapResultCallback onResult;
  LatLng initialLocation;

  @override
  State<StatefulWidget> createState() => new GoogleMapWidgetState();
}

class GoogleMapWidgetState extends State<GoogleMapWidget> {

  //map variables
  LatLng
  location; //use location.latitude and .longitude to push it into database
  GoogleMapController mapController;
  LatLng _center = LatLng(45.521563, -122.677433);
  Set<Marker> markerSet = {};
  Geolocator locator;
  Marker initMarker;

  String addressString;

  @override
  void initState() {
    super.initState();
    // log("Initial: "+widget.initialLocation.toString());
    setState(() {
      if(widget.initialLocation != null) _center = widget.initialLocation;
      locator = Geolocator();
      initMarker =
          Marker(markerId: MarkerId("initial_location"), position: _center);
      markerSet.add(initMarker);
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Widget renderMap({bool picker}) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: _center,
        zoom: 17.0,
      ),
      markers: markerSet, //this throws error so no markers for now
      onTap: pickLocation,
    );
  }

  pickLocation(LatLng latlong) async {
    if(widget.picker == false || widget.picker == null) return;
    LocationResult loc = await showLocationPicker(
        context, "AIzaSyBc6qcBEICmGINDtMUTqewxzylvhOCw0Eo",
        initialCenter: _center,
        myLocationButtonEnabled: true,
        layersButtonEnabled: true,
        // countries: ['AE', 'NG'],
      );
      // print(loc.toString());
      List<Placemark> currentPlaces = await locator.placemarkFromCoordinates(
          loc.latLng.latitude, loc.latLng.longitude);
      Placemark place = currentPlaces[0];
      await mapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: loc.latLng, zoom: 17)));

      //markerSet.add( Marker(markerId: null,position: loc.latLng) );
      addressString =
      ("${place.subLocality}, ${place.locality}, ${place.subAdministrativeArea}, ${place.administrativeArea}, - ${place.postalCode}");
      location = loc.latLng;

      widget.onResult(location,addressString);
    //  TODO add marker on selected location
    }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: renderMap(),
    );
  }

}