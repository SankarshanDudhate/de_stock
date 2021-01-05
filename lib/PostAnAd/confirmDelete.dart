import 'package:flutter/material.dart';

class deleteDialog extends StatefulWidget {
  @override
  _deleteDialogState createState() => _deleteDialogState();
}

class _deleteDialogState extends State<deleteDialog> {

  bool deleteStatus = false;
  bool enableStatus = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(0),
        //width: MediaQuery.of(context).size.width*0.7,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text("Are you sure you want to\nDelete this Ad?", style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),textAlign: TextAlign.center,),
            ),
            //SizedBox(height:20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("All the product details will be lost.", style: TextStyle(fontSize:14,fontFamily: "Open Sans"),textAlign: TextAlign.center,),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      this.deleteStatus = true;
                      this.enableStatus = false;
                    });
                    //sleep(Duration(seconds:1));
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                    decoration: BoxDecoration(
                      color : deleteStatus == true ? Color(0xFF6F6F6F) : Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text("Cancel",style: TextStyle(fontSize:20,fontWeight:FontWeight.bold,color: deleteStatus == true ? Color(0xFFFFFFFF) : Color(0xFF6F6F6F)))
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      this.deleteStatus = false;
                      this.enableStatus = true;
                    });
                    //sleep(Duration(seconds:1));
                    //Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                    decoration: BoxDecoration(
                      color : enableStatus == false ? Color(0xFFFFFFFF) : Color(0xFFD84764),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text("  YES ",style: TextStyle(fontSize:20,fontWeight:FontWeight.bold,color: enableStatus == false ? Color(0xFFD84764) : Color(0xFFFFFFFF)))
                  ),
                ),
              ],
            )
          ],
        ),
      );
  }
}
