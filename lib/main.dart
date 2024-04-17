import 'package:flutter/material.dart';
import 'package:wordstation_flutter/src/components/circular_joystick.dart';
import 'package:wordstation_flutter/src/providers/counter.dart';
import 'package:wordstation_flutter/src/routes.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => Counter()),
    ],
    child: App(),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WordStation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: routes,
      initialRoute: '/entry',
      debugShowCheckedModeBanner: true,
    );
  }
}



  // List<String> letters = ["a", "d", "a", "m"];
  // List<String> vocabulary = ["adam", "dama", "ada"];
  // String currentTypedWord = '';
  // String feedbackMessage = '';

  // void checkWordValidity() {
  //   if (vocabulary.contains(currentTypedWord)) {
  //     setState(() {
  //       feedbackMessage =
  //           'Congratulations! You found a valid word: $currentTypedWord';
  //     });
  //   } else {
  //     setState(() {
  //       feedbackMessage = '$currentTypedWord is not a valid word. Try again!';
  //     });
  //   }
  // }
