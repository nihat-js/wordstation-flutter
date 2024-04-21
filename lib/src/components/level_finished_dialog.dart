import 'package:flutter/material.dart';

class LevelFinishedDialog extends StatelessWidget {
  final int nextLevel;

  const LevelFinishedDialog({
    Key? key,
    required this.nextLevel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Level Finished!',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle,
            size: 100,
            color: Colors.green,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.popAndPushNamed(
                context,
                "/game",
                arguments: {"level": nextLevel},
              );
            },
            child: Text('Next Level'),
          ),
        ],
      ),
    );
  }
}
