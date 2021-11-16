import 'package:flame/components.dart';

class Bow extends SpriteComponent with HasGameRef {
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
}
