import 'package:flutter/material.dart';
import 'package:wordstation_flutter/src/components/circular_layout.dart';
import 'package:wordstation_flutter/src/providers/counter.dart';
import 'package:wordstation_flutter/src/router.dart';
import 'package:provider/provider.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => Counter()),
    ],
    child:  App(),
    ));
}


class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'WordStation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: routerConfig,
    );
  }
}




// ... other code ...

class WordStationGame extends StatefulWidget {
  @override
  _WordStationGameState createState() => _WordStationGameState();
}

class _WordStationGameState extends State<WordStationGame> {
  List<String> letters = ["a", "d", "a", "m"];
  List<String> vocabulary = ["adam", "dama", "ada"];
  String currentTypedWord = '';
  String feedbackMessage = '';

  void checkWordValidity() {
    if (vocabulary.contains(currentTypedWord)) {
      setState(() {
        feedbackMessage = 'Congratulations! You found a valid word: $currentTypedWord';
      });
    } else {
      setState(() {
        feedbackMessage = '$currentTypedWord is not a valid word. Try again!';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WordStation'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: letters.length,
              children: letters.map((letter) {
                return GestureDetector(
                  onTapDown: (_) {
                    setState(() {
                      currentTypedWord += letter;
                    });
                  },
                  onTapCancel: () {
                    setState(() {
                      currentTypedWord = '';
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: Center(
                      child: Text(letter),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          CircularButtonLayout(),
          GestureDetector(
            onTap: () {
              checkWordValidity();
              setState(() {
                currentTypedWord = '';
              });
            },
            child: Container(
              color: Colors.blue,
              padding: EdgeInsets.all(16),
              child: Text(
                'Check Word',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(height: 8),
          Text(
            feedbackMessage,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}