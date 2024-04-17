import 'package:flutter/material.dart';
import 'package:wordstation_flutter/src/components/circular_joystick.dart';

class GameScreen extends StatelessWidget {
  const GameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text("This is game"), CircularJoystick()]),
      ),
    );
  }
}
