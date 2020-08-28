import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class background extends StatefulWidget {
  background({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _backgroundState createState() => _backgroundState();
}

class _backgroundState extends State<background> {







  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child:Container(

              height: MediaQuery.of(context).size.height,
              child:SvgPicture.asset("assets/icons/bg_circle.svg"),
            )
        )
    );
  }
}
