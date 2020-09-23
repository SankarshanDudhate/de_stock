import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'enquiry_product_card.dart';

class EnquiredProducts extends StatelessWidget {
  _getEnquiryData() {
    sleep(Duration(seconds: 1));
    return get('https://jsonplaceholder.typicode.com/posts');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getEnquiryData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView(
            children: [
              EnquiryProductCard(
                productName: 'Aluminium Gears 150 pieces and rounded edges',
                productImage: 'assets/images/product image.png',
                productCategory: 'GEARBOX',
                productCost: '7,000',
                profileImage: 'assets/images/product image.png',
                profileName: 'Mittal Steels',
                qty: '30 kg',
                date: 'Aug 21, 2020',
                message:
                    'Hello sir,\nwe have stock of about 100 kgs and you can visit our pithampur based factory on August 21 to pick up the stock. 100 kgs stock would cost you ₹ 50,000',
                enquiryMessage:
                    'I wanted to enquire that what would be the price of above mentioned quantity and how can I cone and pickup my order from your site.\nAlso what time will be suitable for you?',
              ),
              EnquiryProductCard(
                productName: 'Aluminium Gears 150 pieces and rounded edges',
                productImage: 'assets/images/product_1.png',
                productCategory: 'GEARBOX',
                productCost: '7,000',
                profileImage: 'assets/images/product image.png',
                profileName: 'Mittal Steels',
                qty: '30 kg',
                date: 'Aug 21, 2020',
                message:
                    'Hello sir,\nwe have stock of about 100 kgs and you can visit our pithampur based factory on August 21 to pick up the stock. 100 kgs stock would cost you ₹ 50,000',
                enquiryMessage:
                    'I wanted to enquire that what would be the price of above mentioned quantity and how can I cone and pickup my order from your site.\nAlso what time will be suitable for you?',
              ),
              EnquiryProductCard(
                productName: 'Aluminium Gears 150 pieces and rounded edges',
                productImage: 'assets/images/product_3.png',
                productCategory: 'GEARBOX',
                productCost: '7,000',
                profileImage: 'assets/images/product image.png',
                profileName: 'Mittal Steels',
                qty: '30 kg',
                date: 'Aug 21, 2020',
                message:
                    'Hello sir,\nwe have stock of about 100 kgs and you can visit our pithampur based factory on August 21 to pick up the stock. 100 kgs stock would cost you ₹ 50,000',
                enquiryMessage:
                    'I wanted to enquire that what would be the price of above mentioned quantity and how can I cone and pickup my order from your site.\nAlso what time will be suitable for you?',
              ),
            ],
          );
        }

        return Center(child: CircularProgressIndicator());
      },
    );
  }
}
