import 'package:destock/ProductPages/productPage.dart';
import 'package:flutter/material.dart';

class product_card_home extends StatelessWidget {
  final String product_name;
  final String product_price;
  final String image;

  const product_card_home(
      {Key key, this.product_name, this.product_price, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            new MaterialPageRoute(builder: (BuildContext context) {
              return productPage();
            })
        );
      },
      child: Container(
        width: 180,
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 24,
              color: Colors.black.withOpacity(.16),
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset(
              image,
              height: 150,
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              width: 150,
              height: 30,
              child: Text(
                product_name,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
                maxLines: 2,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Price ₹ " + product_price,
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff4B69FF)),
                ),
                Text(
                  "Contact",
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffD84764)),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class product_card_trending extends StatelessWidget {
  final String product_name;
  final String product_price;
  final String image;

  const product_card_trending(
      {Key key, this.product_name, this.product_price, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
            new MaterialPageRoute(builder: (BuildContext context) {
              return productPage();
            })
        );
      },
      child: Container(
        width: 180,
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 24,
              color: Colors.black.withOpacity(.16),
            ),
          ],
        ),
        child: Column(
          children: [
            Image.asset(
              image,
              height: 150,
            ),
            SizedBox(
              height: 4,
            ),
            Container(
              width: 150,
              height: 30,
              child: Text(
                product_name,
                maxLines: 2,
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Price ₹ " + product_price,
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffA5A5A5)),
                ),
                Text(
                  "View",
                  style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                      color: Colors.blue),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
