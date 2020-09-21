import 'package:flutter/material.dart';

class requestQuote extends StatefulWidget {
  @override
  _requestQuoteState createState() => _requestQuoteState();
}

class _requestQuoteState extends State<requestQuote> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(100),
        child:  GestureDetector(
              onTap: (){
                _buildRequestQuote(context,'adharashive@gmail.com','500');
              },
              child: Text("Request Quote",style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700, color: Color(0xff4DA4D6)),)),    
      ),
    );
  }


  void _buildRequestQuote(BuildContext context,String email,String quantity) {

   TextEditingController remarkController = new TextEditingController();
   TextEditingController quantityController = new TextEditingController();
    var alertDialog = AlertDialog(
      content :
          Container(
            width: MediaQuery.of(context).size.width*0.8,
            child: SingleChildScrollView(
              child: Column(
                children: [ 
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal:40,vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topRight:  Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)
                        ),
                    ),
                    child: Text('REQUEST A QUOTE', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Colors.white),),
                  ),
                  SizedBox(height:30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(child: Text('Quantity', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)),
                      //SizedBox(width: 10,),
                      Flexible(
                        child: TextField(
                          maxLines: 1,
                          controller: quantityController,
                          decoration: new InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          )
                          ),
                        ),
                      ),
                      //SizedBox(width:10),
                      Flexible(child: Text(quantity + ' max quantity',style: TextStyle(color:Colors.grey[400],fontWeight: FontWeight.bold,fontSize: 14),)),
                    ]
                  ),
                  SizedBox(height:20),
                  Row(
                    children: [
                      Text('Remark', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                    ],
                  ),
                  SizedBox(height:10),
                  TextField(
                    maxLines: 6,
                    controller: remarkController,
                    decoration: new InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    )
                    ),
                  ),
                  SizedBox(height:20),
                  Row(
                    children: [
                      Flexible(child: Text('Quote will be sent to you as a notification and same on ' + email,textAlign: TextAlign.left,style: TextStyle(fontSize:14),))
                    ],
                  ),
                  SizedBox(height:20),
                  Container(
                    height: 50,
                    margin: EdgeInsets.symmetric(horizontal: 40),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(60),
                        color: Color(0xFFFC0151),
                    ),
                    child: Center(
                      child: Text("Send Enquiry", style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(height:20),
                  Text('Cancel', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color:Color(0xFFFC0151),),),
                ]
              ),
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
}
