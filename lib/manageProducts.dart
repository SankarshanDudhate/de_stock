import 'package:flutter/material.dart';

class manageProducts extends StatefulWidget {
  @override
  _manageProductsState createState() => _manageProductsState();
}

class _manageProductsState extends State<manageProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Stack(
          children:[
              Container(
                decoration: BoxDecoration(
                   color: Colors.grey[300],
                   borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0)),
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
                          Text("Manage your products", style: TextStyle(fontSize: 18),),
                        ],
                      ),
                      Column(),
                    ],
                  ),
                ),
            Container(
              
            ),
          ]
        ),
        
        ]),
    );
  }
}