import 'dart:io';

import 'package:archery_game/archergame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:archery_game/components/globalvar.dart';

class MainGamePage extends StatefulWidget {
  const MainGamePage({Key? key}) : super(key: key);

  @override
  MainGameState createState() => MainGameState();
}

class MainGameState extends State<MainGamePage> {
  ArcherGame game = ArcherGame();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        body: Stack(
          children: [
            GameWidget(game: game),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ValueListenableBuilder<int>(
                    builder: (BuildContext context, int value, Widget? child) {
                      return Text("Lives: $value");
                    },
                    valueListenable: GlobalVar.lives,
                  )),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ValueListenableBuilder<int>(
                    builder: (BuildContext context, int value, Widget? child) {
                      return Text("Score: $value");
                    },
                    valueListenable: GlobalVar.score,
                  )),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    game.shootArrow();
                  },
                  child: const Text("Shoot Arrow"),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    GlobalVar.lives.value = 3;
                    GlobalVar.score.value = 0;
                  },
                  child: const Text("Restart"),
                ),
              ),
            )
          ],
        ));
  }
}
