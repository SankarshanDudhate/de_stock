import 'package:flutter/material.dart';

import 'enquired_products.dart';
import 'my_wishlist.dart';

class Wishlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffD84764),
          toolbarHeight: 120,
          title: Container(
            padding: EdgeInsets.fromLTRB(24, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('My Wishlist'),
                Text(
                  '3 items added',
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24.0),
              child: IconButton(
                onPressed: () {},
                icon: Icon(Icons.share),
              ),
            )
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(24),
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              TabBar(
                labelPadding: EdgeInsets.all(16),
                labelStyle:
                    TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                labelColor: Color(0xffD84764),
                unselectedLabelColor: Colors.grey,
                indicatorColor: Color(0xffD84764),
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Text(
                    'My Wishlist',
                  ),
                  Text('Enquired products'),
                ],
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 24),
                  child: TabBarView(
                    children: [
                      MyWishlist(),
                      EnquiredProducts(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
