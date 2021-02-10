import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AnimatedList',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<AnimatedListState> animatedListKey = GlobalKey<AnimatedListState>();
  List<String> list = new List<String>();
  var rng = new Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedList'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => addItem(),
      ),
      body: Center(
        child: AnimatedList(
          key: animatedListKey,
          initialItemCount: list.length,
          itemBuilder: (context, index, animation){
            return SizeTransition(
              sizeFactor: animation,
              child: Dismissible(
                key: Key('${list[index].hashCode}'),
                onDismissed: (direction) => removeItem(list[index], index),
                background: Container(color: Colors.red[700]),
                direction: DismissDirection.startToEnd,
                child: TextContainer(text: list[index]),
              ),
            );
          },
        ),
      ),
    );
  }

  void addItem(){
    list.add('item ${rng.nextInt(100)}');
    animatedListKey.currentState.insertItem(list.length-1);
  }

  void removeItem(String item, int index){
    animatedListKey.currentState.removeItem(index, (context, animation) {
      return SizedBox(width: 0, height: 0);
    });
    list.remove(item);
  }
}

class TextContainer extends StatelessWidget {
  final String text;

  TextContainer({
    @required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(8),
      child: Text(text),
    );
  }
}