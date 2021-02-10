import 'package:flutter/material.dart';

class Drawerdesign extends StatefulWidget {
  @override
  _DrawerdesignState createState() => _DrawerdesignState();
}

class _DrawerdesignState extends State<Drawerdesign> {
  bool _color0,_color1,_color2,_color3,_color4,_color5,_color6,_color7,_color8;
  @override
  void initState() {
    super.initState();
    _color0 = true;
    _color1 = true;
    _color2 = true;
    _color3 = true;
    _color4 = true;
    _color5 = true;
    _color6 = true;
    _color7 = true;
    _color8 = true;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer App'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              color: Colors.white,
              margin: EdgeInsets.only(top: 20,left: 18),
              child: Column(
                children: [
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    accountName: Text("Oila Gozha",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16.5),),
                    accountEmail: Text("14,220 followers",style: TextStyle(color: Colors.black)),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: AssetImage("img.jpeg"),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(right: 110),
                    child: RaisedButton(
                      onPressed: (){
                        setState(() {
                          _color0 = true;
                          _color1 = true;
                          _color2 = true;
                          _color3 = true;
                          _color4 = true;
                          _color5 = true;
                          _color6 = true;
                          _color7 = true;
                          _color8 = true;
                        });
                      },
                      textColor: Colors.white,
                      padding: const EdgeInsets.all(0.0),
                      child: Container(
                        color: _color0 ? Colors.pink : Colors.grey,
                        padding: const EdgeInsets.all(10.0),
                        child:
                          RichText(
                            text: TextSpan(
                              children: [
                                WidgetSpan(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 2.0),
                                    child: Icon(Icons.cloud_upload,color: Colors.white,size: 18.5,),
                                  )
                                ),
                                TextSpan(text: '   Upload sheet',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16))
                              ]
                            ),
                          )
                        //const Text('Upload sheet', style: TextStyle(fontSize: 20,color: Colors.white)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              elevation: 0,
              color: _color1 ? Colors.white : Colors.pink,
              child: ListTile(
                onTap: (){
                  setState(() {
                    _color0 = false;
                    _color1 = false;
                    _color2 = true;
                    _color3 = true;
                    _color4 = true;
                    _color5 = true;
                    _color6 = true;
                    _color7 = true;
                    _color8 = true;
                  });
                },
                contentPadding: EdgeInsets.only(left: 30.0, right: 0.0,top: 5,bottom: 0),
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                leading: Icon(Icons.person,color: _color1 ? Colors.grey:Colors.white,),
                title: Transform(transform:Matrix4.translationValues(-16, 0, 0),child: Text('Profile',
                  style: TextStyle(color: _color1 ? Colors.black : Colors.white),)),
              ),
            ),
            Card(
              elevation: 0,
              color: _color2 ? Colors.white : Colors.pink,
              child: ListTile(
                onTap: (){
                  setState(() {
                    _color0 = false;
                    _color1 = true;
                    _color2 = false;
                    _color3 = true;
                    _color4 = true;
                    _color5 = true;
                    _color6 = true;
                    _color7 = true;
                    _color8 = true;
                  });
                },
                contentPadding: EdgeInsets.only(left: 30.0, right: 0.0),
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                leading: Icon(Icons.message,color: _color2 ? Colors.grey:Colors.white,),
                title: Transform(transform:Matrix4.translationValues(-16, 0, 0),child: Text('Message',
                style: TextStyle(color: _color2 ? Colors.black : Colors.white),
                )),
              ),
            ),
            Card(
              elevation: 0,
              color: _color3 ? Colors.white : Colors.pink,
              child: ListTile(
                onTap: (){
                  setState(() {
                    _color0 = false;
                    _color1 = true;
                    _color2 = true;
                    _color3 = false;
                    _color4 = true;
                    _color5 = true;
                    _color6 = true;
                    _color7 = true;
                    _color8 = true;
                  });
                },
                contentPadding: EdgeInsets.only(left: 30.0, right: 0.0),
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                leading: Icon(Icons.pending_actions,color: _color3 ? Colors.grey:Colors.white,),
                title: Transform(transform:Matrix4.translationValues(-16, 0, 0),child: Text('Activity',
                  style: TextStyle(color: _color3 ? Colors.black : Colors.white),)),
              ),
            ),
            Card(
              elevation: 0,
              color: _color4 ? Colors.white : Colors.pink,
              child: ListTile(
                onTap: (){
                  setState(() {
                    _color0 = false;
                    _color1 = true;
                    _color2 = true;
                    _color3 = true;
                    _color4 = false;
                    _color5 = true;
                    _color6 = true;
                    _color7 = true;
                    _color8 = true;

                  });
                },
                contentPadding: EdgeInsets.only(left: 30.0, right: 0.0),
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                leading: Icon(Icons.baby_changing_station_sharp,color: _color4 ? Colors.grey:Colors.white,),
                title: Transform(transform:Matrix4.translationValues(-16, 0, 0),child: Text('Stats',
                  style: TextStyle(color: _color4 ? Colors.black : Colors.white),)),
              ),
            ),
            Card(
              elevation: 0,
              color: _color5 ? Colors.white : Colors.pink,
              child: ListTile(
                onTap: (){
                  setState(() {
                    _color0 = false;
                    _color1 = true;
                    _color2 = true;
                    _color3 = true;
                    _color4 = true;
                    _color5 = false;
                    _color6 = true;
                    _color7 = true;
                    _color8 = true;
                  });
                },
                contentPadding: EdgeInsets.only(left: 30.0, right: 0.0,bottom: 8),
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                leading: Icon(Icons.shopping_bag,color: _color5 ? Colors.grey:Colors.white,),
                title: Transform(transform:Matrix4.translationValues(-16, 0, 0),child: Text('Buckets',
                  style: TextStyle(color: _color5 ? Colors.black : Colors.white),)),
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 45.0, top: 8),
              visualDensity: VisualDensity(horizontal: -4, vertical: -4),
              title: Transform(transform:Matrix4.translationValues(-16, 0, 0),child: Text('Switch to...',style: TextStyle(color: Colors.grey)),),
            ),
            Card(
              elevation: 0,
              color: _color6 ? Colors.white : Colors.pink,
              child: ListTile(
                onTap: (){
                  setState(() {
                    _color0 = false;
                    _color1 = true;
                    _color2 = true;
                    _color3 = true;
                    _color4 = true;
                    _color5 = true;
                    _color6 = false;
                    _color7 = true;
                    _color8 = true;
                  });
                },
                contentPadding: EdgeInsets.only(left: 30.0,bottom: 8),
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                leading: Icon(Icons.person_add_alt_1_outlined,color: _color6 ? Colors.grey:Colors.white,),
                title: Transform(transform:Matrix4.translationValues(-16, 0, 0),child: Text('Olia & Roma',
                  style: TextStyle(color: _color6 ? Colors.black : Colors.white),)),
              ),
            ),
            Divider(
              height: 1,
              thickness: 1,
            ),

