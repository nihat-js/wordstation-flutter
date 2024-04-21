import 'package:flutter/material.dart';

class NotEnoughDialog extends StatelessWidget {
  // final Function() onWatchVideo;

  const NotEnoughDialog({
    Key? key,
    // required this.onWatchVideo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Not Enough Coins'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.money_off,
              size: 100,
              color: Colors.red,
            ),
            SizedBox(height: 20),
            Text(
              'Not Enough Coins!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.play_arrow),
                  SizedBox(width: 10),
                  Text('Watch a Video'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
