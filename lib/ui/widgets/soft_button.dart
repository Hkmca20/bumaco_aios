import 'package:flutter/material.dart';

class CircularSoftButton extends StatelessWidget {
  double radius;
  final Widget icon;
  Color backgroundColor = Color(0xFFF1F2F6);
  Color shadowColor = Color(0xFFDADFF0);
  Color lightShadowColor = Colors.white;

  CircularSoftButton({Key? key, this.radius = 32.0, required this.icon})
      : super(key: key) {
    if ( radius <= 0) radius = 32.0;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(radius / 2),
      child: Stack(
        children: <Widget>[
          Container(
            width: radius * 2,
            height: radius * 2,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(radius),
              boxShadow: [
                BoxShadow(
                    color: shadowColor, offset: Offset(8, 6), blurRadius: 12),
                BoxShadow(
                    color: lightShadowColor,
                    offset: Offset(-8, -6),
                    blurRadius: 12),
              ],
            ),
          ),
          Positioned.fill(child: icon),
        ],
      ),
    );
  }
}
