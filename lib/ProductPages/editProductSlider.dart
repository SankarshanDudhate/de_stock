import 'package:carousel_slider/carousel_slider.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class editProductSlider extends StatefulWidget {
  @override
  _editProductSliderState createState() => _editProductSliderState();
}

class _editProductSliderState extends State<editProductSlider> {

  final _picker = ImagePicker();
  List<String> allFiles = new List();
   Map<String, String> filePathsMap;
  List<String> filePaths = new List();

  final List<String> imgList = [
    'assets/images/IMG1.png',
    'assets/images/IMG2.png',
    'assets/images/IMG2.png', 
    'assets/images/IMG1.png',
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      allFiles.addAll(imgList);
  }

  _fileOpener() async {
    filePathsMap = await FilePicker.getMultiFilePath( type: FileType.custom, allowedExtensions: ['jpg','png','jpeg'],);
    for(var filePath in filePathsMap.values ) {
      filePaths.add(filePath);
    }
    print(filePaths.toString());
    setState(() {
      this.allFiles.addAll(filePaths);
    });
    filePaths.clear();
  }

  Future _getImage(BuildContext context) async {
    PickedFile image = await _picker.getImage(source: ImageSource.camera);
    setState(() {
      this.allFiles.add(image.path);
    });
  }

   _removeFromList(BuildContext context,index){
    setState(() {
      this.allFiles.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
            padding: EdgeInsets.symmetric(vertical:20),
            child: Column(
              children: [
                CarouselSlider.builder(
                  height: 280,
                  //enlargeCenterPage: true,
                  //autoPlay: true,
                  //autoPlayCurve: Curves.fastOutSlowIn,
                  enableInfiniteScroll: false,
                  //autoPlayAnimationDuration: Duration(milliseconds: 500),
                  viewportFraction: 0.6,
                  aspectRatio: 1/1,
                  //initialPage: 1,
                  onPageChanged: (index) {
                      setState(() {
                        //_current = index;
                        //print("${_current}");
                      });
                    },
                  itemCount: allFiles.length,
                  itemBuilder: (BuildContext context, int itemIndex) =>
                    Stack(
                        children: [
                          Container(
                            margin: EdgeInsets.all(15),
                            child: ClipRRect(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              child: Image.asset(allFiles[itemIndex], fit: BoxFit.cover, width: 280,height: 280,))
                          ),
                          Positioned(
                            top: -5,
                            right: -5,
                            child: IconButton(
                              onPressed: () {
                                _removeFromList(context, itemIndex);
                              },
                              icon: Icon(Icons.cancel,color: Colors.white,size: 35,),
                            ),
                          ),
                        ]
                    ),
                ),
                SizedBox(height:10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20),
                  child: Row(
                    children: [
                      Text('Add another image', style: TextStyle(color: Color(0xFF4B69FF),fontWeight: FontWeight.bold,fontSize: 22),),
                    ],
                  ),
                ),
                SizedBox(height:20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20),
                  child: Row(
                    children: [
                      Expanded(
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
                                    //SizedBox(width:10),
                                    Flexible(child: Text("Take Pictures", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold))),
                                  ],
                                ),
                              ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
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
                                    //SizedBox(width:10),
                                    Flexible(child: Text("Select From Gallery", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold))),
                                  ],
                                ),
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}