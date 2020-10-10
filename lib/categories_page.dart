import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:math';

import 'package:http/http.dart';
// import 'package:google_fonts/google_fonts.dart';

class category_page extends StatelessWidget {
  final iconBg = [
    Color(0xff4B69FF),
    Color(0xff0B868A),
    Color(0xffFC0151),
    Color(0xff2DDDB7)
  ];

  _getTopCategories() async {
    var body = await get('http://192.168.43.188:5000/products/top_categories')
        .then((value) => value.body);
    return jsonDecode(body);
  }

  _getAllCategories() async {
    var body = await get('http://192.168.43.188:5000/products/all_categories')
        .then((value) => value.body);
    return jsonDecode(body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          shrinkWrap: true,
          children: <Widget>[
            SizedBox(
              height: 30,
            ),
            header(),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "TOP CATEGORIES",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff595959)),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FutureBuilder(
              future: _getTopCategories(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4, childAspectRatio: 0.8),
                    primary: false,
                    itemCount: 8,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      // print(snapshot.data[index]['image']);
                      return _grid(
                        "${snapshot.data[index]['name']}",
                        "assets/images/categories/electric-motor 1.png",
                        // 'http://192.168.43.188:5000' +
                        // snapshot.data[index]['image'],
                        iconBg[Random().nextInt(4)],
                      );
                    },
                  );
                }
                return Center(child: CircularProgressIndicator());
              },
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "ALL CATEGORIES",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff595959)),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FutureBuilder(
              future: _getAllCategories(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                int colorIndex = 0;
                if (snapshot.hasData)
                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    primary: false,
                    itemCount: snapshot.data.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      if (index % 6 == 0) colorIndex = colorIndex + 1;
                      colorIndex = colorIndex % 4;
                      return _grid(
                          "${snapshot.data[index]['name']}",
                          "assets/images/categories/bearing 1.png",
                          iconBg[colorIndex]);
                    },
                  );
                else
                  return CircularProgressIndicator();
              },
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }

  Widget _grid(String category, String image, Color color) {
    return Container(
      child: Column(
        children: [
          Container(
            width: 70,
            height: 70,
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              color: color,
            ),
            child: Image.asset(image),
          ),
          Container(
            width: 110,
            child: Text(
              category,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}

class header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Image.asset("assets/images/destocklogo.png", height: 50),
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
