import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dashboard_empty.dart';
import 'enquiry_card.dart';
import 'footer.dart';
import 'product_card.dart';
import 'renewal_card.dart';

class dashboard extends StatefulWidget {
  dashboard({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _dashboardState createState() => _dashboardState();
}

class _dashboardState extends State<dashboard> {
  _getMyProducts() async {
    var response = await post('http://192.168.43.188:5000/user/my_products',
        body: {"id": "1"}).then((value) => value.body);

    // print(response);
    return jsonDecode(response);
  }

  _getLatestEnquiries() async {
    var response = await post(
        'http://192.168.43.188:5000/user/latest_enquiries',
        body: {"id": "1"}).then((value) => value.body);

    // print(response);
    return jsonDecode(response);
  }

  _getUpcomingRenewals() async {
    var response = await post(
        'http://192.168.43.188:5000/user/upcoming_renewals',
        body: {"id": "1"}).then((value) => value.body);

    // print(response);
    return jsonDecode(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xF8F9FF),
              ),
              child: Column(
                children: <Widget>[
                  header(
                    headline1: 'Hello Ajay',
                    headline2: 'Welcome to your dashboard !',
                    headline3: 'Complete you profile for better reach!',
                    image: "assets/images/USER PROFILE PIC.png",
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  option_cards(),
                  SizedBox(
                    height: 10,
                  ),
                  options_like(
                    title: "Products I would like to buy",
                    image: "assets/images/product_like.png",
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FutureBuilder(
                    future: _getMyProducts(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            Title_with_no(
                              title: "Your Products",
                              number: "(${snapshot.data.length})",
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            (snapshot.data.length == 0)
                                ? Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/dashboard_sapien1.png",
                                        width: 300,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "All the products which you will add to\nDe-stock will come here",
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      submitButton(
                                        title: "START ADDING YOUR PRODUCTS",
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: List.generate(
                                      2,
                                      (index) {
                                        return product_card(
                                          product_id: "#786GFHDR",
                                          product_name: snapshot.data[index]
                                              ["name"],
                                          product_price: snapshot.data[index]
                                                  ["price"]
                                              .toString(),
                                          views: snapshot.data[index]["views"]
                                              .toString(),
                                          favorite: snapshot.data[index]
                                                  ["favourites"]
                                              .toString(),
                                          enquiries: snapshot.data[index]
                                                  ["enquiries"]
                                              .toString(),
                                          expiry_date: "12 August 2020",
                                          image:
                                              "assets/images/product image.png",
                                        );
                                      },
                                    ),
                                  )
                          ],
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FutureBuilder(
                    future: _getLatestEnquiries(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            Title_with_no(
                              title: "Latest Enquiries",
                              number: "(${snapshot.data.length})",
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            (snapshot.data.length == 0)
                                ? Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/dashboard_sapien2.png",
                                        width: 300,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "All enquiries for your products will\ncome here",
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  )
                                : enquiry_card(
                                    product_id: "#786GFHDR",
                                    product_name:
                                        "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                                    product_price: "7000",
                                    image: "assets/images/product image.png",
                                    user_image: "assets/images/user_image.png",
                                    user_name: "Tanmay Patil",
                                    user_enquiry:
                                        "I wanted to enquire about the price of this product",
                                    quantity: "300",
                                  )
                          ],
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  FutureBuilder(
                    future: _getUpcomingRenewals(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasData) {
                        return Column(
                          children: [
                            Title_with_no(
                              title: "Upcoming Renewals",
                              number: "(${snapshot.data.length})",
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            (snapshot.data.length == 0)
                                ? Column(
                                    children: [
                                      Image.asset(
                                        "assets/images/dashboard_sapien3.png",
                                        width: 300,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Renewal for your ads will come here",
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Text(
                                        "Post your first ad",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffD84764)),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      submitButton(
                                        title: "VIEW ALL PLANS",
                                      ),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      renewal_card(data: snapshot.data),
                                      SizedBox(
                                        height: 40,
                                      ),
                                      footer(),
                                    ],
                                  ),
                          ],
                        );
                      }
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 150,
              left: 71.5,
              child: product_view_card(
                products: '0',
                pro_text: 'Active\nProducts',
                views: '0',
                view_text: "Total\nviews",
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class options_like extends StatelessWidget {
  final String title;
  final String image;
  const options_like({Key key, this.title, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 43),
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 20,
              color: Color(0xffE5E5E5).withOpacity(1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              image,
              height: 18,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ],
        ));
  }
}
