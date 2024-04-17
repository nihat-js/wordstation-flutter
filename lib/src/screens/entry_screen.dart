import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordstation_flutter/src/providers/counter.dart';

class EntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final countProvider = Provider.of<Counter>(context);

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
                // countProvider.increment();
                Navigator.pushReplacementNamed(context, "/game");
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
