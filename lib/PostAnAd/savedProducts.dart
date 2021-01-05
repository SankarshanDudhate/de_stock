import 'package:destock/PostAnAd/confirmDelete.dart';
import 'package:destock/PostAnAd/postAd.dart';
import 'package:destock/PostAnAd/postAd_4.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class savedProducts extends StatefulWidget {
  @override
  _savedProductsState createState() => _savedProductsState();
}

class _savedProductsState extends State<savedProducts> {

  String imageSrc = 'assets/images/IMG1.png';
  String productName = "Aluminium pipes- pvc-260 pieces";

  Widget _buildSavedProducts(){
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
          offset: Offset(0, 4),
          blurRadius: 10,
          color: Colors.black.withOpacity(.16),
        ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: Image.asset(imageSrc, fit: BoxFit.cover, width: 80,height: 80,)
          ),
          SizedBox(width: 10,),
          Flexible(
            child: Column(
              children: [
                Text(productName,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.delete,color: Color(0xFFB7B7B7),),
            onPressed: (){
              print("delete");
              _buildDeleteDialogue(context);
            }
            )
        ],
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
                Positioned(
                  top: 0,
                  child: SvgPicture.asset("assets/icons/circle-design.svg")
                  ),
                Container(
                  //margin: EdgeInsets.fromLTRB(20,0,50,0),
                  padding: EdgeInsets.fromLTRB(50, 50, 0, 50),
                  child: Text("Saved products", style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                ),
              ]
            ),
            SizedBox(height:30), 
            Container(
              padding: EdgeInsets.symmetric(vertical:10,horizontal:20),
              child: _buildSavedProducts()
            ),
            SizedBox(height:60,),
            GestureDetector(
                    onTap: (){
                      Navigator.push(context, new MaterialPageRoute(
                        builder: (BuildContext context) => new PostAd() ),
                    );
                    },
                    child: Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(horizontal: 60),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xFFFC0151),
                        ),
                        child: Center(
                          child: Text("Add a new product", style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold)),
                        ),
                      ),
                  ),
            SizedBox(height:20),
            GestureDetector(
                  onTap: () {
                    Navigator.push(context, new MaterialPageRoute(
                        builder: (BuildContext context) => new PostAd4() ),
                    );
                  },
                  child: Container(
                      height: 50,
                      margin: EdgeInsets.symmetric(horizontal: 80),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          border: Border.all(
                            color: Color(0xFFFC0151),
                          )
                      ),
                      child: Center(
                        child: Text("CHECKOUT", style: TextStyle(color:  Color(0xFFFC0151), fontSize: 18,fontWeight: FontWeight.bold)),
                      ),
                    ),
            ),
          ],
        ),
      )
    );
  }

  void _buildDeleteDialogue(BuildContext context) {

   
    var alertDialog = AlertDialog(
      content : deleteDialog(),
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

}