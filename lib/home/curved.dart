import 'package:imageslider/about/about.dart';
import 'package:imageslider/home/drawer.dart';
import 'package:imageslider/home/home.dart';
import 'package:imageslider/news/news.dart';
import 'package:imageslider/register/register.dart';
import 'package:imageslider/schedule/schedule.dart';
import 'package:flutter/material.dart';

class DrawerExample extends StatefulWidget{
final int index;
final String title;
DrawerExample(
  this.index,
   this.title,
);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DrawerExampleState(index, title);
    throw UnimplementedError();
  }
}

class DrawerExampleState extends State<DrawerExample>{

    List<DrawerItem> listpages = [
        DrawerItem(
          icon: Icon(Icons.menu),
        ),
        DrawerItem(
          icon: Icon(Icons.calendar_today),
          label: "Package",
        ),
         DrawerItem(
          icon: Icon(Icons.home),
          label:"Terms & Condition"
        ),
         DrawerItem(
          icon: Icon(Icons.person_add),
          label:"Privacy Policy"
        ),
        DrawerItem(
          icon: Icon(Icons.people),
          label:"Contact Us"
        ),
      DrawerItem(
          icon: Icon(Icons.people),
          label:"Rate App"
      ),
      DrawerItem(
          icon: Icon(Icons.logout),
      ),
  ];

  int selectedIndex=2 ;
  List<Widget> abc = [
    News(),
    Schedule(),
    Home(),
    Register(),
    AboutUs()
  ];

String title;
  DrawerExampleState(this.selectedIndex, this.title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
                  title: Text(title),
                  backgroundColor: Colors.blue,
                ),
                endDrawer: Stack(children:[ CurvedDrawer(items: listpages,index:selectedIndex)]),
                body: Center(
                  child: abc[selectedIndex],
                ),
    );
  }
}
