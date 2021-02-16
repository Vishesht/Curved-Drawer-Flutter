//import 'package:after_layout/after_layout.dart';
import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';

class AnimatedDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drawer'),
      ),
      endDrawer: SidebarLayout(),
      body: Container(
        child: Text('fnrrev'),
      ),
    );
  }
}
class SidebarLayout extends StatefulWidget {
  @override
  _SidebarLayoutState createState() => _SidebarLayoutState();
}

class _SidebarLayoutState extends State<SidebarLayout> with AfterLayoutMixin{
  int selectedIndex = 0;
  LabeledGlobalKey _packageKey = LabeledGlobalKey("packageKey");
  LabeledGlobalKey _TermsKey = LabeledGlobalKey("TermsKey");
  LabeledGlobalKey _PrivacyKey = LabeledGlobalKey("PrivacyKey");
  LabeledGlobalKey _ContactKey = LabeledGlobalKey("ContactKey");
  LabeledGlobalKey _RateKey = LabeledGlobalKey("RateKey");

  RenderBox renderBox;
  double startYPosition;

  void onTabTap(int index) {
    setState(() {
      selectedIndex = index;
      switch (selectedIndex) {
        case 0:
          renderBox = _packageKey.currentContext.findRenderObject();
          break;
        case 1:
          renderBox = _TermsKey.currentContext.findRenderObject();
          break;
        case 2:
          renderBox = _PrivacyKey.currentContext.findRenderObject();
          break;
        case 3:
          renderBox = _ContactKey.currentContext.findRenderObject();
          break;
        case 4:
          renderBox = _RateKey.currentContext.findRenderObject();
          break;
      }

      startYPosition = renderBox.localToGlobal(Offset.zero).dy;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          width: 100,
          top: 0,
          bottom: 0,
          right: 0,
          child: ClipPath(
            clipper: SidebarClipper(
              (startYPosition == null) ?  0 : startYPosition - 40,
              (startYPosition == null) ? 0 :  startYPosition + 80,
            ),
            child: Container(
              color: Colors.white,
            ),
          ),
        ),
        Positioned(
          right: -25,
          top: 0,
          bottom: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(top: 26,left: 155),
                child: Icon(
                  Icons.dashboard,
                  color: Colors.black,
                ),
              ),
              SidebarItem(
                key: _packageKey,
                text: "Package",
                onTabTap: () {
                  onTabTap(0);
                },
                isSelected: selectedIndex == 0,
              ),

              Padding(
                padding: EdgeInsets.only(bottom: 16),
                child: SidebarItem(
                  key: _TermsKey,
                  text: "Terms & Conditions",
                  onTabTap: () {
                    onTabTap(1);
                  },
                  isSelected: selectedIndex == 1,
                ),
              ),

              SidebarItem(
                key: _PrivacyKey,
                text: "Privacy Policy",
                onTabTap: () {
                  onTabTap(2);
                },
                isSelected: selectedIndex == 2,
              ),

              SidebarItem(
                key: _ContactKey,
                text: "Contact us",
                onTabTap: () {
                  onTabTap(3);
                },
                isSelected: selectedIndex == 3,
              ),

              SidebarItem(
                key: _RateKey,
                text: "Rate App",
                onTabTap: () {
                  onTabTap(4);
                },
                isSelected: selectedIndex == 4,
              ),
              Container(
                margin: EdgeInsets.only(bottom: 26,left: 155),
                child: Icon(
                  Icons.login_outlined,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  @override
  void afterFirstLayout(BuildContext context) {
    setState(() {
      renderBox = _packageKey.currentContext.findRenderObject();
      startYPosition = renderBox.localToGlobal(Offset.zero).dy;
    });
  }
}

class SidebarClipper extends CustomClipper<Path> {
  final double startYPosition, endYPosition;

  SidebarClipper(this.startYPosition, this.endYPosition);

  @override
  Path getClip(Size size) {
    Path path = Path();

    double width = size.width;
    double height = size.height;

    //up curve
    path.moveTo(width, 0);
    path.quadraticBezierTo(width / 3, 5, width / 3, 70);

    //custom curve
     path.lineTo(width / 3, startYPosition + 25);
     path.quadraticBezierTo(75, startYPosition + 50, width / 3 - 1, startYPosition + 74);
    // path.quadraticBezierTo(0, endYPosition - 45, width / 3 - 10, endYPosition - 25);
    // path.quadraticBezierTo(width / 3 - 2, endYPosition - 15, width / 3, endYPosition);


    //down curve
    path.lineTo(width / 3, height - 70);
    path.quadraticBezierTo(width / 3, height - 5, width, height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
///////////////sidebar items
class SidebarItem extends StatelessWidget {
  final isSelected;
  final String text;
  final Function onTabTap;

  const SidebarItem({
    Key key,
    this.isSelected,
    this.text,
    this.onTabTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: isSelected ? true : false,
              child: Container(
                margin: EdgeInsets.only(bottom: 10),
                width: 165,
                height: 36,
                //padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                ),
                child: Center(
                  child: Text(
                    text,style: TextStyle(fontSize: 16,color: Colors.black,fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SizedBox(width: 110,),
            Visibility(
              visible: isSelected ? false : true,
              child: Container(
                margin: EdgeInsets.only(left: 30),
                padding: EdgeInsets.all(10.0),
                //margin: EdgeInsets.only(left: 108),
                child: Transform.rotate(
                  angle: 7.85,
                  child: GestureDetector(
                    onTap: onTabTap,
                    child: Text(
                      text,style: TextStyle(fontSize: 12,color: Colors.black,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      //SizedBox(width: 0,),
      ],
    );
  }
}

////////////////sidebar items