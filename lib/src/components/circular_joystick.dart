import 'package:flutter/material.dart';
import "dart:math";

class CircularJoystick extends StatelessWidget {
  const CircularJoystick({super.key});

  double calculateLeftPosition(double parentWidth, double childWidth) {
    return (parentWidth - childWidth) / 2;
  }

  double calculateTopPosition(double parentWidth, double childWidth) {
    return (parentWidth - childWidth) / 2;
  }

  @override
  Widget build(BuildContext context) {
    double size = 300;
    double buttonRadius = size / 4;

    var buttons = _buildButtons(["A", "D", "A", "M", "E", "O"],
        radius: buttonRadius, cx: size / 2, cy: size / 2);

    return Center(
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
                    onPressed: () => {},
                  ),
                ),
              ),
              ...buttons,
            ],
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
