import 'package:flutter/material.dart';


class confirmDialog extends StatefulWidget {
  @override
  _confirmDialogState createState() => _confirmDialogState();
}

class _confirmDialogState extends State<confirmDialog> {

  bool noStatus = false;
  bool yesStatus = false;

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
              child: Text("Was the product sold from De-stock?", style: TextStyle(fontSize:20,fontWeight:FontWeight.bold),textAlign: TextAlign.center,),
            ),
            //SizedBox(height:20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      this.noStatus = true;
                      this.yesStatus = false;
                    });
                    //sleep(Duration(seconds:1));
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                    decoration: BoxDecoration(
                      color : noStatus == true ? Color(0xFF6F6F6F) : Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text("  No  ",style: TextStyle(fontSize:20,fontWeight:FontWeight.bold,color: noStatus == true ? Color(0xFFFFFFFF) : Color(0xFF6F6F6F)))
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      this.noStatus = false;
                      this.yesStatus = true;
                    });
                    //sleep(Duration(seconds:1));
                    //Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(40, 20, 40, 20),
                    decoration: BoxDecoration(
                      color : yesStatus == false ? Color(0xFFFFFFFF) : Color(0xFF4B69FF),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Text("  Yes ",style: TextStyle(fontSize:20,fontWeight:FontWeight.bold,color: yesStatus == false ? Color(0xFF4B69FF) : Color(0xFFFFFFFF)))
                  ),
                ),
              ],
            )
          ],
        ),
      );
  }
}

