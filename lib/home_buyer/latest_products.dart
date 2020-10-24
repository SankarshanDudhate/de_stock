import 'dart:convert';

import 'package:destock/cards/pro_card_hor_scroll.dart';
import 'package:destock/utils/footer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:destock/cards/product_card_suggest_withtag.dart';
import 'dart:math';

import 'package:http/http.dart';

class latest_product extends StatelessWidget {
  _getLatestProducts() async {
    var body = await get('http://192.168.43.188:5000/products/latest')
        .then((value) => value.body);

    var body_new = jsonDecode(body);
    List<Widget> latestProductsList = List.generate(
      body_new.length,
      (index) => product_card_suggest_withtag(
        product_name: body_new[index]['name'],
        product_price: body_new[index]['price'].toString(),
        description: body_new[index]['description'],
        image: "assets/images/product image.png",
      ),
    );

    latestProductsList.insert(
      0,
      Container(
        margin: EdgeInsets.only(bottom: 20),
        child: header(),
      ),
    );

    if (latestProductsList.length > 4) {
      latestProductsList.insert(
        4,
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: horizontal_scroll(),
        ),
      );
    } else {
      latestProductsList.add(horizontal_scroll());
    }

    latestProductsList.add(
      Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Footer(),
      ),
    );

    return latestProductsList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xF8F9FF),
        ),
        child: FutureBuilder(
          future: _getLatestProducts(),
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
                "Latest products",
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
  _getRecommended() async {
    var response = await post('http://192.168.43.188:5000/user/recommended',
        body: {"id": "1"}).then((value) => value.body);
    return jsonDecode(response);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 190,
          width: double.infinity,
          margin: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              color: Color(0xff4B69FF),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(15))),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Not what you’re looking for ?',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w700)),
                Text('Try Recommended for you',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.w400)),
              ],
            ),
          ),
        ),
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 310),
          child: Container(
            margin: EdgeInsets.only(top: 60, left: 30),
            child: FutureBuilder(
              future: _getRecommended(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData)
                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      4,
                      (index) => pro_card_hor_scroll(
                        product_name: snapshot.data[index]['name'],
                        product_price: snapshot.data[index]['price'].toString(),
                        image: "assets/images/product image.png",
                      ),
                    ),
                    // children: [
                    //   pro_card_hor_scroll(
                    //     product_name:
                    //         "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                    //     product_price: "7000",
                    //     image: "assets/images/product image.png",
                    //   ),
                    //   pro_card_hor_scroll(
                    //     product_name:
                    //         "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                    //     product_price: "7000",
                    //     image: "assets/images/product image.png",
                    //   ),
                    //   pro_card_hor_scroll(
                    //     product_name:
                    //         "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                    //     product_price: "7000",
                    //     image: "assets/images/product image.png",
                    //   ),
                    //   pro_card_hor_scroll(
                    //     product_name:
                    //         "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                    //     product_price: "7000",
                    //     image: "assets/images/product image.png",
                    //   ),
                    // ],
                  );
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
