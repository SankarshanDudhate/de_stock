import 'package:destock/account_setting/change_password.dart';
import 'package:destock/account_setting/payment_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AccountSettings extends StatelessWidget {
  final List<String> top_title = [
    "Change password",
    "Payment details",
    "Logout",
    "Deactivate Account"
  ];
  final List<String> top_icons = [
    "key",
    "credit-card",
    "log-out",
    "x-octagon",
  ];
  final List<String> bot_title = [
    "FAQs",
    "Help",
    "Refer a friend",
    "Pricing Plans",
    "About us",
    "Feedback",
    "Terms and conditions",
  ];
  final List<String> bot_icons = [
    "help-circle",
    "message-square",
    "share",
    "tag",
    "user-check",
    "thumbs-up",
    "clipboard",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: Container(
          padding: EdgeInsets.fromLTRB(12, 15, 12, 12),
          child: SvgPicture.asset(
            "assets/icons/settings.svg",
          ),
        ),
        title: Container(
          padding: EdgeInsets.only(top: 5),
          child: Text(
            "Account Settings",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Color(0xefFAFAFA),
      ),
      body: ListView(children: [
        SizedBox(
          height: 24,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: top_title.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {
                if (top_title[index] == "Change password")
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ChangePassword()));
                else if (top_title[index] == "Payment details")
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PaymentDetails()));
              },
              leading: Container(
                padding: EdgeInsets.all(16.0),
                child: SvgPicture.asset(
                    "assets/icons/" + top_icons[index] + ".svg"),
              ),
              title: Text(top_title[index]),
            );
          },
        ),
        SizedBox(
          height: 16,
        ),
        Container(
          margin: EdgeInsets.all(16.0),
          color: Color(0xff979797),
          height: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: bot_title.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              onTap: () {},
              leading: Container(
                padding: EdgeInsets.all(16.0),
                child: SvgPicture.asset(
                    "assets/icons/" + bot_icons[index] + ".svg"),
              ),
              title: Text(bot_title[index]),
            );
          },
        ),
      ]),
    );
  }
}