            Card(
              elevation: 0,
              color: _color7 ? Colors.white : Colors.pink,
              child: ListTile(
                onTap: (){
                  setState(() {
                    _color0 = false;
                    _color1 = true;
                    _color2 = true;
                    _color3 = true;
                    _color4 = true;
                    _color5 = true;
                    _color6 = true;
                    _color7 = false;
                    _color8 = true;
                  });
                },
                contentPadding: EdgeInsets.only(left: 30.0, right: 0.0,top: 15),
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                leading: Icon(Icons.settings,color: _color7 ? Colors.grey:Colors.white,),
                title: Transform(transform:Matrix4.translationValues(-16, 0, 0),child: Text('Settings',
                  style: TextStyle(color: _color7 ? Colors.black : Colors.white),)),
              ),
            ),
            Card(
              elevation: 0,
              color: _color8 ? Colors.white : Colors.pink,
              child: ListTile(
                onTap: (){
                  setState(() {
                    _color0 = false;
                    _color1 = true;
                    _color2 = true;
                    _color3 = true;
                    _color4 = true;
                    _color5 = true;
                    _color6 = true;
                    _color7 = true;
                    _color8 = false;
                  });
                },
                contentPadding: EdgeInsets.only(left: 30.0),
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
                leading: Icon(Icons.follow_the_signs_outlined,color: _color8 ? Colors.grey:Colors.white,),
                title: Transform(transform:Matrix4.translationValues(-16, 0, 0),child: Text('Sign out',
                  style: TextStyle(color: _color8 ? Colors.black : Colors.white),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
