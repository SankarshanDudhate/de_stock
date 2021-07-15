import 'package:destock/ProductPages/ImageCarousel.dart';
import 'package:destock/utils/bg_clip_purple.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'confirmDialog.dart';
import 'editQuantityDialog.dart';

class productPageSeller extends StatefulWidget {

  @override
  _productPageSellerState createState() => _productPageSellerState();
}

class _productPageSellerState extends State<productPageSeller> {

  String productName = 'Cast Iron gears 15 inch 1050 rounded edges- PVC ';
  String productPrice = '₹ 89,000';
  String productDetails = 'Gears can be made of all sorts of materials, including many types of steel, brass, bronze, cast iron, ductile iron, aluminum, powdered metals, and plastics.';
  String productQty = '150 kgs';
  String productCategory = 'Cutting tools';
  String publishDate = 'August 19, 2020';
  String selectedUnit;
  TextEditingController editQtyController = new TextEditingController();
  final String views = '112';
  final String favorite = '19';
  final String enquiries = '45';
  bool availablity = true;

  var _selectUnit = {
      "kg",
      "pieces",
      "litre"
  };
  //productPageSeller(this.productQty,this.availblity);

   List<String> specName = [
    'Brand','Model','Material','Weight','Dimensions','Capacity'
  ];

  List<String> specDetails = [
    'Mittal steels','specification comes here','Copper and Aluminium alloy','87 kgs','32.2 x 25 x 96.3','80 ltr'
  ];

  List<String> contact = [
    'Company name','Contact person','Address','Email ID','Contact no.'
  ];
  
  List<String> contactDetails = [
    'Mittal steels','Mr Atul Mittal','104/105 near Pithampur main road, Indore Madhya Pradesh','mittal.atul@mittalcorps.com', '99999-99999\n89898-98989'
  ];

  List<Map<String,String>> _specs= new List();
  List<Map<String,String>> _contactInfo= new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      for(int i=0;i<specName.length;i++){
        _specs.add({
          "name":specName[i],
          "details":specDetails[i],
        });
      }

