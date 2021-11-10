import 'package:flutter/cupertino.dart';

class Bow {
  late double angle;
  late double x;
  late double y;

  Widget buildBow(double height, double width, double angleGiven) {
    angle = angleGiven;
    return Positioned(
      child: Transform.rotate(
        angle: angleGiven,
        child: Image.asset(
          'assets/images/bow-sprite.png',
          height: height * 0.23,
          width: width * 0.14,
        ),
      ),
      //``TODO Change from hardcoded Coordinates``
      top: 200,
      left: 75,
    );
  }
}
