import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame/sprite.dart';

class Target extends SpriteComponent with HasGameRef, Hitbox, Collidable {
  late double yValue;

  Target()
      : super(
          size: Vector2.all(100.0),
        );

  @override
  Future<void> onLoad() async {
    super.onLoad();
    Random randomObj = Random();
    sprite = await gameRef.loadSprite('target-sprite.png');
    position = Vector2(gameRef.size.x * .8, randomObj.nextDouble() * 200);
  }

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