      for(int i=0;i<contact.length;i++){
        _contactInfo.add({
          "name":contact[i],
          "details":contactDetails[i],
        });
      }
  }

  Widget _buildSpecification(){
    return ListView.builder(
      itemCount: _specs.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, index) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_specs[index]['name'],style: TextStyle(fontWeight: FontWeight.bold,fontSize:16),),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_specs[index]['details'],style: TextStyle(fontSize:16),),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }

  Widget _buildContactSeller(){
    return ListView.builder(
      itemCount: _contactInfo.length,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, index) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width*0.3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_contactInfo[index]['name'],style: TextStyle(fontWeight: FontWeight.bold,fontSize:16),),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width*0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_contactInfo[index]['details'],style: TextStyle(fontSize:16),),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }

  Widget _buildAvailablity(){
    return Row(
              children: [
                Container(
                  //width: 220,
                  //margin: EdgeInsets.symmetric(horizontal:40),
                  padding: EdgeInsets.symmetric(horizontal:2, vertical:2),
                  decoration: BoxDecoration(
                    border: Border.all( 
                      color : Color(0xFFE6E6E6),
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(60)
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState((){
                            this.availablity = true;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal:20, vertical:10),
                          decoration: BoxDecoration(
                            color : availablity == true ? Color(0xFF4B69FF) : Color(0xFFFFFFFF),
                            // border: Border.all( 
                            //   color : Color(0xFFFFFF),
                            // ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30)
                            ),
                          ),
                          child: Text('Available', style: availablity == true ? TextStyle( fontSize : 20, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)) : TextStyle( fontSize: 18 , color: Color(0xFF979797)))
                          ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState((){
                            this.availablity = false;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal:20, vertical:10),
                          decoration: BoxDecoration(
                            color : availablity == false ? Color(0xFFD84764) : Color(0xFFFFFFFF),
                            // border: Border.all( 
                            //   color : Color(0xFFFFFF),
                            // ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(30)
                            ),
                          ),
                          child: Text('Out of Stock', style: availablity == false ? TextStyle( fontSize : 20, fontWeight: FontWeight.bold, color: Color(0xFFFFFFFF)) : TextStyle( fontSize: 18 , color: Color(0xFF979797))),
                          ),
                      ),
                    ],
                  ),
                ),
              ],
            );
  }

  Widget _buildQuantity(){
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          )
      ),
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly
      ],
      controller: editQtyController,
    );
  }

  Widget _buildUnit(){
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor : Colors.black
      ),
          child: DropdownButtonFormField<String>(
          items: _selectUnit.map((String dropDownStringItem){
            return DropdownMenuItem<String>(
              value: dropDownStringItem,
              child: Center(child: Text(dropDownStringItem,style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
            );
          }).toList(),
          onChanged: (_value) {
            setState(() {
              this.selectedUnit = _value;
              print(selectedUnit);
            });
          },
          hint: Text("Select unit",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold)),
          value: selectedUnit,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20, 17, 20, 17),
          filled : true,
          fillColor: Colors.black,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
          )
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
          child: Stack(
            children: [
              Image.asset("assets/images/Group_166.png"),
              Column(
                children: [
                  SizedBox(height: 60,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                              icon: Icon(Icons.arrow_back_ios), onPressed: (){
                            setState(() {
                              //Navigate
                              Navigator.of(context).pop();
                            });
                          }),
                        SizedBox(width: 20,),
                        Flexible(child: Text(productName, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                        //Icon(Icons.share),
                        Container(
                          child: Text(' '),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20,),
                  ImageCarousel(),
                  //SizedBox(height: 10,),
                  Container(
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal:40,vertical:20),
                        height: 90, //from 80 to 70
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10),),
                          color: Color(0xff0B868A),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.remove_red_eye,color: Colors.white,),
                                SizedBox(height: 10,),
                                Text(views+" views",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white),),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.favorite,color: Colors.white,),
                                SizedBox(height: 10,),
                                Text(favorite+" times",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white),),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(enquiries,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),),
                                SizedBox(height: 10,),
                                Text("Enquiries",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.white),),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal:40,vertical:20),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(productPrice,style: TextStyle(fontSize: 26),),
                                  Text(' /unit',style: TextStyle(fontSize:14),),
                                ],
                              ),],),
                            ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal:40,vertical:20),
                        child: Text(productDetails, style: TextStyle(fontSize: 16,color:Color(0xFF6F6F6F),),),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:40),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text('Max Qty : ',style: TextStyle(fontSize: 20,fontWeight:FontWeight.bold,)),
                                Text(productQty,style: TextStyle(fontSize: 16),)
                              ],
                            ),
                            SizedBox(height:10),
                            Row(
                              children: [
                                Text('Category : ',style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold,color:Color(0xFF979797),),),
                                Text(productCategory,style: TextStyle(fontSize: 16,color:Color(0xFF979797),),)
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height:20),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal:40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text('Ad published on  :  ',style: TextStyle(fontSize: 14,fontFamily: 'Open Sans',fontStyle: FontStyle.italic,color:Color(0xFF6F6F6F),),),
                                Text(publishDate,style: TextStyle(fontSize: 16,color:Color(0xFF6F6F6F),),)
                              ],
                            ),
                          ],
                        ),
                     ),
                    SizedBox(height:10),
                    Container(
                    child: Stack(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                height: 120,
                                margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                padding: EdgeInsets.fromLTRB(40, 30, 0, 0),
                                decoration: BoxDecoration(
                                  color: Color(0xFFD84764),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                  ),
                                ),
                                child:  Text('Specification', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 24),),
                               ),
                            ),
                          ],
                        ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal:20,vertical:10),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //Text('Specification', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24),),
                          SizedBox(height: 60,),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal:30),
                            margin: EdgeInsets.symmetric(horizontal:10,vertical: 10),
                             decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10),),
                                color: Color(0xFFFFF9FA),
                            ),
                            child: _buildSpecification()
                          ),
                        ],
                      ),
                    )
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal:30),
                    child: Row(
                      children: [
                        Text('CONTACT SELLER', style: TextStyle(color: Color(0xFF4B69FF),fontWeight: FontWeight.bold,fontSize: 22),),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Stack(
                    children: [
                      // Positioned.fill(
                      //   child: Align(
                      //     alignment: Alignment.center,
                      //     child: RotationTransition(
                      //        turns: new AlwaysStoppedAnimation(-5 / 360),
                      //        child: Container(
                      //       width: MediaQuery.of(context).size.width,
                      //       height: 200,
                      //         decoration: BoxDecoration(
                      //           color: Color(0xFF4B69FF),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: BgClip(
                          height: 360,
                        ),
                      ),
                      Container(
                      padding: EdgeInsets.symmetric(horizontal:10,vertical: 20),
                      margin: EdgeInsets.symmetric(horizontal:10,vertical:30),
                         decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10),),
                            color: Color(0xFFFFF9FA),
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 1),
                                blurRadius: 10,
                                color: Colors.black.withOpacity(.16),
                            ),]
                        ),
                        child: _buildContactSeller()
                      ),
                    ],
                  ),
                  SizedBox(height: 100,)
                
                  ],
                ),
                  ]
              ),
              ),
              Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal:10,vertical: 20),
                //height: 80,
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            //editQuantity(data: new productPageSeller(this.productQty, this.availablity));
                            //_editQty();
                            final result = await _editQtyDialog();
                            print(result);
                            _buildConfirmDialogue(context);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.6,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Color(0xFFE5E5E5),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Text('CHANGE QUANTITY', style: TextStyle(fontSize:16,fontWeight: FontWeight.bold),),
                          ),
                        ),
                        Text(''),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(''),
                        Container(
                          width: MediaQuery.of(context).size.width*0.5,
                          padding: EdgeInsets.symmetric(horizontal:20, vertical:20),
                          decoration: BoxDecoration(
                            color: Color(0xFF0B868A),
                            borderRadius: BorderRadius.circular(30)
                          ),
                          child: Text('Edit', style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.white),textAlign: TextAlign.center,),
                          ),
                      ],
                    ),
                  ])
              ),
            ),
          ],
        )
        ]
      )
    );
  }


  _editQtyDialog(){
    return showDialog(
      context: context,
      builder: (context) {
            return AlertDialog(
            content: editQuantity(data: productQty),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))
            ),
          );
        }
        );
  }

}


void _buildConfirmDialogue(BuildContext context) {

   
    var alertDialog = AlertDialog(
      content : confirmDialog(),
      shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.all(Radius.circular(5.0))
               ),
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      }
    );
  }
