import 'package:flutter/material.dart';
import 'package:destock/utils/bg_clip.dart';
import 'package:destock/utils/raised_container.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProfileBuyer extends StatelessWidget {
  ProfileBuyer({
    this.type,
    @required this.profileName,
    @required this.profileEmail,
    @required this.profilePhone,
    @required this.companyName,
    @required this.companyPan,
    @required this.companyGst,
    @required this.companyFactoryAddress,
    @required this.officeAddress,
    @required this.whatYouSell,
    @required this.contactPersonName,
    @required this.contactPersonEmail,
    @required this.contactPersonPhone,
  });
  final String type;
  final String profileName;
  final String profileEmail;
  final String profilePhone;
  final String companyName;
  final String companyPan;
  final String companyGst;
  final String companyFactoryAddress;
  final String officeAddress;
  final String whatYouSell;
  final String contactPersonName;
  final String contactPersonEmail;
  final String contactPersonPhone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFD84764),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(20))),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello ' + this.profileName.split(' ')[0]),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Welcome to your profile",
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      "Become a seller and start de-stocking!",
                      style: TextStyle(
                          fontSize: 13,
                          fontStyle: FontStyle.italic,
                          color: Colors.black),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.account_circle),
                  onPressed: () {},
                  iconSize: 64,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton.icon(
                    onPressed: () {},
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
                FlatButton.icon(
                    onPressed: () {},
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    icon: Icon(Icons.settings),
                    label: Text('Account Settings'))
              ],
            )
          ],
        ),
        toolbarHeight: 150,
      ),
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 100),
            child: BgClip(
              height: 450,
            ),
          ),
          ListView(padding: EdgeInsets.symmetric(vertical: 8.0), children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Personal Details",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(icon: Icon(Icons.edit), onPressed: () {})
                ],
              ),
            ),
            Padding(
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
                              this.profileName,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              this.profileEmail,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              this.profilePhone,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 48),
              height: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/become a seller.png'),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Company Details",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(icon: Icon(Icons.edit), onPressed: () {})
                ],
              ),
            ),
            Padding(
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
                            this.companyName,
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
                            this.companyFactoryAddress,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(8.0),
                      color: Colors.red,
                      height: 200,
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: LatLng(45.521563, -122.677433),
                        ),
                      ),
                    ),
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
                        Container(
                          padding: EdgeInsets.all(8.0),
                          width: 200,
                          child: Text(
                            this.officeAddress,
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
                            "WHAT YOU SELL",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(8.0),
                          width: 200,
                          child: Text(
                            this.whatYouSell,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                  ]),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Contact Person Details",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  IconButton(icon: Icon(Icons.edit), onPressed: () {})
                ],
              ),
            ),
            Padding(
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
                              this.contactPersonName,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              this.contactPersonEmail,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              this.contactPersonPhone,
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 8.0),
          ])
        ],
      ),
    );
  }
}
