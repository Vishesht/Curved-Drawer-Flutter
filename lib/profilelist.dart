import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:imageslider/models.dart';


class ListViewBuilders extends StatefulWidget {
  @override
  _ListViewBuildersState createState() => _ListViewBuildersState();
}

class _ListViewBuildersState extends State<ListViewBuilders> {
  var _Data = Data.getData;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          title:Text("Profile Listview")
      ),
      body: ListView.builder(
          itemCount: _Data.length,
          itemBuilder: (BuildContext context,int index){
            return Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              child: Container(
                color: Colors.white,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.indigoAccent,
                    child: CircleAvatar(radius: 30,backgroundImage: AssetImage(_Data[index]['image']),),
                    foregroundColor: Colors.white,
                  ),
                  title: Text(_Data[index]['name']),
                  subtitle: Text(_Data[index]['detail']),
                ),
              ),
              // actions: <Widget>[
              //   IconSlideAction(
              //     caption: 'Archive',
              //     color: Colors.blue,
              //     icon: Icons.archive,
              //     //onTap: () => _showSnackBar('Archive'),
              //   ),
              //   IconSlideAction(
              //     caption: 'Share',
              //     color: Colors.indigo,
              //     icon: Icons.share,
              //    // onTap: () => _showSnackBar('Share'),
              //   ),
              // ],
              secondaryActions: <Widget>[
                // IconSlideAction(
                //   caption: 'More',
                //   color: Colors.black45,
                //   icon: Icons.more_horiz,
                // //  onTap: () => _showSnackBar('More'),
                // ),
                IconSlideAction(
                  caption: 'Delete',
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: (){
                    setState(() {
                      _Data.removeAt(index);
                    });
                  },
                ),
              ],
            );
          }
      ),
    );
  }
}

