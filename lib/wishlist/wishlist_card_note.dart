import 'package:flutter/material.dart';

class WishlistCardNotes extends StatelessWidget {
  const WishlistCardNotes({
    Key key,
    @required this.productImage,
    @required this.views,
    @required this.productName,
    @required this.productPrice,
    @required this.productCategory,
    @required this.maxQty,
    @required this.productDescription,
    @required this.message,
    @required ScrollController scrollController,
  })  : _scrollController = scrollController,
        super(key: key);

  final String productImage;
  final String views;
  final String productName;
  final String productCategory;
  final String productPrice;
  final ScrollController _scrollController;
  final String maxQty;
  final String productDescription;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
                color: Color(0xff4B69FF).withOpacity(0.2)),
            padding: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16.0, horizontal: 4),
                  child: Text(
                    'NOTES',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Container(
                    height: 140,
                    // width: 240,
                    margin: EdgeInsets.all(8),
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.grey)),
                    child: Scrollbar(
                      controller: _scrollController,
                      // isAlwaysShown: true,
                      child: ListView(
                        padding: EdgeInsets.all(8),
                        children: [
                          Text(
                            this.message,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.phone,
                    color: Color(0xff4B69FF),
                  ),
                  label: Text(
                    "Contact Seller",
                    style: TextStyle(
                        color: Color(0xff4B69FF), fontWeight: FontWeight.bold),
                  ),
                  shape:
                      StadiumBorder(side: BorderSide(color: Color(0xff4B69FF))),
                ),
                FlatButton(
                  onPressed: () {},
                  padding: EdgeInsets.symmetric(horizontal: 24),
                  child: Text(
                    'Request a quote',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  shape: StadiumBorder(),
                  color: Color(0xff4B69FF),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
