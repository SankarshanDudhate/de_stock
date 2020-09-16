import 'package:flutter/material.dart';

class Enquiries extends StatefulWidget {
  @override
  _EnquiriesState createState() => _EnquiriesState();
}

class _EnquiriesState extends State<Enquiries> {

  TextEditingController searchController = new TextEditingController();
  int enquiryCount = 3;


  Widget searchBox() {
    return Container(
      //height: double.infinity,
      //padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30),),
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 40,
              color: Colors.black.withOpacity(.16),
            ),
          ],
      ),
      child: TextFormField(
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          fillColor: Colors.grey,
          hintText: "Search for product name or code",
          hintStyle: TextStyle(
          color: Colors.grey[400]
        ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(60),),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(30.0)),
                borderSide: BorderSide(color: Colors.grey),
                //color:Colors.grey,
              ),
          suffixIcon: Icon(Icons.search,color: Colors.black87,),
        ),
        controller: searchController,
    ),
    );
  }

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          children: [
            Stack(
                  children:[
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30.0),
                          bottomRight: Radius.circular(30.0)),
                      ),
                      //margin: EdgeInsets.fromLTRB(20,0,50,0),
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          IconButton(
                              icon: Icon(Icons.arrow_back_ios), onPressed: (){
                            setState(() {
                              //Navigate
                            });
                          }),
                          //SizedBox(width: 50,),
                          Column(
                            children: [
                              Text("Enquiries", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Column(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 75, 40, 0),
                      child: searchBox(),
                    )
                  ]
              ),
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20),
                child: Row(
                  children: [
                    Text("All Enquiries", style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                    SizedBox(width:5),
                    Text("(" + enquiryCount.toString() + ")",style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
              SizedBox(height:30),
              enquiry_card(
                product_id: "#786GFHDR",
                product_name: "Cast Iron gears 15 inche 1050 rounded edges - PVC",
                product_price: "7000",
                image: "assets/images/product image.png",
                user_image: "assets/images/user_image.png",
                user_name: "Tanmay Patil",
                user_enquiry: "I wanted to enquire about the price of this product",
                quantity: "300",
              ),
          ],
        ),
      )
    );
  }
}


class enquiry_card extends StatelessWidget {
  final String product_id;
  final String product_name;
  final String product_price;
  final String image;
  final String user_name;
  final String user_enquiry;
  final String user_image;
  final String quantity;

  const enquiry_card({Key key, this.product_id,this.product_name,this.product_price,this.image,this.user_name,this.quantity,this.user_enquiry,this.user_image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20),),
        color: Color(0xffffffff),
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 4),
            blurRadius: 40,
            color: Colors.black.withOpacity(.16),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(

            padding: EdgeInsets.all(10),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20),),
              color: Color(0xffffffff),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 4),
                  blurRadius: 10,
                  color: Colors.black.withOpacity(.16),
                ),
              ],
            ),
            child: Row(
              children: [
                Image.asset(image, height: 60,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        width: 190,
                        child: Text(product_name,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.black),),
                      ),
                      SizedBox(height: 5,),

                      Container(
                        width: 240,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(product_id,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400, color: Color(0xff6e6e6e)),),
                            Row(

                              children: [
                                Image.asset("assets/images/ruppee.png", height: 11,),
                                Text(" "+product_price,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(50),),
                    child: Image.asset(user_image, height: 50,)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        width: 240,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(user_name,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black),),

                            Text("QTY "+quantity+" kg",
                              textAlign: TextAlign.right,
                              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),

                      Container(
                        width: 190,
                        child: Text(user_enquiry,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff6F6F6F)),),
                      ),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: () {
                          _buildReply(context,user_image,user_name,user_enquiry,product_name,quantity,image);
                        },  
                        child: Text("Reply",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xff4DA4D6)),),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(50),),
                    child: Image.asset(user_image, height: 50,)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        width: 240,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(user_name,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700, color: Colors.black),),

                            Text("QTY "+quantity+" kg",
                              textAlign: TextAlign.right,
                              style: TextStyle(fontSize: 11, fontWeight: FontWeight.w600, color: Color(0xff6F6F6F)),),
                          ],
                        ),
                      ),
                      SizedBox(height: 10,),

                      Container(
                        width: 190,
                        child: Text(user_enquiry,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Color(0xff6F6F6F)),),
                      ),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: () {
                          _buildReply(context,user_image,user_name,user_enquiry,product_name,quantity,image);
                        },
                        child: Text("Reply",
                        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Color(0xff4DA4D6)),),
                      ),

                    ],
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


 void _buildReply(BuildContext context,String user_image,String user_name,String user_enquiry,String product_name,String quantity,String image) {

   TextEditingController replyController = new TextEditingController();
    var alertDialog = AlertDialog(
      content :
          Container(
            width: MediaQuery.of(context).size.width*0.8,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(30),),
                        child: Image.asset(image, height: 50,)),
                    SizedBox(width:20),
                    Flexible(child: Text(user_name + ' has requested a quote for your product',textAlign: TextAlign.left,style: TextStyle(fontSize:16),))
                  ],
                ),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(5),
                     border: Border.all(
                    color: Colors.grey[400],
                    )
                  ),
                  child: Row(
                    children: [
                      Flexible(child: Text(product_name,maxLines: 2,style: TextStyle(color:Colors.grey,fontSize: 14),)),
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(5),),
                        child: Image.asset(image, height: 50,)),
                    ]
                  ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ENQUIRY',style: TextStyle(color:Colors.grey[400],fontWeight: FontWeight.bold,fontSize: 14),),
                    Text('Qty  ' + quantity, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),)
                  ],
                ),
                SizedBox(height:10),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(5),
                     color: const Color(0xFFFFF1F6),
                  ),
                  child: Flexible(child: Text(user_enquiry, style: TextStyle(fontSize:16),)),
                ),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text('Enter your reply', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height:10),
                TextField(
                  maxLines: 4,
                  controller: replyController,
                  decoration: new InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  )
                  ),
                ),
                SizedBox(height:20),
                Container(
                  height: 50,
                  margin: EdgeInsets.symmetric(horizontal: 80),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Color(0xFFFC0151),
                  ),
                  child: Center(
                    child: Text("REPLY", style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
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