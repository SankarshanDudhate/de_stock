import 'package:destock/ProductPages/ImageCarousel.dart';
import 'package:destock/ProductPages/requestQuote.dart';
import 'package:destock/utils/bg_clip_purple.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:convert';

class productPage extends StatefulWidget {
  @override
  _productPageState createState() => _productPageState();
}

class _productPageState extends State<productPage> {

  String productName = 'Cast Iron gears 15 inch 1050 rounded edges- PVC ';
  String productPrice = '₹ 89,000';
  String productDetails = 'Gears can be made of all sorts of materials, including many types of steel, brass, bronze, cast iron, ductile iron, aluminum, powdered metals, and plastics.';
  String productCategory = 'Cutting tools';
  String location = 'your location';
  String publishDate = 'August 19, 2020';

  List<String> specName = [
    'Brand','Model','Material','Weight','Dimensions','Capacity'
  ];

  List<String> specDetails = [
    'Mittal steels','specification comes here','Copper and Aluminium alloy','87 kgs','32.2 x 25 x 96.3','80 ltr'
  ];

  List<String> contact = [
    'Company name','Contact person','Address','Email ID','Contact no.'
  ];
  
  List<String> contactDetails = [
    'Mittal steels','Mr Atul Mittal','104/105 near Pithampur main road, Indore Madhya Pradesh','mittal.atul@mittalcorps.com', '99999-99999\n89898-98989'
  ];

  List<Map<String,String>> _specs= new List();
  List<Map<String,String>> _contactInfo= new List();

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

      for(int i=0;i<contact.length;i++){
        _contactInfo.add({
          "name":contact[i],
          "details":contactDetails[i],
        });
      }
  }

  Widget _buildSpecification(){
    return ListView.builder(
      itemCount: _specs.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, index) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              Container(
                width: MediaQuery.of(context).size.width*0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_specs[index]['details'],style: TextStyle(fontSize:16),),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }

  Widget _buildContactSeller(){
    return ListView.builder(
      itemCount: _contactInfo.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, index) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_contactInfo[index]['name'],style: TextStyle(fontWeight: FontWeight.bold,fontSize:16),),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_contactInfo[index]['details'],style: TextStyle(fontSize:16),),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset("assets/images/Group_166.png"),
              Column(
                children: [
                  SizedBox(height: 60,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.arrow_back_ios),
                        SizedBox(width: 20,),
                        Flexible(child: Text(productName, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                        Icon(Icons.share)
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  ImageCarousel(),
                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(productPrice,style: TextStyle(fontSize: 26),),
                            Text(' /unit',style: TextStyle(fontSize:14),),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: Color(0xFFFFF4F4),
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 10,),
                              Text('ADD TO WISHLIST', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color:Color(0xFFFC0151),),),
                              SizedBox(width: 10,),
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(60),
                                    color: Color(0xFFD84764),
                                ),
                                child: Icon(Entypo.heart,color:Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:40),
                    child: Text(productDetails, style: TextStyle(fontSize: 16,color:Color(0xFF6F6F6F),),),
                  ),
                  SizedBox(height: 40,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text('Category : ',style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold,color:Color(0xFF979797),),),
                            Text(productCategory,style: TextStyle(fontSize: 16,color:Color(0xFF979797),),)
                          ],
                        ),
                        Text(location,style: TextStyle(fontSize: 16,color:Color(0xFF000000),),)
                      ],
                    ),
                  ),
                  SizedBox(height: 40,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text('Ad published on  :  ',style: TextStyle(fontSize: 14,fontFamily: 'Open Sans',fontStyle: FontStyle.italic,color:Color(0xFF6F6F6F),),),
                            Text(publishDate,style: TextStyle(fontSize: 16,color:Color(0xFF6F6F6F),),)
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height:10),
                  Container(
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
                                child:  Text('Specification', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24),),
                               ),
                            ),
                          ],
                        ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal:20,vertical:10),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //Text('Specification', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                          SizedBox(height: 60,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal:30),
                            margin: EdgeInsets.symmetric(horizontal:10,vertical: 10),
                             decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10),),
                                color: Color(0xFFFFF9FA),
                            ),
                            child: _buildSpecification()
                          ),
                        ],
                      ),
                    )
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:30),
                    child: Row(
                      children: [
                        Text('CONTACT SELLER', style: TextStyle(color: Color(0xFF4B69FF),fontWeight: FontWeight.bold,fontSize: 22),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Stack(
                    children: [
                      // Positioned.fill(
                      //   child: Align(
                      //     alignment: Alignment.center,
                      //     child: RotationTransition(
                      //        turns: new AlwaysStoppedAnimation(-5 / 360),
                      //        child: Container(
                      //       width: MediaQuery.of(context).size.width,
                      //       height: 200,
                      //         decoration: BoxDecoration(
                      //           color: Color(0xFF4B69FF),
                      //         ),
                      //       ),
                      //     ),
                      //                         ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: BgClip(
                          height: 360,
                        ),
                      ),
                      Container(
                      padding: EdgeInsets.symmetric(horizontal:10,vertical: 20),
                      margin: EdgeInsets.symmetric(horizontal:10,vertical:30),
                       decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10),),
                          color: Color(0xFFFFF9FA),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 1),
                              blurRadius: 10,
                              color: Colors.black.withOpacity(.16),
                          ),]
                      ),
                      child: _buildContactSeller()
                    ),
                    ]),
                  SizedBox(height: 100,)
                ],
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal:10,vertical: 20),
                //height: 80,
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.6,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Color(0xFFE5E5E5),
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.call),
                              SizedBox(width: 5,),
                              Text('CONTACT SELLER', style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                            ],
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
                            requestQuote()._buildRequestQuote(context,'4','1','adharashive@gmail.com','500','KG');
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.5,
                            padding: EdgeInsets.symmetric(horizontal:20, vertical:20),
                            decoration: BoxDecoration(
                              color: Color(0xFF0B868A),
                              borderRadius: BorderRadius.circular(30)
                            ),
                            child: Text('Request a quote', style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
                            ),
                        ),
                      ],
                    ),
                  ])
              ),
            ),
          ],
        )
        ]
      ),
    );
  }
}


