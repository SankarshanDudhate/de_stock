import 'package:destock/search_product_card_big.dart';
import 'package:destock/search_product_card_small.dart';
import 'package:flutter/material.dart';

class SearchHome extends StatelessWidget {
  final _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
        height: 180,
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Color(0xffD84764),
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(80)),
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Text(
              "Suggested for you",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 24),
            )
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(top: 180),
        padding: EdgeInsets.all(8),
        child: ListView(
          children: [
            ProductSearchCard(
              productName: 'Cast Iron gears 15 inch 1050 rounded edges- PVC',
              productPrice: '7,000',
              views: '112',
              image: 'assets/images/product_1.png',
              description:
                  'A little brief about the product comes here A little brief about the products',
            ),
            SizedBox(
              height: 8,
            ),
            ProductSearchCard(
              productName: 'Cast Iron gears 15 inch 1050 rounded edges- PVC',
              productPrice: '7,000',
              views: '112',
              image: 'assets/images/product_2.png',
              description:
                  'A little brief about the product comes here A little brief about the products',
            ),
            SizedBox(
              height: 8,
            ),
            ProductSearchCard(
              productName: 'Cast Iron gears 15 inch 1050 rounded edges- PVC',
              productPrice: '7,000',
              views: '112',
              image: 'assets/images/product_3.png',
              description:
                  'A little brief about the product comes here A little brief about the products',
            ),
            SizedBox(
              height: 8,
            ),
            Stack(
              children: [
                Container(
                  height: 130,
                  margin: EdgeInsets.only(left: 16),
                  decoration: BoxDecoration(
                      color: Color(0xff0B868A),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          topLeft: Radius.circular(20))),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                        'Because you viewed Cast Iron gears 15 inch 1050 rounded edges-PVC',
                        style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w300)),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: 200),
                  child: Container(
                    margin: EdgeInsets.only(top: 80),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        SearchProductCardSmall(),
                        SearchProductCardSmall(),
                        SearchProductCardSmall(),
                        SearchProductCardSmall(),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 8,
            ),
            ProductSearchCard(
              productName: 'Cast Iron gears 15 inch 1050 rounded edges- PVC',
              productPrice: '7,000',
              views: '112',
              image: 'assets/images/product_1.png',
              description:
                  'A little brief about the product comes here A little brief about the products',
            ),
            SizedBox(
              height: 8,
            ),
            ProductSearchCard(
              productName: 'Cast Iron gears 15 inch 1050 rounded edges- PVC',
              productPrice: '7,000',
              views: '112',
              image: 'assets/images/product_1.png',
              description:
                  'A little brief about the product comes here A little brief about the products',
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
      Positioned(
          top: 160,
          right: 50,
          child: Container(
            width: 300,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              boxShadow: [
                BoxShadow(
                  spreadRadius: 5,
                  blurRadius: 5,
                  color: Colors.grey.withOpacity(0.4),
                )
              ],
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {
                      _searchController.clear();
                    }),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(50)),
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
          )),
    ]));
  }
}
