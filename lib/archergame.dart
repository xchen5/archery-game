import 'dart:ui';

import 'package:archery_game/components/target.dart';
import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/services.dart';
import 'components/bow.dart';

import 'components/world.dart';
import 'package:flutter/material.dart';

import 'helpers/direction.dart';

class ArcherGame extends FlameGame with HasCollidables {
  final World _world = World();
  final Bow _bow = Bow();
  final Target _target = Target();

  @override
  Future<void> onLoad() async {
    super.onLoad();
    await add(_world);
    await add(_bow);
    await add(_target);
  }

  void onJoypadDirectionChanged(Direction direction) {
    _bow.direction = direction;
  }
}