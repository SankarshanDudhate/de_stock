import 'dart:convert';
import 'dart:developer';

import 'package:destock/CONSTANTS.dart';
import 'package:destock/GoogleMapWidget.dart';
import 'package:destock/ProductPages/ImageCarousel.dart';
import 'package:destock/ProductPages/editProduct.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class productPageSeller extends StatefulWidget {
  @override
  _productPageSellerState createState() => _productPageSellerState();
}

class _productPageSellerState extends State<productPageSeller> {
  String productName = 'Cast Iron gears 15 inch 1050 rounded edges- PVC ';
  String productPrice = '₹ 89,000';
  String productDetails =
      'Gears can be made of all sorts of materials, including many types of steel, brass, bronze, cast iron, ductile iron, aluminum, powdered metals, and plastics.';
  String productQty = '150 kgs';
  String productCategory = 'Cutting tools';
  String publishDate = 'August 19, 2020';
  final String views = '112';
  final String favorite = '19';
  final String enquiries = '45';

  List<String> specName = [
    'Brand',
    'Model',
    'Material',
    'Weight',
    'Dimensions',
    'Capacity'
  ];

  List<String> specDetails = [
    'Mittal steels',
    'specification comes here',
    'Copper and Aluminium alloy',
    '87 kgs',
    '32.2 x 25 x 96.3',
    '80 ltr'
  ];

  List<String> contact = [
    'Company name',
    'Contact person',
    'Address',
    'Email ID',
    'Contact no.'
  ];

  List<String> contactDetails = [
    'Mittal steels',
    'Mr Atul Mittal',
    '104/105 near Pithampur main road, Indore Madhya Pradesh',
    'mittal.atul@mittalcorps.com',
    '99999-99999\n89898-98989'
  ];

  List<Map<String, String>> _specs = new List();
  List<Map<String, String>> _contactInfo = new List();

  Map productData = {};

  @override
  void initState() {
    super.initState();
  }

  Widget _buildSpecificationList(String specificationData) {
    _specs.clear();
    var specJson = Map<String, String>.from(jsonDecode(specificationData));
    // print( specJson );
    specJson.forEach((key, value) {
      _specs.add({"name": key, "details": value,});
    });

    return Container(
      padding: EdgeInsets.only(top: 10, left: 5),
      child: Column(
          children: _specs.map<Widget>((spec) => Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          spec['details'],
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
          ).toList()),
    );
  }

