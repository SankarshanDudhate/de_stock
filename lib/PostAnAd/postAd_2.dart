//import 'dart:html';

import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:destock/PostAnAd/postAd_3.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';


// ignore: camel_case_types
class PostAd2 extends StatefulWidget {
  @override
  _PostAd2State createState() => _PostAd2State();
}

// ignore: camel_case_types
class _PostAd2State extends State<PostAd2> {
  SharedPreferences prefs;

  File _image;
  int status;
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
    }
    );
    filePaths.clear();
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
                    color: Color(0xFF4B69FF),
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
                  child: Icon(Icons.cancel,color: Color(0xFFD3E3FF),)
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
          Center(
              child: Text(
                "3 Out of 5",
                style: TextStyle(
                    color: Color(0xff979797),
                    fontWeight: FontWeight.w400,
                    fontSize: 18),
              ),
            ),
            SvgPicture.asset("assets/icons/progress_step_3.svg"),
            SizedBox(height:20),
          Row(
          children: [
        Text(
          "Step 3",
          style: TextStyle(
              color: Color(0xFF4B69FF),
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
                      builder: (BuildContext context) => new PostAd3() ),
                  );
                }
                else{
                  if(allFiles.isEmpty){
                    status = 0;
                  }
                  else{
                    status = 1;
                  }
                  _buildErrorDialogue(context,status);
                }
              },
                  child: Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 30),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
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


void _buildErrorDialogue(BuildContext context,int status) {

    var alertDialog = AlertDialog(
      content : Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          status == 0 ? Text("Enter at least 1 image")
          : status == 1? Text("You've already selected 10 images")
          : Text(''),
          SizedBox(height: 20,),
          Text('Ok',style: TextStyle(fontSize:18,color:Color(0xFF4B69FF)),)
        ],
      ),
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