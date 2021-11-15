import 'package:archery_game/helpers/direction.dart';
import 'package:flame/components.dart';
import 'package:flutter/cupertino.dart';

class Bow extends SpriteComponent with HasGameRef {
  late double angle;
  late double x;
  late double y;
  Direction direction = Direction.none;

  Bow()
      : super(
          size: Vector2.all(100.0),
        );

  @override
  Future<void> onLoad() async {
    super.onLoad();
    sprite = await gameRef.loadSprite('bow-sprite.png');
    position = Vector2(0.0, gameRef.size.y / 2);
  }

  @override
  void update(double delta) {
    super.update(delta);
    rotateBow(delta);
  }

  void rotateBow(delta) {}
}
