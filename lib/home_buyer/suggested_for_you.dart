import 'dart:convert';

import 'package:destock/utils/footer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:destock/cards/product_card_suggest_withtag.dart';
import 'package:destock/cards/search_product_card_small.dart';
import 'package:http/http.dart';

class suggested_for_you extends StatelessWidget {
  _getSuggestions() async {
    var body = await get('http://192.168.43.188:5000/user/suggestions')
        .then((value) => value.body);

    var body_new = jsonDecode(body);
    List<Widget> suggestionList = List.generate(
      body_new.length,
      (index) => product_card_suggest_withtag(
        product_name: body_new[index]['name'],
        product_price: body_new[index]['price'].toString(),
        description: body_new[index]['description'],
        image: "assets/images/product image.png",
      ),
    );

    suggestionList.insert(
      0,
      Container(
        margin: EdgeInsets.only(bottom: 20),
        child: header(),
      ),
    );

    if (suggestionList.length > 4) {
      suggestionList.insert(
        4,
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: horizontal_scroll(),
        ),
      );
    } else {
      suggestionList.add(horizontal_scroll());
    }

    suggestionList.add(
      Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        child: Footer(),
      ),
    );

    return suggestionList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xF8F9FF),
        ),
        child: FutureBuilder(
          future: _getSuggestions(),
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
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: Color(0xffD84764),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(90),
        ),
      ),
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            "Suggested for you",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

class category_list_suggest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        product_card_suggest_withtag(
          product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
          product_price: "7000",
          description: "A little brief about the product comes brief about",
          image: "assets/images/product image.png",
        ),
        product_card_suggest_withtag(
          product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
          product_price: "7000",
          description: "A little brief about the product comes brief about",
          image: "assets/images/product image.png",
        ),
        product_card_suggest_withtag(
          product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
          product_price: "7000",
          description: "A little brief about the product comes brief about",
          image: "assets/images/product image.png",
        ),
      ],
    );
  }
}

class horizontal_scroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          margin: EdgeInsets.only(left: 20),
          decoration: BoxDecoration(
              color: Color(0xff0B868A),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  topLeft: Radius.circular(15))),
          child: Container(
            padding: EdgeInsets.all(16),
            child: Text(
                'Because you viewed Cast Iron gears 15 inch 1050 rounded edges- PVC ',
                style: TextStyle(
                    color: Colors.white,
                    fontStyle: FontStyle.italic,
                    fontSize: 12,
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
