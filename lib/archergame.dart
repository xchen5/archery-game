import 'dart:ui';

import 'package:archery_game/components/arrow.dart';
import 'package:archery_game/components/target.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame_forge2d/forge2d_game.dart';
import 'package:flutter/services.dart';
import 'components/bow.dart';

import 'components/world.dart';
import 'package:flutter/material.dart';

import 'helpers/direction.dart';

class ArcherGame extends Forge2DGame with HasCollidables {
  ArcherGame() : super(zoom: 1);

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
  }

  void onJoypadDirectionChanged(Direction direction) {
    _bow.direction = direction;
    _arrow.direction = direction;
  }

  void shootArrow() {
    _arrow.shootArrow(100, 100);
  }
}
