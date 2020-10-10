import 'package:flutter/material.dart';

class ProductSearchCard extends StatelessWidget {
  final String productName;
  final String productPrice;
  final String description;
  final String image;
  final String views;
  const ProductSearchCard(
      {Key key,
      this.productName,
      this.productPrice,
      this.views,
      this.image,
      this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: double.infinity,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              spreadRadius: 5,
              blurRadius: 2,
              color: Colors.grey.withOpacity(0.2),
            )
          ],
          color: Colors.white),
      child: Row(
        children: [
          Container(
            height: double.infinity,
            width: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: AssetImage(this.image),
                fit: BoxFit.fill,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.black.withOpacity(0.6),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.remove_red_eye,
                        size: 16,
                        color: Colors.white,
                      ),
                      Text(
                        ' ' + this.views,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 188,
                    child: Text(
                      this.productName,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.favorite_border),
                  )
                ],
              ),
              Text(
                "Price ₹" + productPrice,
                style: TextStyle(fontSize: 14),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  color: Color(0xffD84764).withOpacity(0.15),
                  child: Text(
                    "GEARBOX",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  )),
              Container(
                width: 216,
                child: Text(
                  this.description,
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                  maxLines: 2,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
