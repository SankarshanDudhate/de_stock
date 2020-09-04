//import 'dart:html';

import 'dart:io';

import 'package:destock/postAd_3.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';


// ignore: camel_case_types
class postAd_2 extends StatefulWidget {
  @override
  _postAd_2State createState() => _postAd_2State();
}

// ignore: camel_case_types
class _postAd_2State extends State<postAd_2> {

  File _image;
  List<File> allFiles = new List();
  List<File> files = new List();

  _fileOpener() async {
    files = await FilePicker.getMultiFile( type: FileType.custom, allowedExtensions: ['jpg','png','jpeg'],);
    allFiles.addAll(files);
    print(allFiles);
  }

  _getImage(BuildContext context) async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    this.setState(() {
      _image = image;
      allFiles.add(_image);
      print(allFiles);
    });
    //Navigator.of(context).pop();
  }

  Widget _showSelectedImages(BuildContext context) {
    if(allFiles.isEmpty){
      return _chooseMethod();
    }
    else {
      return _addMore();
    }
  }

  Widget _addMore() {
    return Column(
      children: [
        Text('Images Added!'),
        SizedBox(height: 20,),
        GestureDetector(
          onTap: () {
              _getImage(context);
            },
          child: Text('Add More..',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold))),

      ],
    );
  }

  Widget _chooseMethod() {
    return Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: GestureDetector(
                      onTap: () {
                        _getImage(context);
                      },
                        child: Container(
                            //height: 50,
                            padding: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                color: Colors.white,
                                boxShadow: [
                                              BoxShadow(
                                    color: Colors.grey[200],
                                    blurRadius: 2.0,
                                    offset: Offset(0, 5))
                                    ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Icon(Icons.camera_enhance , color: Colors.black,size: 30,),
                                SizedBox(width:30),
                                Flexible(child: Text("Take Pictures", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold))),
                              ],
                            ),
                          ),
                    ),
                  ),
                  SizedBox(height:50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "OR",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 20.0,
                    fontFamily: "Arial",
                    fontWeight: FontWeight.bold),
              ),
            ],
            ),
            SizedBox(height:50),
              Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: GestureDetector(
                      onTap: () {
                        _fileOpener();
                      },
                          child: Container(
                            //height: 50,
                            padding: EdgeInsets.symmetric(horizontal: 0,vertical: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(60),
                                color: Colors.white,
                                 boxShadow: [
                                              BoxShadow(
                                    color: Colors.grey[200],
                                    blurRadius: 2.0,
                                    offset: Offset(0, 5))
                                    ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Icon(Icons.photo , color: Colors.black,size: 30,),
                                SizedBox(width:30),
                                Flexible(child: Text("Select From Gallery", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold))),
                              ],
                            ),
                          ),
                    ),
                  )]);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height:50),
            Row(
            children: [
              Text(
                "Step 2",
                style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 20.0,
                    fontFamily: "Arial",
                    fontWeight: FontWeight.bold),
              ),
            ],
            ),
            SizedBox(height:10),
            Row(
              children: [
                Text('UPLOAD PRODUCT IMAGES',
                style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                )),
              ],
              ),
              SizedBox(height: 50),
              _showSelectedImages(context),
                  SizedBox(height:50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                 "Instructions\n1.Ensure the image is clear\n2. Maximum 10 images can be\nuploaded for a single product",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                    fontFamily: "Arial",
                    //fontWeight: FontWeight.bold
                    ),
              ),
            ],
            ),
            SizedBox(height:30),
            GestureDetector(
                    onTap: () {
                      if(allFiles.isNotEmpty && allFiles.length <10){
                              //Use allFiles to store into database
                              Navigator.pushReplacement(context, new MaterialPageRoute(
                                  builder: (BuildContext context) => new postAd_3() ),
                              );
                      }
                      else{
                        
                      }
                    },
                        child: Container(
                            height: 50,
                            margin: EdgeInsets.symmetric(horizontal: 50),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.redAccent,
                            ),
                            child: Center(
                              child: Text("NEXT", style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold)),
                            ),
                          ),
                  ),
                  SizedBox(height:30)
          ],
        ),
      ),
    );
  }
}