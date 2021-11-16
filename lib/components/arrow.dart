import 'dart:io';

import 'package:flame/components.dart';
import 'package:flame/geometry.dart';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flame_forge2d/body_component.dart';
import 'package:flame/palette.dart';
import 'package:flame_forge2d/contact_callbacks.dart';
import 'package:forge2d/forge2d.dart';

import 'package:flutter/cupertino.dart';
import 'package:flame/effects.dart';

class Arrow extends SpriteComponent with HasGameRef, Hitbox, Collidable {
  late MoveEffect arrowEffect;
  Arrow()
      : super(
          size: Vector2(90, (73 / 362) * 90),
        );

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('arrow-sprite.png');
    addHitbox(HitboxRectangle());
    anchor = Anchor.center;
    position = Vector2(100, (gameRef.size.y / 2));
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, Collidable other) {
    // TODO: implement onCollision
    super.onCollision(intersectionPoints, other);
    print(intersectionPoints);
    remove(arrowEffect);
    position.x = 100;
    print("collided");
  }

  void shootArrow() {
    MoveEffect arrowShot = MoveEffect(
        path: [Vector2(gameRef.size.x * .9, position.y)],
        duration: 2,
        curve: Curves.decelerate);
    arrowEffect = arrowShot;
    add(arrowShot);
    print(position.x);
  }
}
