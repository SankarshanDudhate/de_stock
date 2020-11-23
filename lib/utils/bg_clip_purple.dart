import 'package:flutter/material.dart';

// ignore: must_be_immutable
class BgClipPurple extends StatelessWidget {
  double height;
  BgClipPurple({
    this.height,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipPath(
        clipper: BgClipper(),
        child: Container(
          color: Color(0XFF4B69FF),
          height: height,
        ),
      ),
    );
  }
}

class BgClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.lineTo(size.width, 0.0);
    path.lineTo(size.width, size.height - 100.0);
    path.lineTo(0, size.height);
    path.lineTo(0, 100);
    path.lineTo(size.width, 0.0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}