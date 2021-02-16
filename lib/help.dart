import 'package:curved_drawer/curved_drawer.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';


class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State {
  int _page = 0;
  int _drawer = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("hjbdv"),
      ),
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 50.0,
          items: [
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.compare_arrows, size: 30),
            Icon(Icons.call_split, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.blue,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.white,
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        body: Container(
          color: Colors.white,
          // child: Center(
          //   child: Column(
          //     children: [
          //       Text(_page.toString(), textScaleFactor: 10.0),
          //       RaisedButton(
          //         child: Text('Go To Page of index 1'),
          //         onPressed: () {
          //           final CurvedNavigationBarState navBarState =
          //               _bottomNavigationKey.currentState;
          //           navBarState.setPage(1);
          //         },
          //       )
          //     ],
          //   ),
          // ),
        ));
  }
}