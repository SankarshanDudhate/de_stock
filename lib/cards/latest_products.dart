import 'package:flutter/material.dart';

class latest_products extends StatelessWidget {
  final String description;
  final String product_name;
  final String product_price;
  final Color color;

  final String image;

  const latest_products(
      {Key key,
      this.description,
      this.product_name,
      this.product_price,
      this.image,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: this.color,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            image,
            height: 110,
          ),
          Container(
            // width: 22,
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 172,
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
                    Icon(
                      Icons.favorite_border,
                      color: Colors.black,
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
    );
  }
}
