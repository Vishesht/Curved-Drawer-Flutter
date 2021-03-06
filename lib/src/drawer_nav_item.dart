import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class DrawerNavItem extends StatelessWidget {
  final Icon icon;
  final String label;
  final double size;
  final Color color;
  final Color background;

  const DrawerNavItem(
      {Key key,
      @required this.icon,
      this.label,
      this.size = 35.0,
      this.color = Colors.black,
      this.background = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(this.size)),
      color: this.background,
      type: MaterialType.button,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: this.label.isNotEmpty
              ? <Widget>[
                  Icon(this.icon.icon, size: this.size, color: Colors.black),
                  SizedBox(width: 5),
                  Text(
                    label,
                    style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ]
              : <Widget>[
                  Icon(this.icon.icon, size: this.size, color: Colors.black),
                ],
        ),
      ),
    );
  }
}

class NavButton extends StatelessWidget {
  final double position;
  final int length;
  final int index;
  final bool isEndDrawer;
  final double width;
  final Color color;
  final ValueChanged<int> onTap;
  final Icon icon;
  final String label;
  final double size;

 

  NavButton(
      {this.onTap,
      this.position,
      this.length,
      this.isEndDrawer,
      this.width,
      this.color,
      this.index,
      this.icon,
      this.label,
        this.size = 35.0,
      });

  @override
  Widget build(BuildContext context) {
    final desiredPosition = 1.0 / length * index;
    final difference = (position - desiredPosition).abs();
    final verticalAlignment = 1 - length * difference;
    final opacity = length * difference;
    final directionMultiplier = isEndDrawer ? 1 : -1;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onTap(index);
        },
        child: Container(
            width: this.width,
            child: Transform.translate(
              offset: Offset(
                  difference < 1.0 / length
                      ? verticalAlignment * directionMultiplier * 40
                      : 0,
                  0),
              child: Opacity(
                  opacity: difference < 1.0 / length * 0.99 ? opacity : 1.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children:  this.label.isNotEmpty ? <Widget>[
                      Flexible(
                        child: RotationTransition(
                          turns: new AlwaysStoppedAnimation(90 / 360),
                          child: Text(
                            label,
                            style: TextStyle(color: Colors.black,fontSize: 16),
                          ),
                        ),
                      ),
                    ] :
                    <Widget>[
                      Icon(this.icon.icon, size: this.size, color: Colors.black),
                    ],
                  ),
              ),
            )),
      ),
    );
  }
}