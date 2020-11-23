import 'dart:async';
import 'dart:convert';
import 'dart:developer';

import 'package:destock/CONSTANTS.dart';
import 'package:destock/GoogleMapWidget.dart';
import 'package:destock/account_setting/account_setting.dart';
import 'package:destock/profile/edit_company_details.dart';
import 'package:destock/profile/edit_contact_person_details.dart';
import 'package:destock/profile/edit_personal_details.dart';
import 'package:destock/profile/profile_setup_1.dart';
import 'package:destock/utils/textSwitchSlider.dart';
import 'package:destock/widgets/home.dart';
import 'package:flutter/material.dart';
import 'package:destock/utils/bg_clip.dart';
import 'package:destock/utils/profile_header.dart';
import 'package:destock/utils/raised_container.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

typedef onPressedCallback = void Function();

class Profile extends StatelessWidget {
  Profile({this.type = 'buyer'});

  //TODO make this page dynamic, its all static right now
  String profileName = "Sankarshan Dudhate";
  String profileEmail;
  String profilePhone;
  String profilePicturePath = '';
  String companyName = '';
  String companyPan = '';
  String companyGst = '';
  String companyFactoryAddress = '';
  var factoryLatLongs;
  String officeAddress = '';
  String whatYouSell = '';
  String contactPersonName = '';
  String contactPersonEmail = '';
  String contactPersonPhone = '';
  String type;

