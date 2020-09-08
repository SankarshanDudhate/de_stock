import 'dart:ffi';

import 'package:destock/account_setting/confirm_logout.dart';
import 'package:destock/profile/utils/raised_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'confirm_deactivate_account.dart';

class PaymentDetails extends StatelessWidget {
  final card_details_1 = {
    'card_number': '**** **** **** 1234',
    'card_type': 'visa',
    'card_name': 'Atul Mehra',
    'expiry_date': '06/30'
  };
  final card_details_2 = {
    'card_number': '**** **** **** 1234',
    'card_type': 'mastercard',
    'card_name': 'Atul Mehra',
    'expiry_date': '06/30'
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          padding: EdgeInsets.only(left: 32.0),
          child: SvgPicture.asset("assets/icons/credit-card.svg"),
        ),
        title: Text(
          "Payment Details",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(0xffFAFAFA),
        elevation: 3,
      ),
      body: ListView(
        padding: EdgeInsets.all(24),
        children: [
          Text(
            "Your Saved cards",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xff6F6F6F),
                fontSize: 16),
          ),
          SizedBox(
            height: 16,
          ),
          SavedCard(card_details: card_details_1),
          SizedBox(
            height: 32,
          ),
          SavedCard(card_details: card_details_2)
        ],
      ),
    );
  }
}

class SavedCard extends StatelessWidget {
  void _showDialog(context) {
    showDialog(
      context: context,
      builder: (context) {
        // return ConfirmLogout();
        return ConfirmDeactivateAccount();
      },
    );
  }

  const SavedCard({
    Key key,
    @required this.card_details,
  }) : super(key: key);

  final Map<String, String> card_details;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RaisedContainer(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "CARD NUMBER",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              letterSpacing: 1.5,
                              color: Color(0xff9E9E9E),
                              fontSize: 12),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          card_details['card_number'],
                          style: TextStyle(
                            color: Color(0xff6F6F6F),
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                    SvgPicture.asset(
                      "assets/icons/" + card_details['card_type'] + '.svg',
                      height: 80,
                    )
                  ],
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "CARD NAME",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.5,
                            fontSize: 12,
                            color: Color(0xff9E9E9E),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          card_details['card_name'],
                          style: TextStyle(
                            color: Color(0xff6F6F6F),
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        )
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "EXPIRY DATE",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.5,
                            fontSize: 12,
                            color: Color(0xff9E9E9E),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          card_details['expiry_date'],
                          style: TextStyle(
                            color: Color(0xff6F6F6F),
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        )
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FlatButton(
              onPressed: () {
                _showDialog(context);
              },
              child: Text(
                "DELETE CARD",
                style: TextStyle(color: Color(0XFFD84764), fontSize: 16),
              ),
            )
          ],
        ),
      ],
    );
  }
}