class requestQuote{

  void _buildRequestQuote(BuildContext context, String product_id, String user_id, String email,String maxQuantity, String unit) {

   TextEditingController remarkController = new TextEditingController();
   TextEditingController quantityController = new TextEditingController();
    var alertDialog = AlertDialog(
      content :
          Container(
            width: MediaQuery.of(context).size.width*0.8,
            child: SingleChildScrollView(
              child: Column(
                children: [ 
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal:40,vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topRight:  Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        //bottomRight: Radius.circular(20)
                        ),
                    ),
                    child: Text('REQUEST A QUOTE', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.white),),
                  ),
                  SizedBox(height:30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(child: Text('Quantity', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
                      //SizedBox(width: 10,),
                      Flexible(
                        child: TextField(
                          maxLines: 1,
                          controller: quantityController,
                          decoration: new InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          )
                          ),
                        ),
                      ),
                      //SizedBox(width:10),
                      Flexible(child: Text(maxQuantity + ' ' + unit + ' max quantity',style: TextStyle(color:Colors.grey[400],fontWeight: FontWeight.bold,fontSize: 14),)),
                    ]
                  ),
                  SizedBox(height:20),
                  Row(
                    children: [
                      Text('Remark', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                    ],
                  ),
                  SizedBox(height:10),
                  TextField(
                    maxLines: 6,
                    controller: remarkController,
                    decoration: new InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )
                    ),
                  ),
                  SizedBox(height:20),
                  RichText(
                    text: TextSpan(
                      text: 'Quote will be sent to you as a notification and same on ',
                      style: TextStyle(color:Colors.black,fontSize: 16),
                      children: <TextSpan>[
                        TextSpan(text: email, style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  //Text('Quote will be sent to you as a notification and same on ' + email,textAlign: TextAlign.left,style: TextStyle(fontSize:14),),
                  SizedBox(height:20),
                  SizedBox(height:20),
                  GestureDetector(
                    onTap: () async {
                      DateTime enqDate = DateTime.now();
                      DateFormat formatter = DateFormat("yyyy-MM-dd");
                      String formattedDate = formatter.format(enqDate);
                      print(formattedDate);

                      String remark = remarkController.text;

                      if( int.parse(quantityController.text) > 500 ) {
                        Fluttertoast.showToast(msg: "Please enter a valid quantity!", toastLength: Toast.LENGTH_LONG, );
                        return;
                      }

                      String url = 'http://192.168.43.167:5000/products/enquiries/enquire/';
                      var dataObj = {'product_id': product_id, 'date':formattedDate, 'buyer_id':user_id,'enquiry':remark,'quantity':quantityController.text};
                      var res = await http.post(url, body: dataObj);
                      var resJson = jsonDecode(res.body);
                      print(resJson["Status"]);

                      if( resJson["Status"] == "Success" ) {
                        Fluttertoast.showToast(msg: "Replied Successfully!");
                        // setState(() {
                        // Not needed right now... use it to disable the request quote button later on an actual screen
                        //   widget.enquiry_data[productIndex]["replied"] = true; //this is just an example
                        // });
                      } else {
                        Fluttertoast.showToast(msg: "Error - failed to reply!");
                      }
                      Navigator.of(context).pop();
                      //TODO close the alertDialog
                    },
                    child: Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          color: Color(0xFFFC0151),
                      ),
                      child: Center(
                        child: Text("Send Enquiry", style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  SizedBox(height:20),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color:Color(0xFFFC0151),),)),
                ]
              ),
            ),
          ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))
      ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      }
    );
}

}