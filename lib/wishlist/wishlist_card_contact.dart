import 'package:flutter/material.dart';

class WishlistCardContact extends StatelessWidget {
  const WishlistCardContact({
    Key key,
    @required this.productImage,
    @required this.views,
    @required this.productName,
    @required this.productCategory,
    @required this.productPrice,
    @required ScrollController scrollController,
    @required this.maxQty,
    @required this.productDescription,
    @required this.message,
  })  : _scrollController = scrollController,
        super(key: key);

  final String productImage;
  final String views;
  final String productName;
  final String productCategory;
  final String productPrice;
  final String maxQty;
  final String productDescription;
  final String message;
  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              spreadRadius: 2,
              blurRadius: 5,
              color: Colors.grey.withOpacity(0.2),
            )
          ],
          color: Colors.white),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 140,
            child: Row(
              children: [
                Container(
                  width: 120,
                  height: 140,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: AssetImage(this.productImage),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            )
                          ],
                        ),
                      )
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
                          padding: EdgeInsets.only(right: 16),
                          child: Text(
                            this.productName,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(Icons.favorite_border),
                        )
                      ],
                    ),
                    Text(
                      "Category : " + this.productCategory,
                      style: TextStyle(
                          fontWeight: FontWeight.w400, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      "Price ₹" + productPrice,
                      style: TextStyle(fontSize: 14),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16, bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                          text: 'Max Qty  ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: this.maxQty),
                    ],
                  ),
                ),
                Text(
                  'SHARE',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Text(
            this.productDescription,
            maxLines: 3,
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 16,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Color(0xffD84764).withOpacity(0.2)),
            padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    'Quotation received',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    this.message,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FlatButton(
                        onPressed: () {},
                        padding:
                            EdgeInsets.symmetric(vertical: 16, horizontal: 80),
                        color: Color(0xffD84764),
                        shape: StadiumBorder(),
                        child: Text(
                          'Contact Seller',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )),
                  ],
                ),
                SizedBox(
                  height: 8,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
