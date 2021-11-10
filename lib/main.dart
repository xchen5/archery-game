import 'dart:math';

import 'package:archery_game/bow.dart';
import 'package:archery_game/lives.dart';
import 'package:archery_game/target.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';

Random randObj = Random();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft])
      .then((_) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [])
        .then((value) => runApp(const MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Archery Game',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Archery Game'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double angle = 0;
  double randDouble = randObj.nextDouble() * 200;
  Target targetObj = Target();
  Lives livesObj = Lives(3);

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    Bow bowObj = Bow();

    //print(screenWidth);
    //print(screenHeight);
    return GestureDetector(
        onVerticalDragUpdate: (DragUpdateDetails details) {
          //print("update");
          //print(details);
          //print("---------------------");
          setState(() {
            //rebuild everytime when dragupdate is triggered
            angle += details.delta.dy / 50;
          });
        },
        child: Scaffold(
            backgroundColor: Colors.grey,
            body: Stack(
              children: [
                Text("Lives: ${livesObj.getLives}",
                    style:
                        //TODO fix hardcoded coordinates
                        const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25)),
                Stack(
                  children: [
                    targetObj.buildTarget(screenHeight, screenWidth, randDouble)
                  ],
                ),
                bowObj.buildBow(screenHeight, screenWidth, angle)
              ],
            )));
  }
}