  Widget _buildContactSeller(String companyName, String contactPersonName, String address, String contactPersonEmail, String contactPhoneNo, dynamic coords) {
    Map jsonLatLongs = jsonDecode(coords);
    LatLng LatLongs = LatLng(jsonLatLongs['lat'], jsonLatLongs['long']);
    _contactInfo.clear();
    _contactInfo.addAll(
        [
          {
            "name": "Company Name",
            "details": companyName,
          },
          {
            "name": "Contact Person",
            "details": contactPersonName,
          },
          {
            "name": "Address",
            "details": address,
          },
          {
            "name": "Email Id",
            "details": contactPersonEmail,
          },
          {
            "name": "Contact No.",
            "details": contactPhoneNo,
          },
        ]
    );

    return Container(
      padding: EdgeInsets.only(top: 10, left: 5),
      child: Column(
        children: _contactInfo.map<Widget>((contactDetail) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contactDetail['name'],
                        style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contactDetail['details'],
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            (contactDetail['name'] == 'Address') ? Container(height: 300, child: GoogleMapWidget(picker: false, initialLocation: LatLongs,),) : SizedBox.shrink(),
            SizedBox(
              height: 20,
            )
          ],
        ),
        ).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
      child: Stack(
          children: [
            buildBody(),
            buildBottomBar(context),
          ]
        ),
      )
    );
  }

  Widget buildBody() {
    return SingleChildScrollView(
      child: Stack(
        children: [
        Image.asset("assets/images/Group_166.png"),
        FutureBuilder(
            future: getProductData(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                  child: CircularProgressIndicator(),
                );

              // log(snapshot.data.toString());
              // return Container();
              return buildProductDetails(snapshot.data);
            }
        ),
      ]),
    );
  }


  Future getProductData() async {
    String url = localhostAddress+'/products/1/';
    var resp = await http.get(url);
    var respJson = jsonDecode(resp.body);
    log(resp.body);
    // log(respJson['images'][0]);
    productData = respJson;
    return respJson;
  }


  Column buildProductDetails(Map data) {
    return Column(
        children: [
          SizedBox(
            height: 30,
          ),
          buildHeader(data['name']),
          SizedBox(
            height: 20,
          ),
          ImageCarousel(imageList: List<String>.from(data['images'])),
          //SizedBox(height: 10,),
          buildProductStats(data['views'].toString(), data['wishlisted'].toString(), data['enquiries']),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      data['price'].toString(),
                      style: TextStyle(fontSize: 26),
                    ),
                    Text(
                      ' /'+data['unit'],
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
            child: Text(
              data['details'],
              style: TextStyle(
                fontSize: 16,
                color: Color(0xFF6F6F6F),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('Max Qty : ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      data['maxQty'].toString(),
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      'Category : ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF979797),
                      ),
                    ),
                    Text(
                      data['category'],
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF979797),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Ad published on  :  ',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Open Sans',
                        fontStyle: FontStyle.italic,
                        color: Color(0xFF6F6F6F),
                      ),
                    ),
                    Text(
                      publishDate,
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0xFF6F6F6F),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          buildSpecificationContainer(data['specifications']),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              children: [
                Text(
                  'CONTACT SELLER',
                  style: TextStyle(
                      color: Color(0xFF4B69FF),
                      fontWeight: FontWeight.bold,
                      fontSize: 22),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                  color: Color(0xFFFFF9FA),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 1),
                      blurRadius: 10,
                      color: Colors.black.withOpacity(.16),
                    ),
                  ]),
              child: _buildContactSeller(data['company_name'], data['contact_person_name'], data['address'], data['contact_person_email'], data['contact_person_phone_no'], data['latLongs'])),
          SizedBox(
            height: 40,
          )
        ],
      );
  }

  Container buildSpecificationContainer(String specificationData) {
    return Container(
      child: Stack(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  height: 120,
                  margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                  padding: EdgeInsets.fromLTRB(40, 30, 0, 0),
                  decoration: BoxDecoration(
                    color: Color(0xFFD84764),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: Text(
                    'Specification',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 24),
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.start,
              children: [
                //Text('Specification', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                SizedBox(
                  height: 60,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: Color(0xFFFFF9FA),
                    ),
                    child: _buildSpecificationList(specificationData)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Stack buildBottomBar(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 0,
          child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              //height: 80,
              child: Stack(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Color(0xFFE5E5E5),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        'CHANGE QUANTITY',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(''),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(''),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => editProduct(data: productData)));
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                        decoration: BoxDecoration(
                            color: Color(0xFF0B868A),
                            borderRadius: BorderRadius.circular(30)),
                        child: Text(
                          'Edit',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ],
                ),
              ])),
        ),
      ],
    );
  }

  Padding buildHeader(String productName) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.arrow_back_ios),
          SizedBox(
            width: 20,
          ),
          Flexible(
              child: Text(
            productName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )),
          //Icon(Icons.share),
          Container(
            child: Text(' '),
          ),
        ],
      ),
    );
  }

  Container buildProductStats(String views, String wishlistedCount, dynamic enquiries) {
    var enquiryJsonList = List.from(jsonDecode(enquiries));
    int enquiryCount = enquiryJsonList.length;
    log(enquiryCount.toString());

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
      height: 90,
      //from 80 to 70
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: Color(0xff0B868A),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.remove_red_eye,
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                views + " views",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.favorite,
                color: Colors.white,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                wishlistedCount + " times",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                enquiryCount.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Enquiries",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
