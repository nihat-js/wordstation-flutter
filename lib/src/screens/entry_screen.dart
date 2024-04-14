import 'package:flutter/material.dart';

class EntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WordStation'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Continue'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WordStationGame()),
                );
              },
            ),
            ElevatedButton(
              child: Text('Settings'),
              onPressed: () {
                // Navigate to settings screen
              },
            ),
          ],
        ),
      ),
    );
  }
}