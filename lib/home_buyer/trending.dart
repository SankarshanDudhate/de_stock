import 'dart:convert';

import 'package:destock/cards/pro_card_hor_scroll.dart';
import 'package:destock/utils/footer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:destock/cards/product_card_suggest_withtag.dart';
import 'dart:math';

import 'package:http/http.dart';

class trending extends StatefulWidget {
  trending({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _trendingState createState() => _trendingState();
}

class _trendingState extends State<trending> {
  _getTrending() async {
    var body = await get('http://192.168.43.188:5000/products/trending')
        .then((value) => value.body);

    var body_new = jsonDecode(body);
    List<Widget> trendingList = List.generate(
      body_new.length,
      (index) => product_card_suggest_withtag(
        product_name: body_new[index]['name'],
        product_price: body_new[index]['price'].toString(),
        description: body_new[index]['description'],
        image: "assets/images/product image.png",
      ),
    );

    trendingList.insert(
      0,
      Container(
        margin: EdgeInsets.only(bottom: 20),
        child: header(),
      ),
    );

    if (trendingList.length > 4) {
      trendingList.insert(
        4,
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: horizontal_scroll(),
        ),
      );
    } else {
      trendingList.add(horizontal_scroll());
    }

    trendingList.add(
      Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Footer(),
      ),
    );

    return trendingList;
    // return jsonDecode(body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xF8F9FF),
        ),
        child: FutureBuilder(
          future: _getTrending(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData)
              return ListView(
                children: snapshot.data,
              );

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}

class header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 20, 0),
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: Color(0xffD84764),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(70),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "Trending Now",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ],
          ),
          Transform.rotate(
            angle: 90 * pi / 180,
            child: Icon(
              Icons.tune,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class horizontal_scroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 190,
          width: double.infinity,
          margin: EdgeInsets.only(
            left: 20,
          ),
          decoration: BoxDecoration(
              color: Color(0xff4B69FF),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(15))),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Text('See what others are buying',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600)),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 300),
          child: Container(
            margin: EdgeInsets.only(top: 50, left: 30),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                pro_card_hor_scroll(
                  product_name:
                      "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                  product_price: "7000",
                  image: "assets/images/product image.png",
                ),
                pro_card_hor_scroll(
                  product_name:
                      "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                  product_price: "7000",
                  image: "assets/images/product image.png",
                ),
                pro_card_hor_scroll(
                  product_name:
                      "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                  product_price: "7000",
                  image: "assets/images/product image.png",
                ),
                pro_card_hor_scroll(
                  product_name:
                      "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                  product_price: "7000",
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
