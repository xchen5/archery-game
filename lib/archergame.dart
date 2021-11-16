import 'package:archery_game/components/arrow.dart';
import 'package:archery_game/components/globalvar.dart';
import 'package:archery_game/components/target.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'components/bow.dart';

import 'components/world.dart';

class ArcherGame extends FlameGame with HasCollidables {
  final World _world = World();
  final Bow _bow = Bow();
  final Target _target = Target();
  final Arrow _arrow = Arrow();
  TextPaint regular = TextPaint();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await add(_world);
    await add(_target);
    await add(_bow);
    await add(_arrow);
    await add(TextComponent('Score: ${GlobalVar.score}', textRenderer: regular)
      ..anchor = Anchor.bottomLeft
      ..x = 0 // size is a property from game
      ..y = size.y);
    await add(TextComponent('Lives ${GlobalVar.lives}', textRenderer: regular)
      ..anchor = Anchor.topLeft
      ..x = 0 // size is a property from game
      ..y = 0);
    moveTarget();
  }

  void shootArrow() {
    _arrow.shootArrow();
  }

  void moveTarget() {
    _target.moveTarget();
  }
}
