import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Archery Game',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
  Widget buildTarget(double height, double width) {
    Random r = Random();
    //TODO Change from hardcoded Coordinates
    double randomDouble = r.nextDouble() * 200;
    print(randomDouble);
    return Positioned(
        child: Image.asset(
          'assets/images/target-sprite.png',
          height: height * 0.23,
          width: width * 0.14,
        ),
        //TODO Change from hardcoded Coordinates
        left: 500,
        right: 100,
        top: randomDouble);
  }

  Widget buildBow(double height, double width) {
    return Positioned(
      child: Image.asset(
        'assets/images/bow-sprite.png',
        height: height * 0.23,
        width: width * 0.14,
      ),
      //TODO Change from hardcoded Coordinates
      top: 200,
      left: 75,
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenWidth = screenSize.width;
    final screenHeight = screenSize.height;
    print(screenWidth);
    print(screenHeight);
    return Scaffold(
        backgroundColor: Colors.grey,
        body: Container(
          child: Stack(
            children: [
              Stack(
                children: [buildTarget(screenHeight, screenWidth)],
              ),
              buildBow(screenHeight, screenWidth)
            ],
          ),
        ));
  }
}
