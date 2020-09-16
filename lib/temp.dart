import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Widget _buildIconTray() {
  return ListView.builder(
    itemCount: 3,
    shrinkWrap: true,
    itemBuilder: (BuildContext context, index)=>Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 10,),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: InkWell(

                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
                    //height: MediaQuery.of(context).size.height/6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      //borderRadius: BorderRadius.circular(10),
//                      boxShadow: [BoxShadow(
// //                          color: Color.fromRGBO(120, 95, 27, .3),
// //                          blurRadius: 20.0,
// //                          offset: Offset(0, 5)
//                     )],
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.ac_unit,color: Colors.blue,size: 40,),
                        SizedBox(height: 20,),
                      ],
                    ),
                  ),
                ),
              ),
              //SizedBox(width: 20,),
              Expanded(
                child: InkWell(

                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                    //height: MediaQuery.of(context).size.height/6,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      //   borderRadius: BorderRadius.circular(10),
                      //  boxShadow: [BoxShadow(
                      //     //  color: Color.fromRGBO(120, 95, 27, .3),
                      //     //  blurRadius: 20.0,
                      //     //  offset: Offset(0, 5)
                      //  )],
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.ac_unit,color: Colors.blue,size: 40,),
                        SizedBox(height: 20,),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: index < 2 ? InkWell(

                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                      //height: MediaQuery.of(context).size.height/6,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        //   borderRadius: BorderRadius.circular(10),
                        //  boxShadow: [BoxShadow(
                        //     //  color: Color.fromRGBO(120, 95, 27, .3),
                        //     //  blurRadius: 20.0,
                        //     //  offset: Offset(0, 5)
                        //  )],
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.ac_unit,color: Colors.blue,size: 40,),
                          SizedBox(height: 20,),

                        ],
                      ),
                    ),
                  ) : Container()
              ),
            ],
          ),
          //SizedBox(height: 20,)
        ],
      ),
    ),
  );
}