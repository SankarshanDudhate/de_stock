import 'package:destock/ProductPages/productPage.dart';
import 'package:flutter/material.dart';

class suggest_you extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 25), //from only horizontal to tlrb
      padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 20,
            color: Colors.black.withOpacity(.16),
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          product_card_suggest(
            product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
            product_price: "7000",
            description: "A little brief about the product comes brief about",
            image: "assets/images/product image.png",
          ),
          Divider(color: Colors.black),
          product_card_suggest(
            product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
            product_price: "7000",
            description: "A little brief about the product comes brief about",
            image: "assets/images/product image.png",
          ),
          Divider(color: Colors.black),
          product_card_suggest(
            product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
            product_price: "7000",
            description: "A little brief about the product comes brief about",
            image: "assets/images/product image.png",
          ),
        ],
      ),
    );
  }
}

class product_card_suggest extends StatelessWidget {
  final String description;
  final String product_name;
  final String product_price;

  final String image;

  const product_card_suggest(
      {Key key,
      this.description,
      this.product_name,
      this.product_price,
      this.image})
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
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            Image.asset(
              image,
              height: 110,
            ),
            Container(
              width: 180,
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 120,
                        height: 28,
                        child: Text(
                          product_name,
                          textAlign: TextAlign.left,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                      Text(
                        "View",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff4DA4D6)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Price ₹ " + product_price,
                    style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: Color(0xff6F6F6F)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 180,
                    child: Text(
                      description,
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff6F6F6F)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
