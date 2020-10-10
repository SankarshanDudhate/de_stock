import 'package:destock/account_setting/confirm_logout.dart';
import 'package:destock/utils/raised_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'confirm_deactivate_account.dart';

class PaymentDetails extends StatefulWidget {
  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {
  final RegExp visaRegEx = new RegExp(r"^4[0-9]{12}(?:[0-9]{3})?$");
  final RegExp masterCardRegEx = new RegExp(
      r"^5[1-5][0-9]{14}|^(222[1-9]|22[3-9]\\d|2[3-6]\\d{2}|27[0-1]\\d|2720)[0-9]{12}$");

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

  addCardAlert(context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController _cardController = TextEditingController();
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _monthController = TextEditingController();
    final TextEditingController _yearController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text('Add New Card')),
          content: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: TextFormField(
                    controller: _cardController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "Card Number"),
                    validator: (value) {
                      if (visaRegEx.hasMatch(_cardController.value.text) ||
                          masterCardRegEx
                              .hasMatch(_cardController.value.text)) {
                        return null;
                      }
                      return "Only MasterCard and Visa Card accepted";
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 160,
                      child: TextFormField(
                        controller: _nameController,
                        decoration:
                            InputDecoration(labelText: "Card Holder Name"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Enter a Name";
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 80,
                      child: TextFormField(
                        controller: _monthController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Month",
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Enter Month";
                          } else if (int.parse(value) < 0 ||
                              int.parse(value) > 12) {
                            return 'Invalid';
                          }
                          return null;
                        },
                      ),
                    ),
                    Text(' /  '),
                    Container(
                      width: 80,
                      child: TextFormField(
                        controller: _yearController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: "Year",
                          border: InputBorder.none,
                        ),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Enter Month";
                          } else if (int.parse(value) < DateTime.now().year) {
                            return 'Invalid';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          actions: [
            FlatButton(
              onPressed: () {
                print(formKey.currentState.validate());
              },
              child: Text("Add"),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Cancel"),
            ),
          ],
        );
      },
    );
  }

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
        actions: [
          IconButton(
            icon: Icon(
              Icons.add,
              color: Colors.black,
            ),
            onPressed: () {
              addCardAlert(context);
            },
          )
        ],
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
          SavedCard(card_details: card_details_2),
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
  // void _showDialog(context) {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       // return ConfirmLogout();
  //       return ConfirmDeactivateAccount();
  //     },
  //   );
  // }

  const SavedCard({
    Key key,
    @required this.card_details,
  }) : super(key: key);

  final Map<String, String> card_details;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
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
                // _showDialog(context);
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
