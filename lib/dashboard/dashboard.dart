import 'dart:convert';
import 'dart:developer';

import 'package:destock/CONSTANTS.dart';
import 'package:destock/wishlist/wishlist_and_enquiry.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dashboard_empty.dart';
import 'dashboard_enquiry_card.dart';
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
  String userId = '';
  int totalProductViews = 0;

  int activeProductsCount = 0;


  @override
  void initState() {
    super.initState();
  }

  _readUserId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userId =
    (prefs.getString('user_id') == null) ? '10' : prefs.getString('user_id');
    return userId;
  }

  _getMyProducts() async {
    String userId = await _readUserId();
    var response = await get(
      localhostAddress + '/users/$userId/products/',
    ).then((value) => value.body);

    // print(response);
    // log(response);
    List respJson = List.from(jsonDecode(response)); //TODO if this doesn't work, use futurebuilder to get active prod count from backend
    return jsonDecode(response);
  }

  getTotalViews() async {
    String userId = await _readUserId();
    var response = await get(
      localhostAddress + '/users/$userId/getTotalViews/',
    ).then((value) => value.body);
    log('Views: ' + response);
    return response;
  }

  getActiveProductsCount() async {
    String userId = await _readUserId();
    var response = await get(
      localhostAddress + '/users/$userId/getActiveProductsCount/',
    ).then((value) => value.body);
    log('Active products count: ' + response);
    return response;
  }

  _getLatestEnquiries() async {
    String userId = await _readUserId();
    var response = await get(
      '$localhostAddress/users/sellerEnquiries/?user_id=$userId',
    ).then((value) => value.body);
    // '$localhostAddress/products/enquiries/?user_id=$userId',).then((value) => value.body);

    // print(response);
    // log(response);
    // log(jsonDecode(response)[0].toString());
    return jsonDecode(response);
  }

  _getUpcomingRenewals() async {
    String userId = await _readUserId();
    var response =
        await get('$localhostAddress/users/upcoming_renewals?user_id=$userId')
            .then((value) => value.body);

    // print(response);
    // log(response);
    return jsonDecode(response);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xF8F9FF),
                ),
                child: Column(
                  children: <Widget>[
                    FutureBuilder(
                        future: getSavedUserData(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData)
                            return header(
                              headline1: 'Hello ${snapshot.data['user_name'].toString().split(' ')[0]}', //TODO Change to user's name
                              headline2: 'Welcome to your dashboard !',
                              headline3: 'Complete you profile for better reach!',
                              image: "/static/images/users/${snapshot.data['user_id']}/user.jpg",
                            );
                          else
                            return Container();
                        }),
                    SizedBox(
                      height: 70,
                    ),
                    option_cards(),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => WishlistAndEnquiry()));
                      },
                      child: options_like(
                        title: "Products I would like to buy",
                        image: "assets/images/product_like.png",
                      ),
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
                                        (snapshot.data.length > 3)
                                            ? 3
                                            : snapshot.data.length,
                                        (index) {
                                          return product_card(
                                            product_id: "#786GFHDR",
                                            //TODO change to randomId
                                            product_name: snapshot.data[index]
                                                ["name"],
                                            product_price: snapshot.data[index]
                                                    ["price"]
                                                .toString(),
                                            views: snapshot.data[index]["views"]
                                                .toString(),
                                            favorite: snapshot.data[index]
                                                    ["wishlisted"]
                                                .toString(),
                                            enquiries: List.from(jsonDecode(
                                                    snapshot.data[index]
                                                        ["enquiries"]))
                                                .length
                                                .toString(),
                                            expiry_date: "12 August 2020",
                                            // expiry_date: dateToMMMddyyyy(snapshot.data[index]["expiryDate"]), //TODO
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
                      builder: (BuildContext context, snapshot) {
                        if (snapshot.hasData) {
                          List prodList = snapshot.data;
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
                                  : Column(
                                      children: prodList
                                          .sublist(0, 3)
                                          .map(
                                            (prod) => Column(
                                              children: [
                                                enquiry_card(
                                                  product_id:
                                                      prod["id"].toString(),
                                                  product_name: prod['name'],
                                                  product_price:
                                                      prod['price'].toString(),
                                                  image: prod['image'],
                                                  enquiry_data: prod['enquiries'],
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                              ],
                                            ),
                                          )
                                          .toList(),
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
                                        renewal_card(
                                          data: snapshot.data,
                                        ),
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
                  products: this.activeProductsCount.toString(),
                  pro_text: 'Active\nProducts',
                  views: this.totalProductViews.toString(),
                  view_text: "Total\nviews",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Map> getSavedUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userId = prefs.getString('user_id');
    String userName = '';
    if(userId == null) {
      userId = '1';
      userName = 'Ajay';
    } else {
      userName = prefs.getString('name');
    }
    return {'user_id': userId, 'user_name': userName,};
  }

  Widget product_view_card({String products, String pro_text, String views, String view_text}) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: 250,
        height: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 40,
              color: Colors.black.withOpacity(.16),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FutureBuilder(
                    future: getActiveProductsCount(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData)
                        return Text(
                          snapshot.data,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        );
                      return Text(
                        "0",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      );
                    }),
                Text(
                  pro_text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff6F6F6F)),
                ),
              ],
            ),
            VerticalDivider(
              color: Colors.black38,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                FutureBuilder(
                    future: getTotalViews(),
                    builder: (context, snapshot) {
                      if(snapshot.hasData)
                        return Text(
                          snapshot.data,
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        );
                      return Text(
                        "0",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      );
                    }),
                Text(
                  view_text,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff6F6F6F)),
                ),
              ],
            ),
          ],
        ));
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

class header extends StatelessWidget {
  final String headline1;
  final String headline2;
  final String headline3;
  final String image;

  const header(
      {Key key, this.headline1, this.headline2, this.headline3, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40)),
          color: Color(0xffD84764),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  headline1,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  headline2,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                ),
                Text(
                  headline3,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                ),
              ],
            ),
            profileImage(),
            // Image.asset(image, height: 50),
          ],
        ));
  }

  Widget profileImage() {
    Widget returnedImage = Container();
    try {
      returnedImage = FadeInImage(
          placeholder: AssetImage("assets/images/userDummy.jpg"),
          image: NetworkImage(localhostAddress+image),
          height: 70,
      );
      // return CachedNetworkImage(
      //   useOldImageOnUrlChange: true,
      //   imageUrl: localhostAddress+image,
      //   placeholder: (context, url) => CircularProgressIndicator(),
      //   errorWidget: (context, url, error) {
      //     return Image(
      //       image: AssetImage("assets/images/userDummy.jpg"),
      //     );
      //   },
      // );
      // return Image.network(localhostAddress + image, height: 70);
    } catch(e) {
      log("Error caught!");
    }
    return returnedImage;
  }
}
