import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
//import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class filter extends StatefulWidget {
  @override
  _filterState createState() => _filterState();
}

class _filterState extends State<filter> {


   void _buildFilters(BuildContext context) {
    var alertDialog = AlertDialog(
      content : filterDialog(),
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        padding: EdgeInsets.all(100),
        child:  GestureDetector(
              onTap: (){
                _buildFilters(context);
              },
              child: Text("Filters",style: TextStyle(fontSize: 40, fontWeight: FontWeight.w700, color: Color(0xff4DA4D6)),)),    
      ),
    );
  }
}

class filterDialog extends StatefulWidget {

  @override
  _filterDialogState createState() => _filterDialogState();
}

class _filterDialogState extends State<filterDialog> {

    List<String> _filterList = [
    'Metal','Cast Iron','Gears','Pipes','PVPC'
  ];

   List<int> _state = [
    0,0,0,0,0
  ];

  List<Map<String,dynamic>> _filters= new List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      for(int i=0;i<_filterList.length;i++){
        _filters.add({
          "list":_filterList[i],
          "state":_state[i],
        });
      }
  }

   _selectList(BuildContext context,int index){
    setState(() {
      if(_filters[index]['state']==0){
        this._filters[index]['state'] = 1;
      }
      else{
        this._filters[index]['state'] = 0;
      }
      print(_filters[index]['state']);
    });
  }

  _resetStates(BuildContext context){
    setState(() {
      for(int i=0;i<_filters.length;i++){
      this._filters[i]['state'] = 0;
    }
    });
  }

   Widget _buildList(BuildContext context) {
    return ListView.builder(
      itemCount: _filters.length,
      //crossAxisCount: 3,
      shrinkWrap: true,
      itemBuilder: (BuildContext context, index) => Container(
        child: GestureDetector(
          onTap: (){
            _selectList(context,index);
          },
          child: Container(
            decoration: BoxDecoration(
                color: _filters[index]['state'] == 1 ? Color(0xFF3951C9)
                : Color(0xFFEDEDED),
                borderRadius: BorderRadius.circular(30),
              ),
            padding: EdgeInsets.symmetric(vertical:10,horizontal:50),
            margin: EdgeInsets.symmetric(vertical:10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _filterList[index],
                  style: TextStyle(
                    fontSize: 18,
                    color: _filters[index]['state'] == 1 ? Color(0xFFFFFFFF)
                    : Color(0xFF727272),
                    ),),
                _filters[index]['state'] == 1 ? Icon(Icons.cancel,color:Color(0xFF6879CF))
                : Container()
              ],
            )),
        ),
      ),
        // staggeredTileBuilder: (int index) => new StaggeredTile.count(2, index.isEven ? 2 : 1),
        // mainAxisSpacing: 4.0,
        // crossAxisSpacing: 4.0,
      );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width*0.8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(),
                Flexible(child: Text('Filters', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
                GestureDetector(
                  onTap: () {
                    _resetStates(context);
                  },
                  child: Flexible(child: Text('Reset', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color:Colors.grey[600]),)))
              ],
            ),
            SizedBox(height:30),
            Container(
              padding: EdgeInsets.symmetric(vertical:10,horizontal:5),
              child: _buildList(context)
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
                      child: Text("APPLY FILTERS", style: TextStyle(color: Colors.white, fontSize: 18,fontWeight: FontWeight.bold)),
                    ),
                  ),
                  SizedBox(height:20),
                  Text('CANCEL', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color:Color(0xFFFC0151),),),
          ]
        )
      );
  }
}

