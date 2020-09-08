import 'package:flutter/material.dart';

class ConfirmDeactivateAccount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      title: Text(
        "Are you sure you want to Deactivate your account?",
        textAlign: TextAlign.center,
      ),
      titlePadding: EdgeInsets.only(top: 40, left: 24, right: 24, bottom: 20),
      titleTextStyle: TextStyle(
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
      contentPadding: EdgeInsets.all(0),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "All the product details and your saved items will be lost.",
              textAlign: TextAlign.center,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: OutlineButton(
                  padding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(10))),
                  onPressed: () {},
                  highlightedBorderColor: Colors.grey,
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "CANCEL",
                      style: TextStyle(
                          color: Color(0xff6F6F6F),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: OutlineButton(
                  padding: EdgeInsets.all(0),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(10))),
                  onPressed: () {},
                  splashColor: Color(0xffD84764),
                  highlightedBorderColor: Color(0xffD84764),
                  child: Container(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "YES",
                      style: TextStyle(
                          color: Color(0xffD84764),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
