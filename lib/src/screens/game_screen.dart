import 'package:flutter/material.dart';
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
        ]),
      ),
    );
  }
}
