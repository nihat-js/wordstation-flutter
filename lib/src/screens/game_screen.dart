import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wordstation_flutter/src/components/circular_joystick.dart';
import 'package:wordstation_flutter/src/components/status_bar.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  static const levels = [
    {
      "level": 1,
      "letters": ["a", "d", "a", "m"],
      "words": ["adam", "ada", "dama"],
      "extraWords": ["mad"],
      "coinReward": 100,
    },
    {
      "level": 2,
      "letters": ["f", "i", "n", "a", "l"],
      "words": ["final", "fin", "fani", "nal"],
      "extraWords": ["alin"]
    }
  ];
  // const words = []

  void validateInput() {}

  void revealOneLetter() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          StatusBar(),
          CircularJoystick(),
          Character(),
        ]),
      ),
    );
  }
}

class Character extends StatefulWidget {
  const Character({super.key});

  @override
  State<Character> createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  bool isRunning = false;

  double positionX = 0;
  double positionY = 0;

  double moveSpeed = 20;
  double mapOffset = 0;
  List<String> images = [
    "images/plx-2.png",
    "images/plx-3.png",
    "images/plx-4.png"
  ];

  double screenWidth = 500;
  double imageWidth = 300;

  double minimumPositionX = 100;
// 0 => 300 200,  50 => 250 250, 250 => 50,300,150, 700=>

  List<Widget> renderBackgroundWidgets() {
    List<Widget> widgets = [];
    int x = max((positionX / imageWidth).ceil(), 1);
    double offset = positionX % imageWidth;

    double firstImageWidth = imageWidth - offset;
    double secondImageWidth = min(screenWidth - firstImageWidth, imageWidth);
    double leftImageWidth = screenWidth - secondImageWidth - firstImageWidth;
    double thirdImageWidth = leftImageWidth > 0 ? leftImageWidth : 0;

    print(x);
    print(firstImageWidth);
    print(secondImageWidth);
    print(thirdImageWidth);

    widgets.add(
      Positioned(
        top: 0,
        left: 0,
        width: firstImageWidth,
        height: 200,
        child: Image(
          image: AssetImage(images[x - 1 % images.length]),
          fit: BoxFit.cover,
        ),
      ),
    );

    widgets.add(
      Positioned(
        top: 0,
        left: firstImageWidth,
        width: secondImageWidth,
        height: 200,
        child: Image(
          image: AssetImage(images[(x - 1 + 1) % images.length]),
          fit: BoxFit.cover,
        ),
      ),
    );

    if (thirdImageWidth > 0) {
      widgets.add(
        Positioned(
          top: 0,
          left: firstImageWidth + secondImageWidth,
          width: thirdImageWidth,
          height: 200,
          child: Image(
            image: AssetImage(images[(x - 1 + 2) % images.length]),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: screenWidth,
      height: 200,
      child: Container(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Stack(
            children: [
              ...renderBackgroundWidgets(),
              Image(
                width: 52,
                height: 52,
                image: AssetImage(isRunning
                    ? 'images/character-run.gif'
                    : "images/character-idle.gif"),
              ),
              GestureDetector(
                onTapDown: (TapDownDetails details) {
                  setState(() {
                    isRunning = true;
                    positionX += moveSpeed;
                  });
                },
                onTapCancel: () {
                  setState(() {
                    isRunning = false;
                  });
                },
                child: ElevatedButton(
                    onPressed: () {}, child: Icon(Icons.arrow_right)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
