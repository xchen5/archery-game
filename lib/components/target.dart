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
}
