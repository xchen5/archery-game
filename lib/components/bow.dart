import 'dart:math';

import 'package:archery_game/helpers/direction.dart';
import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';

class Bow extends SpriteComponent with HasGameRef {
  Direction direction = Direction.none;
  Bow()
      : super(
          size: Vector2.all(100.0),
        );

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('bow-sprite.png');
    angle = 0;
    anchor = Anchor.center;
    position = Vector2(100, gameRef.size.y / 2);
  }

  @override
  void update(double dt) {
    super.update(dt);
    moveBow(dt);
  }

  void moveBow(double delta) {
    switch (direction) {
      case Direction.up:
        moveUp(delta);
        break;
      case Direction.down:
        moveDown(delta);
        break;
      case Direction.left:
        moveLeft(delta);
        break;
      case Direction.right:
        moveRight(delta);
        break;
      case Direction.none:
        break;
    }
  }

  void moveUp(double delta) {
    angle -= delta * 2.5;
  }

  void moveDown(double delta) {
    angle += delta * 2.5;
  }

  void moveLeft(double delta) {
    //position.add(Vector2(delta * -_playerSpeed, 0));
  }

  void moveRight(double delta) {
    //position.add(Vector2(delta * _playerSpeed, 0));
  }
}
