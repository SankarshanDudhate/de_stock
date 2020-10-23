import 'package:destock/cards/latest_products.dart';
import 'package:destock/categories_page.dart';
import 'package:destock/models/RecentProducts.dart';
import 'package:destock/models/SuggestedProducts.dart';
import 'package:destock/models/TrendingProducts.dart';
import 'package:destock/utils/footer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:destock/cards/product_card_home.dart';
import 'package:destock/cards/product_card_suggest.dart';
import 'package:destock/cards/product_near_you.dart';
import 'package:destock/cards/search_product_card_small.dart';
import 'package:http/http.dart';

import 'latest_products.dart';
import 'recently_viewed.dart';
import 'suggested_for_you.dart';
import 'trending.dart';

class HomeBuyer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          decoration: BoxDecoration(
            color: Color(0xF8F9FF),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Header(),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Top categories",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return (category_page());
                            },
                          ),
                        );
                      },
                      child: Text(
                        "View all",
                        style: TextStyle(fontSize: 12, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image.asset("assets/images/cutting_tool.png", height: 60),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Cutting Tools",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset("assets/images/pipes.png", height: 60),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Pipes",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset("assets/images/measure.png", height: 60),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Measuring\nInstruments",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Image.asset("assets/images/tools.png", height: 60),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Tools",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Items you viewed recently",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return (recently_viewed());
                            },
                          ),
                        );
                      },
                      child: Text(
                        "View all",
                        style: TextStyle(fontSize: 12, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),
              recent_view(),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Suggested for you",
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                        Text(
                          "based on your wishlist",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Color(0xff949494),
                          ),
                        )
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return (suggested_for_you());
                            },
                          ),
                        );
                      },
                      child: Text(
                        "View all",
                        style: TextStyle(fontSize: 12, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              suggest_you(),
              SizedBox(
                height: 20,
              ),
              Image.asset("assets/images/pricing plans banner.png"),
              SizedBox(
                height: 20,
              ),
              // Padding(
              //   padding: const EdgeInsets.only(left: 20),
              //   child: Align(
              //     alignment: Alignment.centerLeft,
              //     child: Text(
              //       "Near your location",
              //       style: TextStyle(
              //           fontSize: 15,
              //           fontWeight: FontWeight.w700,
              //           color: Colors.black),
              //     ),
              //   ),
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              // near_you(),
              // SizedBox(
              //   height: 20,
              // ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Latest Products",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return (latest_product());
                            },
                          ),
                        );
                      },
                      child: Text(
                        "View all",
                        style: TextStyle(fontSize: 12, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),
              latest(),
              SizedBox(
                height: 20,
              ),
              Image.asset("assets/images/refer a friend banner.png"),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Trending Now",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return (trending());
                            },
                          ),
                        );
                      },
                      child: Text(
                        "View all",
                        style: TextStyle(fontSize: 12, color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 20,
              ),
              trending_now(),
              SizedBox(
                height: 20,
              ),
              additional_category(),
              SizedBox(
                height: 20,
              ),
              Image.asset("assets/images/become a seller.png"),
              Footer(),
            ],
          ),
        ),
      ]),
    );
  }
}

class Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Image.asset("assets/images/destocklogo.png", height: 50),
            ),
            Container(
              width: 250,
              height: 40,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    blurRadius: 40,
                    color: Colors.black.withOpacity(.16),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(0),
                      child: SizedBox(height: 3, child: Icon(Icons.search)),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40),
                      borderSide: BorderSide(
                        width: 0,
                        style: BorderStyle.none,
                      ),
                    ),
                    filled: true,
                    hintStyle: new TextStyle(color: Colors.grey, fontSize: 12),
                    hintText: "Search for pipes, valves etc.",
                    fillColor: Colors.white),
              ),
            )
          ],
        ));
  }
}

class recent_view extends StatelessWidget {
  Future<List<RecentProduct>> _getRecentViews() async {
    var response =
        await post('http://192.168.43.188:5000/user/recent', body: {"id": "1"})
            .then((value) => value.body);
    // print(recentProductFromJson(response));
    return recentProductFromJson(response);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getRecentViews(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData)
          return GridView.builder(
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 24,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return product_card_home(
                  product_name: snapshot.data[index].name,
                  product_price: snapshot.data[index].price.toString(),
                  image: "assets/images/product image.png",
                );
              });
        else
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    );
  }
}