  Future getProfileData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId =
        (prefs.getString('user_id') == null) ? '1' : prefs.getString('user_id');
    String url = localhostAddress + "/users/$userId/profile/";
    // http.Response resp;
    // var getFuture = http.get(url).then((value) {return value;}).catchError((e) {
    //   log("Error: "+e.toString());
    // });//.timeout(Duration(seconds: 2), onTimeout: () {
    //   throw new TimeoutException("GET Timed out!");
    //   log("Timeout!");
    //   return http.Response("Error occured", 200);
    //   return "Error occured!";
    // });
    var resp = await http.get(url);
    var respJson = jsonDecode(resp.body);
    // log("resp.body: "+respJson.toString());
    return respJson;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FutureBuilder(
        future: getProfileData(),
        builder: (conext, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          if (snapshot.hasError)
            return Container(
              child: Text("Error occured!"),
            );
          log("Snapshot: " + snapshot.data.toString());
          var data = snapshot.data;
          profileName = data['user_name'];
          profileEmail = data['user_email'];
          profilePhone = data['user_phoneNo'];
          profilePicturePath = data['user_image'];
          if (data['company_exists']) {
            // navigating here causes error... unsafe to do so
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => profileSetupPersonalDetails()));
            companyName = data['company_name'];
            companyPan = data['panNo'];
            companyGst = data['gstNo'];
            companyFactoryAddress = data['factory_address'];
            officeAddress = data['office_address'];
            factoryLatLongs = jsonDecode(data['factory_latLong']);
            whatYouSell = data['products_sold'];
            // log("Factory latlong: "+factoryLatLongs['lat']);
          }
          if (data['contact_person_exists']) {
            contactPersonName = data['contact_person_name'];
            contactPersonEmail = data['contact_person_email'];
            contactPersonPhone = data['contact_person_phoneNo'];
          }
          return Scaffold(
            // appBar: (this.type == 'buyer') ? appBarBuyer(context) : appBarSeller(context),
            appBar: (companyName.isNotEmpty)
                ? appBarComplete(context)
                : appBarIncomplete(context),
            body: Stack(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 100),
                  child: BgClip(
                    height: 450,
                  ),
                ),
                ListView(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    children: [
                      Column(
                        children: [
                          buildTitleRow(
                              title: "Personal Details",
                              onIconPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        EditPersonalProfile(name: profileName, email: profileEmail, phoneNo: profilePhone, companyName: companyName, companyPan: companyPan, companyGst: companyGst, companyFactoryAddress: companyFactoryAddress, factoryLatLongs: factoryLatLongs, officeAddress: officeAddress, whatYouSell: whatYouSell, contactPersonName: contactPersonName, contactPersonEmail:  contactPersonEmail, contactPersonPhone: contactPersonPhone,)));
                              }),
                          buildPersonalDetails(),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 48),
                        color: Colors.amber,
                        height: 150,
                      ),
                      Column(
                        children: [
                          buildTitleRow(
                              title: "Company Details",
                              onIconPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        EditCompanyDetails(companyName: companyName, companyPan: companyPan, companyGst: companyGst, companyFactoryAddress: companyFactoryAddress, factoryLatLongs: factoryLatLongs, officeAddress: officeAddress, whatYouSell: whatYouSell, contactPersonName: contactPersonName, contactPersonEmail:  contactPersonEmail, contactPersonPhone: contactPersonPhone,)));
                              }),
                          buildCompanyDetails(context),
                        ],
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Column(
                        children: [
                          buildTitleRow(
                              title: "Contact Person Details",
                              onIconPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        EditContactPersonDetails(contactPersonName: contactPersonName, contactPersonEmail:  contactPersonEmail, contactPersonPhone: contactPersonPhone,)));
                              }),
                          buildContactPersonDetails(),
                        ],
                      ),
                      SizedBox(height: 8.0),
                    ])
              ],
            ),
          );
        },
      ),
    );
  }

  Padding buildPersonalDetails() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: RaisedContainer(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "NAME",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "E-MAIL ID",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "PHONE NO.",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      profileName,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      profileEmail,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      profilePhone,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding buildCompanyDetails(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: RaisedContainer(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: 100,
                  child: Text(
                    "NAME",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  width: 200,
                  child: Text(
                    companyName,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: 100,
                  child: Text(
                    "PAN NO.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  width: 200,
                  child: Text(
                    this.companyPan,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: 100,
                  child: Text(
                    "GST NO.",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  width: 200,
                  child: Text(
                    this.companyGst,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: 100,
                  child: Text(
                    "FACTORY ADDRESS",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  width: 200,
                  child: Text(
                    companyFactoryAddress,
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ],
            ),
            (companyName.isNotEmpty)
                ? Container(
                    height: 300,
                    color: Colors.amber,
                    child: GoogleMapWidget(
                      picker: false,
                      initialLocation: LatLng(double.parse(factoryLatLongs['lat']), double.parse(factoryLatLongs['long'])),
                    ))
                : Container(),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: 100,
                  child: Text(
                    "OFFICE ADDRESS",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                // (officeAddress.isNotEmpty) ?
                    Container(
                        padding: EdgeInsets.all(8.0),
                        width: 200,
                        child: Text(
                          officeAddress,
                          // style: TextStyle(color: Colors.blue),
                        ),
                      ),
                //     :
                // GestureDetector(
                //   onTap: () {
                //     Navigator.of(context).push(MaterialPageRoute(
                //         builder: (context) => EditCompanyDetails()));
                //   },
                //   child: Container(
                //     padding: EdgeInsets.all(8.0),
                //     width: 200,
                //     child: Text(
                //       "update",
                //       style: TextStyle(color: Colors.blue),
                //     ),
                //   ),
                // ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  width: 100,
                  child: Text(
                    "WHAT YOU SELL",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                // (whatYouSell.isNotEmpty) ?
                    Container(
                        padding: EdgeInsets.all(8.0),
                        width: 200,
                        child: Text(
                          whatYouSell,
                          // style: TextStyle(color: Colors.blue),
                        ),
                      ),
                //     :
                // GestureDetector(
                //   onTap: () {
                //     Navigator.of(context).push(MaterialPageRoute(
                //         builder: (context) => EditCompanyDetails()));
                //   },
                //   child: Container(
                //     padding: EdgeInsets.all(8.0),
                //     width: 200,
                //     child: Text(
                //       "update",
                //       style: TextStyle(color: Colors.blue),
                //     ),
                //   ),
                // ),
              ],
            ),
            SizedBox(
              height: 8.0,
            ),
          ]),
        ),
      ),
    );
  }

  Padding buildContactPersonDetails() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: RaisedContainer(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "NAME",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "E-MAIL ID",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "PHONE NO.",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      contactPersonName,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      contactPersonEmail,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      contactPersonPhone,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitleRow({String title, onPressedCallback onIconPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              onIconPressed();
            },
          )
        ],
      ),
    );
  }

  Widget appBarComplete(BuildContext context) {
    return AppBar(
      //TODO change app bar if  type is 'seller'
      // leading: SizedBox(width: 1, height: 1,),
      automaticallyImplyLeading: false,
      backgroundColor: Color(0xFFD84764),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Hello ' + this.profileName.split(' ')[0],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_city,
                          // size: 20,
                        ),
                        Container(
                          width: 200,
                          // padding: EdgeInsets.all(4),
                          child: Text(
                            "this.companyName",
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.location_on,
                          // size: 20,
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 8),
                          width: 200,
                          child: Text(
                            "this.companyFactoryAddress",
                            maxLines: 3,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                        )
                      ],
                    )
                    // SizedBox(
                    //   height: 8,
                    // ),
                    // Text(
                    //   "Welcome to your profile",
                    //   style: TextStyle(fontSize: 16),
                    // ),
                    // SizedBox(
                    //   height: 2,
                    // ),
                    // Text(
                    //   "Become a seller and start de-stocking!",
                    //   style: TextStyle(
                    //       fontSize: 15,
                    //       fontStyle: FontStyle.italic,
                    //       color: Colors.black),
                    // ),
                  ],
                ),
              ),
              // Image.asset(
              //   "assets/images/user_image_1.png",
              //   width: 96,
              //   height: 96,
              // ),
              Image.network(
                localhostAddress + this.profilePicturePath,
                width: 96,
                height: 96,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 25,
                ),
                // padding: EdgeInsets.only(top: 30, ),
                width: 160,
                height: 50,
                child: FlatButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EditPersonalProfile()));
                    },
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    icon: Icon(
                      Icons.edit,
                      color: Color(0xffD84764),
                    ),
                    label: Text(
                      'Edit Profile',
                      style: TextStyle(color: Color(0xffD84764)),
                    )),
              ),
              Container(
                // padding: EdgeInsets.only(top: 30,),
                margin: EdgeInsets.only(
                  top: 25,
                ),
                width: 220,
                height: 50,
                child: FlatButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => AccountSettings()));
                    },
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    icon: Icon(Icons.settings),
                    label: Text('Account Settings')),
              )
            ],
          )
        ],
      ),
      toolbarHeight: 280,
    );
  }

  Widget appBarIncomplete(BuildContext context) {
    return AppBar(
      //TODO change app bar if  type is 'seller'
      // leading: SizedBox(width: 1, height: 1,),
      automaticallyImplyLeading: false,
      backgroundColor: Color(0xFFD84764),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 0,
                    ),
                    Text(
                      'Hello ' + this.profileName.split(' ')[0],
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 250,
                          // padding: EdgeInsets.all(4),
                          child: Text(
                            "Complete your profile and start selling your products!",
                            maxLines: 3,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              // Image.asset(
              //   "assets/images/user_image_1.png",
              //   width: 96,
              //   height: 96,
              // ),
              Image.network(
                localhostAddress + this.profilePicturePath,
                width: 96,
                height: 96,
              )
            ],
          ),
        ],
      ),
      toolbarHeight: 250,
    );
  }
}
