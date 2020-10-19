import 'dart:developer';

import 'package:destock/CONSTANTS.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ImageCarousel extends StatefulWidget {
  List<String> imageList;

  ImageCarousel({this.imageList});

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _current = 0;
  List<String> imgList;
  // [
  //   'assets/images/IMG1.png',
  //   'assets/images/IMG2.png',
  //   'assets/images/IMG2.png',
  //   'assets/images/IMG1.png',
  // ];

  @override
  void initState() {
    super.initState();
    setState(() {
      imgList = widget.imageList;
      log(imgList.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          height:300,
          //enlargeCenterPage: true,
          //autoPlay: true,
          //autoPlayCurve: Curves.fastOutSlowIn,
          enableInfiniteScroll: false,
          //autoPlayAnimationDuration: Duration(milliseconds: 500),
          viewportFraction: 0.7,
          aspectRatio: 1/1,
          onPageChanged: (index) {
              setState(() {
                _current = index;
                //print("${_current}");
              });
            },
          itemCount: imgList.length,
          itemBuilder: (BuildContext context, int itemIndex) =>
            Container(
              margin: EdgeInsets.all(10),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                child: Image.network(localhostAddress+imgList[itemIndex], fit: BoxFit.cover, width: 1000))
                // child: Image.asset(imgList[itemIndex], fit: BoxFit.cover, width: 1000))
          ),
        ),
        //SizedBox(height:5),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          //mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizedBox(
              height: 30,
              child: ListView.builder(
              shrinkWrap: true,
              itemCount: imgList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                width: 8.0,
                height: 8.0,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: _current == index
                        ? Color.fromRGBO(0, 0, 0, 0.9)
                        : Color.fromRGBO(0, 0, 0, 0.4)),
              );
                }
              ),
            ),
          ],
        )
      ],
    );
  }
}