import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:imageslider/instamodels.dart';

class Instagram extends StatefulWidget {
  @override
  _InstagramState createState() => _InstagramState();
}

class _InstagramState extends State<Instagram> {
  var instaData = InstaData.getData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text('Instagram',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,fontSize: 25),),
        leading: IconButton(
          icon: Icon(Icons.lock_outlined,color: Colors.black,),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add,color: Colors.black,),
          ),
          IconButton(
            icon: Icon(Icons.menu,color: Colors.black,),
          ),
        ],
      ),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              //leading:
              automaticallyImplyLeading: false,
              backgroundColor: Colors.white,
              expandedHeight: 380.0,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(margin: EdgeInsets.only(right: 30),child: Icon(Icons.grid_view,size: 19,)),
                    Container(margin: EdgeInsets.only(right: 30),child: Icon(Icons.video_collection_outlined,size: 19,)),
                    Container(margin: EdgeInsets.only(right: 40),child: Icon(Icons.person_pin_outlined,size: 19,))
                  ],
                ),
                background: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Expanded(
                        child: Row(
                          children: [
                            CircleAvatar(
                              radius: 45.0,
                              backgroundImage: AssetImage("img.jpeg"),
                            ),
                            Expanded(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 25),
                                    child: Column(
                                      children: [
                                        Text('81',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black,)),
                                        Text('Posts',style: TextStyle(fontSize: 14,color: Colors.black,)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: Column(
                                      children: [
                                        Text('403',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black,)),
                                        Text('Followers',style: TextStyle(fontSize: 14,color: Colors.black,)),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 20),
                                    child: Column(
                                      children: [
                                        Text('159',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black,)),
                                        Text('Following',style: TextStyle(fontSize: 14,color: Colors.black,)),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 20),
                        child: Text('Vishesh Gupta',style: TextStyle(fontSize: 16.5,fontWeight: FontWeight.bold),)),
                    Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text('Flutter Developer',style: TextStyle(fontSize: 16),)),
                    Container(
                        margin: EdgeInsets.only(left: 20),
                        child: Text('youtu.be/Cljz0CpFQ5k',style: TextStyle(fontSize: 16,color: Colors.blueAccent),)),
                    // OutlineButton(
                    //   child: Text('Edit Profile',textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black,),),
                    //   borderSide: BorderSide(
                    //     width: 1.8,
                    //   ),
                    // )
                    Container(
                        height: 30.0,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(vertical: 12.0,horizontal: 10),
                        child: SizedBox.expand(
                            child: OutlineButton(
                              child: Text('Edit Profile', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                              borderSide: BorderSide(
                                color: Colors.grey,
                                style: BorderStyle.solid,
                                width: 0.8,
                              ),
                              onPressed: () {},
                            )
                        )
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 32.0,
                                backgroundImage: AssetImage("n3.jpg"),
                              ),
                              Text('Youtube')
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 32.0,
                                backgroundImage: AssetImage("n4.jpeg"),
                              ),
                              Text('Locations')
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 32.0,
                                backgroundImage: AssetImage("n1.jpg"),
                              ),
                              Text('Memories')
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Column(
                            children: [
                              CircleAvatar(
                                radius: 32.0,
                                backgroundImage: AssetImage("n5.jpg"),
                              ),
                              Text('College')
                            ],
                          ),
                        ),

                      ],
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: ListView.builder(
          itemCount: instaData.length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25.0,
                        backgroundImage: AssetImage("img.jpeg"),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(left: 5),
                              child: Text('Vishesht Gupta',style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)),
                          Container(
                            margin: EdgeInsets.only(left: 5,bottom: 10),
                            child: Text('Ludhiana',style: TextStyle(fontSize: 11,color: Colors.black)),),
                        ],
                      ),
                    ],
                  ),
                  Image.asset(
                    instaData[index]['image'],
                    height: 250.0,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 6,),
                      Icon(Icons.favorite_border,size: 28,),
                      SizedBox(width: 14,),
                      Icon(Icons.mode_comment_outlined,size: 28),
                      SizedBox(width: 14,),
                      Icon(Icons.directions_sharp,size: 28),
                      SizedBox(width: 200,),
                      Icon(Icons.save_alt,size: 28),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text("Liked by "+ instaData[index]['name'] +" and others",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text(instaData[index]['time'],style: TextStyle(fontSize: 12),)),
                  SizedBox(height: 30,),

                ],
              ),
            );
            // return ListTile(
            //   title: Text(europeanCountries[index]),
            // );
          },
        ),
      ),
    );
  }
}