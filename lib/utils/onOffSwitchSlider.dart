import 'package:flutter/material.dart';


typedef sliderStateChangedCallback = void Function(bool state);

// ignore: camel_case_types
class onOffSwitchSlider extends StatefulWidget {
  final double height;
  sliderStateChangedCallback onTap;

  onOffSwitchSlider({Key key, this.height=50, this.onTap}) : super(key: key);
  @override
  onOffSwitchSliderState createState() => onOffSwitchSliderState();
}

class onOffSwitchSliderState extends State<onOffSwitchSlider> {
  bool isOn = false;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              this.isOn = (this.isOn) ? false : true; //toggle it
              widget.onTap(isOn);
            });
          },
          child: Container(
            height: 40,
            width: 80,
            // margin: EdgeInsets.symmetric(horizontal:40),
            // padding: EdgeInsets.symmetric(horizontal: 2, vertical: 2),
            decoration: BoxDecoration(
              border: Border.all(
                color: Color(0xFFE6E6E6),
              ),
              borderRadius: BorderRadius.all(Radius.circular(60)),
            ),
            child: (this.isOn) ? Image.asset("assets/images/onOffSwitch_on.png") : Image.asset("assets/images/onOffSwitch_off.png"),
          ),
        ),
      ],
    );
  }
}
