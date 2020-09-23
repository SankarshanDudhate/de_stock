import 'dart:io';

import 'package:destock/wishlist/wishlist_card_contact.dart';
import 'package:destock/wishlist/wishlist_card_note.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class MyWishlist extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String description;
  final String image;
  final String views;
  final String category;

  const MyWishlist({
    Key key,
    this.productName,
    this.productPrice,
    this.description,
    this.image,
    this.views,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _fetchData() {
      sleep(Duration(seconds: 1));
      return get('https://jsonplaceholder.typicode.com/posts');
    }

    return FutureBuilder(
      future: _fetchData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData)
          return ListView(
            children: [
              WishlistCardNotes(
                productName: 'Cast Iron gears 15 inch 1050 rounded edges- PVC ',
                productImage: 'assets/images/product image.png',
                maxQty: '150 kgs',
                productCategory: 'Cast Iron gears',
                productDescription:
                    'Gears can be made of all sorts of materials, including many types of steel, brass, bronze, cast iron, ductile iron, aluminum, powdered metals...',
                message:
                    'Ask for the quote, about 1000kgs, later in the month. material not required now. Also ask for the durability of the material and ...',
                productPrice: '7000',
                scrollController: ScrollController(),
                views: '121',
              ),
              WishlistCardContact(
                productName: 'Cast Iron gears 15 inch 1050 rounded edges- PVC ',
                productImage: 'assets/images/product image.png',
                productCategory: 'Cast Iron gears',
                maxQty: '150 kgs',
                productDescription:
                    'Gears can be made of all sorts of materials, including many types of steel, brass, bronze, cast iron, ductile iron, aluminum, powdered metals...',
                message:
                    'Ask for the quote, about 1000kgs, later in the month. material not required now. Also ask for the durability of the material and ...',
                scrollController: ScrollController(),
                productPrice: '7000',
                views: '112',
              ),
              WishlistCardNotes(
                productName: 'Cast Iron gears 15 inch 1050 rounded edges- PVC ',
                productImage: 'assets/images/product image.png',
                productCategory: 'Cast Iron gears',
                maxQty: '150 kgs',
                productDescription:
                    'Gears can be made of all sorts of materials, including many types of steel, brass, bronze, cast iron, ductile iron, aluminum, powdered metals...',
                message:
                    'Ask for the quote, about 1000kgs, later in the month. material not required now. Also ask for the durability of the material and ...',
                scrollController: ScrollController(),
                productPrice: '7000',
                views: '112',
              )
            ],
          );
        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
