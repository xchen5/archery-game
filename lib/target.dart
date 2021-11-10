import 'package:flutter/cupertino.dart';

class Target {
  late double yValue;

  Widget buildTarget(double height, double width, double randY) {
    //TODO Change from hardcoded Coordinates
    yValue = randY;
    return Positioned(
        child: Image.asset(
          'assets/images/target-sprite.png',
          height: height * 0.23,
          width: width * 0.14,
        ),
        //TODO Change from hardcoded Coordinates
        left: 500,
        right: 100,
        top: yValue);
  }
}
