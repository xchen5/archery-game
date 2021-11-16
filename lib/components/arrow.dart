import 'dart:io';

import 'package:archery_game/helpers/direction.dart';
import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flame/effects.dart';

class Arrow extends SpriteComponent with HasGameRef {
  Direction direction = Direction.none;
  Arrow()
      : super(
          size: Vector2(90, (73 / 362) * 90),
        );

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('arrow-sprite.png');
    angle = 0;
    anchor = Anchor.center;
    position = Vector2(100, (gameRef.size.y / 2));
  }

  @override
  void update(double dt) {
    super.update(dt);
    moveArrow(dt);
  }

  void moveArrow(double delta) {
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

  void shootArrow(double speed, double dt) {
    position.add(Vector2(10, 0));
    position.add(Vector2(0, 10));
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
