import 'package:flutter/material.dart';

import 'my_wishlist.dart';

class WishlistAndEnquiry extends StatelessWidget {
  WishlistAndEnquiry(this.userId, this.shareableKey);
  String userId;
  String shareableKey;

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
                Text('Wishlist of user #'+userId),
                // Text(
                //   '3 items added',
                //   style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
                // ),
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
          child: MyWishlist(userId: this.userId, shareableKey: this.shareableKey,)
        ),
      ),
    );
  }
}
