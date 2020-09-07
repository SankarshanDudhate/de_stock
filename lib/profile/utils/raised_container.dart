// ignore: must_be_immutable
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RaisedContainer extends StatelessWidget {
  RaisedContainer({
    this.height,
    this.child,
    Key key,
  }) : super(key: key);
  final double height;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          // border: Border.all(width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
            )
          ]),
      height: this.height,
      child: this.child,
    );
  }
}
