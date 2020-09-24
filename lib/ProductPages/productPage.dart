import 'package:destock/ImageCarousel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class productPage extends StatefulWidget {
  @override
  _productPageState createState() => _productPageState();
}

class _productPageState extends State<productPage> {

  String productName = 'Cast Iron gears 15 inch 1050 rounded edges- PVC ';
  String productPrice = '₹ 89,000';
  String productDetails = 'Gears can be made of all sorts of materials, including many types of steel, brass, bronze, cast iron, ductile iron, aluminum, powdered metals, and plastics.';
  String productCategory = 'Cutting tools';
  String location = 'your location';
  String publishDate = 'August 19, 2020';

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
          SizedBox(height: 20,)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                      Icon(Icons.arrow_back_ios),
                      SizedBox(width: 20,),
                      Flexible(child: Text(productName, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                      Icon(Icons.share)
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                ImageCarousel(),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(productPrice,style: TextStyle(fontSize: 26),),
                          Text(' /unit',style: TextStyle(fontSize:14),),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: Color(0xFFFFF4F4),
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 10,),
                            Text('ADD TO WISHLIST', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color:Color(0xFFFC0151),),),
                            SizedBox(width: 10,),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(60),
                                  color: Color(0xFFD84764),
                              ),
                              child: Icon(Entypo.heart,color:Colors.white),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:40),
                  child: Text(productDetails, style: TextStyle(fontSize: 16,color:Color(0xFF6F6F6F),),),
                ),
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text('Category : ',style: TextStyle(fontSize: 16,fontWeight:FontWeight.bold,color:Color(0xFF979797),),),
                          Text(productCategory,style: TextStyle(fontSize: 16,color:Color(0xFF979797),),)
                        ],
                      ),
                      Text(location,style: TextStyle(fontSize: 16,color:Color(0xFF000000),),)
                    ],
                  ),
                ),
                SizedBox(height: 40,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20),
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
                Container(
                  padding: EdgeInsets.symmetric(horizontal:10),
                  margin: EdgeInsets.symmetric(horizontal:20),
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
                SizedBox(height: 10,)
              ],
            ),
          ],
        ),
      ),
    );
  }
}