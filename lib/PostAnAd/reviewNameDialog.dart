import 'package:flutter/material.dart';

class reviewNameDialog extends StatefulWidget {
  @override
  _reviewNameDialogState createState() => _reviewNameDialogState();
}

class _reviewNameDialogState extends State<reviewNameDialog> {

  String imageSrc = 'assets/images/IMG1.png';
  String productName = "Aluminium pipes- pvc-260 pieces";
  TextEditingController editNameController = new TextEditingController();
  bool edit = false;
  bool editFlag = false;

  void initState(){
     super.initState();
     editNameController.text = productName;
  }

  Widget _buildReviewProduct(){
    return Container(
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
                editFlag == true ? TextFormField(
              //initialValue: productName,
              controller: editNameController,
            )
            :  Text(editNameController.text,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
            ],),
          ),
          IconButton(
            icon: editFlag == false ? Icon(Icons.edit_outlined,color: Color(0xFFB7B7B7),)
            :  Icon(Icons.check_circle_outline,color: Color(0xFFB7B7B7),),
            onPressed: (){
              setState(() {
                if(editFlag == false){
                  this.editFlag = true;
                }
                else{
                  this.editFlag = false;
                }
                              
              });
            }
            )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Please review name of the product(s) before you check out", style: TextStyle(color: Color(0xFF535353),fontSize: 16),),
            SizedBox(height:10),
            Text("Name cannot be changed later, other details can be edited.", style: TextStyle(color: Color(0xFF4B69FF),fontSize: 11,fontStyle: FontStyle.italic),),
            SizedBox(height:30),
            // TODO(send list of saved items)
              _buildReviewProduct(),
            SizedBox(height:40),
            GestureDetector(
              child: Container(
                height: 50,
                margin: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xFFFC0151),
                ),
                child: Center(
                  child: Text("CONFIRM", style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
