import 'dart:io';

import 'package:flutter/cupertino.dart';

class Arrow {
  late double angle;
  late double x;
  late double y;

  Widget buildArrow(double height, double width, double angleGiven,
      double arrowX, double arrowY) {
    angle = angleGiven;
    x = arrowX;
    y = arrowY;

    return Positioned(
      child: Transform.rotate(
        angle: angleGiven,
        child: Image.asset(
          'assets/images/arrow-sprite.png',
          height: height * 0.23,
          width: width * 0.14,
          scale: 4.55,
        ),
      ),
      //``TODO Change from hardcoded Coordinates``
      top: arrowY,
      left: arrowX,
    );
  }

  void moveArrow() {
    x++;
    y++;
    print(x);
    print(y);
  }
}
