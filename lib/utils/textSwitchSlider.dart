import 'package:flutter/material.dart';

class textSwitchSlider extends StatefulWidget {
  final String offText;
  final String onText;

  final double fontSize;
  final double height;

  double width;

  textSwitchSlider({Key key, this.onText, this.offText, this.fontSize=20, this.height=60, this.width=220}) : super(key: key);
  @override
  textSwitchSliderState createState() => textSwitchSliderState();
}

class textSwitchSliderState extends State<textSwitchSlider> {
  bool isOn = true;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: widget.height,
          // width: widget.width,
          // margin: EdgeInsets.symmetric(horizontal:40),
          padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
          decoration: BoxDecoration(
            border: Border.all(
              color: Color(0xFFE6E6E6),
            ),
            borderRadius: BorderRadius.all(Radius.circular(60)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    this.isOn = true;
                  });
                },
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: isOn == true
                          ? Color(0xFF4B69FF)
                          : Color(0xFFFFFFFF),
                      // border: Border.all(
                      //   color : Color(0xFFFFFF),
                      // ),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Text(widget.onText,
                        style: isOn == true
                            ? TextStyle(
                                fontSize: widget.fontSize,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFFFFFF),
                            )
                            : TextStyle(
                                fontSize: widget.fontSize-2, color: Color(0xFF979797)))),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    this.isOn = false;
                  });
                },
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: isOn == false
                          ? Color(0xFF000000)
                          : Color(0xFFFFFFFF),
                      // border: Border.all(
                      //   color : Color(0xFFFFFF),
                      // ),
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Text(widget.offText,
                        style: isOn == false
                            ? TextStyle(
                                fontSize: widget.fontSize,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFFFFFF))
                            : TextStyle(
                                fontSize: widget.fontSize-2, color: Color(0xFF979797)))),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
