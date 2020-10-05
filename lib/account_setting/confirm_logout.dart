import 'package:flutter/material.dart';

class ConfirmLogout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      title: Text("Are you sure want to logout?"),
      titlePadding: EdgeInsets.all(40),
      titleTextStyle: TextStyle(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
      contentPadding: EdgeInsets.all(0),
      content: Row(
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
                  "NO",
                  style: TextStyle(
                      color: Color(0xff4B69FF), fontWeight: FontWeight.bold),
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
              splashColor: Colors.blue,
              child: Container(
                padding: EdgeInsets.all(16),
                child: Text(
                  "YES",
                  style: TextStyle(
                      color: Color(0xff4B69FF), fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
