//import 'dart:html';

import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:destock/PostAnAd/postAd_3.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';


// ignore: camel_case_types
class postAd_2 extends StatefulWidget {
  @override
  _postAd_2State createState() => _postAd_2State();
}

// ignore: camel_case_types
class _postAd_2State extends State<postAd_2> {
  SharedPreferences prefs;

  File _image;
  final _picker = ImagePicker();
  List<String> allFiles = new List();
  Map<String, String> filePathsMap;
  List<String> filePaths = new List();

  _fileOpener() async {
    filePathsMap = await FilePicker.getMultiFilePath( type: FileType.custom, allowedExtensions: ['jpg','png','jpeg'],);
    // print(files.toString());
    for(var filePath in filePathsMap.values ) {
      filePaths.add(filePath);
    }
    print(filePaths.toString());
    setState(() {
      this.allFiles.addAll(filePaths);
    });
    //print(allFiles);
    //Navigator.of(context).pop();
  }

  Future _getImage(BuildContext context) async {
    PickedFile image = await _picker.getImage(source: ImageSource.camera);
    setState(() {
      // _image = File(image.path);
      // this.allFiles.add(_image);
      this.allFiles.add(image.path);
      //print(allFiles);
    });
    //Navigator.of(context).pop();
  }

  // Widget _showSelectedImages(BuildContext context) {
  //   if(allFiles.isEmpty){
  //     return _chooseMethod();
  //   }
  //   else {
  //     return _addMore();
  //   }
  // }

  Widget _addMore() {
    return Column(
      children: [
        _buildImageCard(),
        SizedBox(height: 20,),
        GestureDetector(
          onTap: () {
              _buildDialogue(context);
            },
          child: Text('Add More..',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold))),
      ],
    );
  }

  void _buildDialogue(BuildContext context) {

    var alertDialog = AlertDialog(
      content :
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _chooseMethod(),
            ],
          ),
      shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.all(Radius.circular(10.0))
           ),
      // actions: <Widget>[
      //   FlatButton(
      //       onPressed: () {
      //         Navigator.of(context).pop();
      //       },
      //       child: Icon(Icons.cancel)
      //   )
      // ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      }
    );
  }

  Widget _chooseMethod() {
    return Column(
                //crossAxisAlignment: CrossAxisAlignment.center,
                children:[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                    offset: Offset(0, 4),
                                    blurRadius: 10,
                                    color: Colors.black.withOpacity(.16),
                                  ),
                                    ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                 Icon(Icons.camera_enhance , color: Colors.black,size: 30,),
                                //SizedBox(width:30),
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
                                      offset: Offset(0, 4),
                                      blurRadius: 10,
                                      color: Colors.black.withOpacity(.16),
                                    ),
                                    ],
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.photo , color: Colors.black,size: 30,),
                                //SizedBox(width:30),
                                Flexible(child: Text("Select From Gallery", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold))),
                              ],
                            ),
                          ),
                    ),
                  )]);
  }

  _removeFromList(BuildContext context,index){
    setState(() {
      this.allFiles.removeAt(index);
    });
  }

  Widget _buildImageCard(){
    return ListView.builder(
      itemCount: allFiles.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, index) => Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: EdgeInsets.symmetric(vertical:10),
        decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5),),
          color: Color(0xffffffff),
          // boxShadow: [
          //   BoxShadow(
          //     offset: Offset(2, 2),
          //     blurRadius: 40,
          //     color: Colors.black.withOpacity(.16),
          //   ),
          // ],
      ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              child: Image.file(File(allFiles[index]),height: 60, width:60),
            ),
            //SizedBox(width: 10,),
            Text("PIC" + (index+1).toString(), style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:[
                InkWell(
                  onTap: () {
                    _removeFromList(context,index);
                    print(allFiles);
                  },
                  child: Icon(Icons.cancel,color: Colors.grey,)
                  ),
              ]
            )
          ]
        )
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
              child: Padding(
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
        //_showSelectedImages(context),
        Padding(
          padding: EdgeInsets.symmetric(horizontal:30),
          child: Column(
            children: [
              allFiles.isEmpty ? _chooseMethod()
              : _addMore(),
            ],
          ),
        ),
        SizedBox(height: 20,),
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
              onTap: () async {
                if(allFiles.isNotEmpty && allFiles.length<=10){
                  //Use allFiles to store image paths into database
                  prefs = await SharedPreferences.getInstance();
                  var adData = prefs.getString("postAnAdData");
                  //print(adData);
                  var adDataJson = jsonDecode(adData);
                  adDataJson["images"] = jsonEncode(allFiles);
                  print(adDataJson);
                  adData = jsonEncode(adDataJson);
                  prefs.setString("postAnAdData", adData);
                  Navigator.push(context, new MaterialPageRoute(
                      builder: (BuildContext context) => new postAd_3() ),
                  );
                }
                else{
                  _buildErrorDialogue(context);
                }
              },
                  child: Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 50),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFFFC0151),
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
      ),
    );
  }
}


void _buildErrorDialogue(BuildContext context) {

    var alertDialog = AlertDialog(
      content : Text("Only 10 Images are Allowed.\n Cancel excess images"),
      shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.all(Radius.circular(10.0))
               ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      }
    );
  }