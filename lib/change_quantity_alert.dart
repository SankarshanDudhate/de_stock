import 'package:flutter/material.dart';

class ChangeQuantityAlert extends StatefulWidget {
  @override
  _ChangeQuantityAlertState createState() => _ChangeQuantityAlertState();
}

class _ChangeQuantityAlertState extends State<ChangeQuantityAlert> {
  bool _available = true;
  var _dropdownValue = 1;
  void _showDailog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context, setState) {
              return AlertDialog(
                titlePadding: EdgeInsets.all(16),
                title: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.all(2.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.grey[300]),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FlatButton(
                            onPressed: () {
                              setState(() {
                                _available = true;
                                print(_available);
                              });
                            },
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 24),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            color: (_available) ? Color(0xff4B69FF) : null,
                            child: Text(
                              "Available",
                              style: (_available)
                                  ? TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)
                                  : TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                            ),
                          ),
                          FlatButton(
                            onPressed: () {
                              setState(() {
                                _available = false;
                                print(_available);
                              });
                            },
                            padding: EdgeInsets.symmetric(
                                vertical: 16, horizontal: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            color: (!_available) ? Color(0xffD84764) : null,
                            child: Text(
                              "Out of Stock",
                              style: (!_available)
                                  ? TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)
                                  : TextStyle(
                                      color: Colors.grey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                contentPadding: EdgeInsets.all(16.0),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "CHANGE QUANTITY",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: (!_available) ? Colors.grey : null),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        Container(
                          height: 40,
                          width: 160,
                          child: TextField(
                            textAlignVertical: TextAlignVertical.center,
                            style: TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                              enabled: _available,
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 0, horizontal: 8),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(4)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(4)),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.horizontal(
                                    left: Radius.circular(4)),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 120,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(4)),
                            color: (_available) ? Colors.black : Colors.grey,
                          ),
                          child: DropdownButtonHideUnderline(
                            child: Center(
                              child: DropdownButton(
                                value: _dropdownValue,
                                dropdownColor: Colors.black,
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                                icon: Icon(Icons.keyboard_arrow_down),
                                items: [
                                  DropdownMenuItem(
                                    child: Text("kg"),
                                    value: 1,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("ton"),
                                    value: 2,
                                  ),
                                  DropdownMenuItem(
                                    child: Text("more ton"),
                                    value: 3,
                                  ),
                                ],
                                onChanged: (_available)
                                    ? (value) {
                                        setState(() {
                                          _dropdownValue = value;
                                        });
                                      }
                                    : (value) {},
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      "Maximum stock a customer can purchase",
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    FlatButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {},
                      child: Text("CONFIRM"),
                      textColor: Color(0xff4B69FF),
                    )
                  ],
                ),
              );
            },
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          child: Text('Show alert'),
          onPressed: () {
            _showDailog(context);
          },
        ),
      ),
    );
  }
}
