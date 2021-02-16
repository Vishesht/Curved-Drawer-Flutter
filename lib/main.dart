import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:imageslider/Api/completeprofile.dart';
import 'package:imageslider/help.dart';
import 'package:imageslider/upload_image.dart';
import 'animateddrawer.dart';
import 'dialog.dart';
import 'slider.dart';
import 'DateTime.dart';
import 'profilelist.dart';
import 'animatedlist.dart';
import 'silverappbar.dart';
import 'instagram.dart';
import 'drawer.dart';
import 'httpflutter.dart';
import 'datetimeset.dart';
import 'Api/registerapi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MyHome(),
    );
  }
}
class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    Widget images = Container(
      height: 200.0,
      child: Carousel(
        boxFit: BoxFit.cover,
        images: [
          AssetImage('n1.jpg'),
          AssetImage('n2.jpg'),
          AssetImage('n3.jpg'),
          AssetImage('n4.jpeg'),
          AssetImage('n5.jpg'),
        ],
        autoplay: false,
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
        // animationCurve: Curves.fastOutSlowIn,
        // animationDuration: Duration(milliseconds: 1000),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Slider"),
      ),
      body: ListView(
        children: [
          images,

          new Padding(padding: const EdgeInsets.all(8.0),
          child: Text('Image List'),
          ),

          ImageList(),

          Divider(color: Colors.grey,),
          new Padding(padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> RegisterApi()));
                },
                child: Text('Register API',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          ),
          SizedBox(
            height: 20.0,
          ),
          new Padding(padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AnimatedDrawer()));
                },
                child: Text('Animated Drawer app',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          ),
          SizedBox(
            height: 20.0,
          ),
          new Padding(padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> CompleteProfile()));
                },
                child: Text('Complete api Profile',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          ),
          SizedBox(
            height: 20.0,
          ),

          new Padding(padding: const EdgeInsets.all(8.0),
            child: GestureDetector(onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> CarouselDemo()));
            },child: Text('Image Scroll',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          ),
          SizedBox(
            height: 20.0,
          ),
          new Padding(padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
            },
                child: Text('Date Time Picker',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          ),
          SizedBox(
            height: 20.0,
          ),

          new Padding(padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> ListViewBuilders()));
                },
                child: Text('Profile List',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          ),
          SizedBox(
            height: 20.0,
          ),

          new Padding(padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Home()));
                },
                child: Text('Animated List',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          ),
          SizedBox(
            height: 20.0,
          ),

          new Padding(padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> SilverAppBar()));
                },
                child: Text('SilverAppBar',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          ),
          SizedBox(
            height: 20.0,
          ),

          new Padding(padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Instagram()));
                },
                child: Text('Instagram',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          ),
          SizedBox(
            height: 20.0,
          ),

          new Padding(padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Drawerdesign()));
                },
                child: Text('Drawer design',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          ),
          SizedBox(
            height: 20.0,
          ),

          new Padding(padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> HomePage()));
                },
                child: Text('HTTP',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          ),
          SizedBox(
            height: 20.0,
          ),

          new Padding(padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DateTimePicker()));
                },
                child: Text('Date Time Set',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          ),
          SizedBox(
            height: 20.0,
          ),

          new Padding(padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> Dialogboxs()));
                },
                child: Text('Date Time with dialog',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          ),
          SizedBox(
            height: 20.0,
          ),

          new Padding(padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> BottomNavBar()));
                },
                child: Text('help',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          ),
          SizedBox(
            height: 20.0,
          ),

          new Padding(padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
                onTap:(){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> MyImagePicker()));
                },
                child: Text('Upload Image',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
          ),
        ],
      ),
    );
  }
}
class ImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Icon(Icons.help,size: 100,),
          Icon(Icons.home_work_outlined,size: 100,),
          Icon(Icons.two_wheeler_sharp,size: 100,),
          Icon(Icons.hearing_disabled_sharp,size: 100,),
          Icon(Icons.help,size: 100,),
          Icon(Icons.home_work_outlined,size: 100,),
          Icon(Icons.two_wheeler_sharp,size: 100,),
          Icon(Icons.hearing_disabled_sharp,size: 100,),
        ],
      ),
    );
  }
}

