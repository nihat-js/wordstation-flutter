import 'package:flutter/material.dart';
import 'dart:math' as math;

class CircularButtonLayout extends StatelessWidget {
  final int count;

  CircularButtonLayout({ this.count=  6});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circular Button Layout'),
      ),
      body: Center(
        child: Stack(
          children: List.generate(
            count,
            (index) {
              final double angle = 2 * math.pi / count * index;
              final double radius = 100.0;
              final double x = radius * math.cos(angle);
              final double y = radius * math.sin(angle);

              return Positioned(
                left: x + MediaQuery.of(context).size.width / 2,
                top: y + MediaQuery.of(context).size.height / 2,
                child: FloatingActionButton(
                  onPressed: () {
                    // Handle button tap
                  },
                  child: Text('$index'),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: CircularButtonLayout(count: 6), // Change the count value as needed
  ));
}
