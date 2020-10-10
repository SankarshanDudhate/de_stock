import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  @override
  _RadioButtonState createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {

  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(50),
        // Use below container for slide-radio button
        child: Container(
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  if(check == true) {
                    setState(() {
                      this.check = false;
                    });
                  }
                  else{
                    setState(() {
                      this.check = true;
                    });
                  }
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal:3, vertical:3),
                  decoration: BoxDecoration(
                    color: check == false ? Color(0xFFC6C6C6) : Color(0xFFD84764),
                    border: Border.all( 
                      color : check == false ? Color(0xFFE6E6E6) : Color(0xFFFC0151),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(60)
                    ),
                  ),
                  child: Row(
                    children: [
                      check == false? Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFFFFFFF),
                        boxShadow: [
                        BoxShadow(
                          offset: Offset(3, 3),
                          blurRadius: 5,
                          color: Colors.black.withOpacity(.32),
                        ),]
                        ),
                    )
                    : Container(
                      height: 30,
                      width: 30,
                    ),
                    check == true? Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFFFFFFFF),
                        boxShadow: [
                        BoxShadow(
                          offset: Offset(-3, 3),
                          blurRadius: 5,
                          color: Colors.black.withOpacity(.32),
                        ),]),
                    )
                    : Container(
                      height: 30,
                      width: 30,
                    ),

                    ]),
                ),
              ),
            ],
          ),
        )
      ),
    );
  }
}