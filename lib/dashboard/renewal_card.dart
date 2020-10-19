import 'package:destock/CONSTANTS.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class renewal_card extends StatelessWidget {
  final List data;
  var renew_edit = "EDIT";
  bool autoRenew;

  renewal_card({Key key, this.data, this.autoRenew = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        color: Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 40,
            color: Colors.black.withOpacity(.16),
          ),
        ],
      ),
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 10,
              color: Colors.black.withOpacity(.16),
            ),
          ],
        ),
        child: Column(
          children: List.generate((data.length > 3) ? 3 : data.length, (index) {
            return Row(
              children: [
                // Image.asset(
                //   "assets/images/product image.png",
                //   height: 60,
                // ),
                Image.network(
                  localhostAddress+data[index]['image'],
                  // width: 60, //TODO change image width, right now they maintain aspect ratio
                  height: 60,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 190,
                        child: Text(
                          '#' + data[index]['id'].toString(),
                          //Change it to randomId
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: 280,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  (this.autoRenew)
                                      ? "Auto-renewal on"
                                      : "Expires on",
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff6e6e6e)),
                                ),
                                Text(
                                  data[index]['expiryDate'],
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff6e6e6e)),
                                ),
                              ],
                            ),
                            buildActionButton(), //TODO move this out of column... wrap the padding with a row maybe,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget buildActionButton() {
    if(this.autoRenew)
      return GestureDetector(
        onTap: () {}, //TODO navigate to appropriate page(editProduct page, maybe?)
        child: Text(
          "EDIT",
          textAlign: TextAlign.right,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xff2DDDB7)),
        ),
      );
    else
      return GestureDetector(
        onTap: () {}, //TODO navigate to appropriate page(payment page, maybe?)
        child: Text( //TODO wrap this with container and backgroundcolor to it
          "RENEW",
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xff2DDDB7)
          ),
        ),
      );
  }
}
