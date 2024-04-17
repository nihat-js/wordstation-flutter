import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import "dart:math";

import 'package:flutter/services.dart';

class CircularJoystick extends StatefulWidget {
  const CircularJoystick({super.key});

  @override
  State<CircularJoystick> createState() => _CircularJoystickState();
}

class _CircularJoystickState extends State<CircularJoystick> {
  double calculateLeftPosition(double parentWidth, double childWidth) {
    return (parentWidth - childWidth) / 2;
  }

  double calculateTopPosition(double parentWidth, double childWidth) {
    return (parentWidth - childWidth) / 2;
  }

  bool isDown = false;

  List<String> letters = ["A", "D", "A", "M", "E", "O"];
  @override
  Widget build(BuildContext context) {
    double size = 300;
    double buttonRadius = size / 4;
    var buttons = _buildButtons(letters,
        radius: buttonRadius, cx: size / 2, cy: size / 2);

    return Center(
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanUpdate: (event) {
          if (isDown == true) {
            print("moving");
          }
        },
        onPanDown: (event) {
          setState(() {
            isDown = true;
            print("pointerdown  ");
          });
        },
        onPanEnd: (event) {
          setState(() {
            isDown = false;
            print("pointerup ");
          });
        },
        child: SizedBox(
          width: size,
          height: size,
          child: DecoratedBox(
            decoration: BoxDecoration(color: Colors.blue),
            child: Stack(
              children: [
                Positioned(
                  left: calculateLeftPosition(size, buttonRadius),
                  top: calculateTopPosition(size, buttonRadius),
                  child: SizedBox(
                    width: buttonRadius,
                    height: buttonRadius,
                    child: ElevatedButton(
                      child: Center(child: Icon(Icons.refresh_rounded)),
                      onPressed: () => {
                        setState(() {
                          letters.shuffle();
                        })
                      },
                    ),
                  ),
                ),
                ...buttons,
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _buildButtons(List buttonNames,
      {required double radius, required double cx, required double cy}) {
    return buttonNames.asMap().entries.map((entry) {
      final double angle = pi * 2 / buttonNames.length * entry.key;
      final double x = cx + radius * sin(angle);
      final double y = cy + radius * cos(angle);
      return Positioned(
        // top: calculateTopPosition(200, x),
        left: x - radius / 2,
        top: y - radius / 2,
        child: SizedBox(
          width: radius,
          height: radius,
          child: ElevatedButton(
            onPressed: () {
              // Handle button tap
            },
            child: Text(entry.value),
          ),
        ),
      );
    }).toList();
  }
}