class suggest_you extends StatelessWidget {
  _getSuggested() async {
    var response = await post('http://192.168.43.188:5000/user/suggestions',
        body: {"id": "1"}).then((value) => value.body);
    return suggestionFromJson(response);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            margin: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Image.asset(
              "assets/images/pink bg.png",
              fit: BoxFit.fill,
            )),
        Container(
          margin:
              EdgeInsets.fromLTRB(30, 0, 30, 25), //from only horizontal to tlrb
          padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Color(0xffffffff),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              ),
            ],
          ),
          child: FutureBuilder(
            future: _getSuggested(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData)
                return Column(
                  children: <Widget>[
                    product_card_suggest(
                      product_name: snapshot.data[0].name,
                      product_price: snapshot.data[0].price.toString(),
                      description: snapshot.data[0].description,
                      image: "assets/images/product image.png",
                    ),
                    Divider(color: Colors.black),
                    product_card_suggest(
                      product_name: snapshot.data[1].name,
                      product_price: snapshot.data[1].price.toString(),
                      description: snapshot.data[1].description,
                      image: "assets/images/product image.png",
                    ),
                    Divider(color: Colors.black),
                    product_card_suggest(
                      product_name: snapshot.data[2].name,
                      product_price: snapshot.data[2].price.toString(),
                      description: snapshot.data[2].description,
                      image: "assets/images/product image.png",
                    ),
                  ],
                );
              else
                return Center(
                  child: CircularProgressIndicator(),
                );
            },
          ),
        ),
      ],
    );
  }
}

class near_you extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        product_near_you(
          product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
          product_price: "7000",
          distance: "15",
          image: "assets/images/product image.png",
        ),
        product_near_you(
          product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
          product_price: "7000",
          distance: "15",
          image: "assets/images/product image.png",
        ),
        product_near_you(
          product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
          product_price: "7000",
          distance: "15",
          image: "assets/images/product image.png",
        ),
      ],
    );
  }
}

class latest extends StatelessWidget {
  _getLatest() async {
    var response = await post('http://192.168.43.188:5000/products/latest',
        body: {"id": "1"}).then((value) => value.body);
    return suggestionFromJson(response);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getLatest(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData)
          return Column(
            children: [
              latest_products(
                color: Color(0xff2DDDB7).withOpacity(.07),
                product_name: snapshot.data[0].name,
                product_price: snapshot.data[0].price.toString(),
                description: snapshot.data[0].description,
                image: "assets/images/product image.png",
              ),
              latest_products(
                color: Color(0xffD84764).withOpacity(.07),
                product_name: snapshot.data[1].name,
                product_price: snapshot.data[1].price.toString(),
                description: snapshot.data[1].description,
                image: "assets/images/product image.png",
              ),
              latest_products(
                color: Color(0xff4060B8).withOpacity(.07),
                product_name: snapshot.data[2].name,
                product_price: snapshot.data[2].price.toString(),
                description: snapshot.data[2].description,
                image: "assets/images/product image.png",
              ),
            ],
          );
        else
          return Center(
            child: CircularProgressIndicator(),
          );
      },
    );
  }
}

class trending_now extends StatelessWidget {
  _getTrending() async {
    var response = await post('http://192.168.43.188:5000/products/latest',
        body: {"id": "1"}).then((value) => value.body);
    // print(response);
    return trendingFromJson(response);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getTrending(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
              primary: false,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.all(16),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 24,
              ),
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return product_card_trending(
                  product_name: snapshot.data[index].name,
                  product_price: snapshot.data[index].price.toString(),
                  image: "assets/images/product image.png",
                );
              });
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class additional_category extends StatelessWidget {
  _getAdditionalCategories() {}

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          margin: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              color: Color(0xffD84764),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(15))),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Text('Additional Category',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600)),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 175),
          child: Container(
            margin: EdgeInsets.only(top: 50, left: 0),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                searchcardsmall(
                  product_name:
                      "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                  product_price: "7000",
                  views: "112",
                  image: "assets/images/product image.png",
                ),
                searchcardsmall(
                  product_name:
                      "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                  product_price: "7000",
                  views: "112",
                  image: "assets/images/product image.png",
                ),
                searchcardsmall(
                  product_name:
                      "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                  product_price: "7000",
                  views: "112",
                  image: "assets/images/product image.png",
                ),
                searchcardsmall(
                  product_name:
                      "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                  product_price: "7000",
                  views: "112",
                  image: "assets/images/product image.png",
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
