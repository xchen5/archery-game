import 'package:archery_game/archergame.dart';
import 'package:flame/game.dart';
import 'package:flutter/material.dart';

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
                  padding: const EdgeInsets.all(10.0), child: Text("Lives: 3")),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                  padding: const EdgeInsets.all(10.0), child: Text("Score: 0")),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    game.shootArrow();
                  },
                  child: Text("Shoot Arrow"),
                ),
              ),
            )
          ],
        ));
  }
}
