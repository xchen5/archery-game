import 'package:archery_game/components/arrow.dart';
import 'package:archery_game/components/target.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'components/bow.dart';

import 'components/world.dart';

class ArcherGame extends FlameGame with HasCollidables {
  final World _world = World();
  final Bow _bow = Bow();
  final Target _target = Target();
  final Arrow _arrow = Arrow();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await add(_world);
    await add(_target);
    await add(_bow);
    await add(_arrow);
    moveTarget();
  }

  void shootArrow() {
    _arrow.shootArrow();
  }

  void moveTarget() {
    _target.moveTarget();
  }
}
