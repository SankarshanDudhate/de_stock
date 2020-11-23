import 'package:destock/CONSTANTS.dart';
import 'package:destock/InnerDashboard/enquiries_enquiry_card.dart';
import 'package:destock/search/search_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Enquiries extends StatefulWidget {
  @override
  _EnquiriesState createState() => _EnquiriesState();
}

class _EnquiriesState extends State<Enquiries> {

  TextEditingController searchController = new TextEditingController();
  int enquiryCount = 3;
  List<dynamic> productEnquiries = new List();

  @override
  initState() {
    super.initState();
    returnData();
  }

  void returnData() async {
    // print('lol');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = (prefs.getString('user_id') == null) ? '1' : prefs.getString('user_id');
    String url = '$localhostAddress/users/sellerEnquiries/?user_id=$userId';
    var result = await http.get(url);
    log(result.body);
    productEnquiries = await jsonDecode(result.body);
    // print("length: "+productEnquiries.length.toString());
    setState(() {
      productEnquiries = productEnquiries;
    });
  }

  Widget searchBox() {
    return Container(
      //height: double.infinity,
      //padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30),),
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 10,
              color: Colors.black.withOpacity(.16),
            ),
          ],
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          fillColor: Colors.grey,
          hintText: "Search for product name or code",
          hintStyle: TextStyle(
          color: Colors.grey[400]
        ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(60),),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide(color: Colors.grey),
                //color:Colors.grey,
              ),
          suffixIcon: Icon(Icons.search,color: Colors.black87,),
        ),
        controller: searchController,
        onFieldSubmitted: (String searchText) {
          log("\nSearch Key: "+searchText);

          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SearchHome(searchText: searchText,)));
        },
    ),
    );
  }


  Widget buildEnquiryCards() {
    // log(productEnquiries.length.toString());
    return Column(
      children: productEnquiries.map((prod) => enquiryCard(prod)).toList(),
    );
  }

  Widget enquiryCard(prod) {
    // log("Rebuilding");
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: enquiry_card(
        product_id: prod["id"].toString(),
        product_name: prod["name"],
        product_price: prod["price"].toString(),
        image: prod["image"],
        enquiry_data: prod["enquiries"],
        // product_id: "#786GFHDR",
        // product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
        // product_price: "7000",
        // image: "assets/images/product image.png",
        // enquiry_data: [{
        //   "user_image": "assets/images/user_image_1.png",
        //   "user_name": "Tanmay Patil",
        //   "user_enquiry": "I wanted to enquire about the price of this product",
        //   "quantity": "300",
        //   "enquiry_date": "Aug 21, 2020"
        // }],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Stack(
                  children:[
                    Image.asset("assets/images/Group_167.png"),
                    Container(
                      //margin: EdgeInsets.fromLTRB(20,0,50,0),
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              icon: Icon(Icons.arrow_back_ios), onPressed: (){
                            setState(() {
                              //Navigate
                            });
                          }),
                          //SizedBox(width: 50,),
                          SizedBox(width: 20,),
                          SvgPicture.asset("assets/icons/money.svg",height: 40,width: 40,),
                          SizedBox(width: 20,),
                          Column(
                            children: [
                              Text("Enquiries", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Column(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 100, 40, 0),
                      child: searchBox(),
                    )
                  ]
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20),
                child: Row(
                  children: [
                    Text("All Enquiries", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    SizedBox(width:5),
                    Text("(" + productEnquiries.length.toString() + ")",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              SizedBox(height:30),
              buildEnquiryCards()
          ],
        ),
      )
    );
  }
}
