import 'dart:math';

import 'package:flame/effects.dart';
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

  void moveTarget() {
    add(MoveEffect(
        path: [
          Vector2(position.x, 0),
          Vector2(position.x, gameRef.size.y - 100)
        ],
        duration: 5,
        isInfinite: true,
        isAlternating: true,
        curve: Curves.linear));
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    super.onCollision(intersectionPoints, other);
    if (intersectionPoints.elementAt(0)[0].floor() == position.x.floor() ||
        intersectionPoints.elementAt(1)[0].floor() == position.x.floor()) {
      print("SUCESSS");
    } else {
      print("FAILED");
    }
  }

  @override
  Future<void> onLoad() async {
    super.onLoad();
    addHitbox(HitboxRectangle());
    sprite = await gameRef.loadSprite('target-sprite.png');
    position = Vector2(gameRef.size.x * .8, 0);
  }
}
