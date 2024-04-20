import 'package:flutter/material.dart';
import 'package:wordstation_flutter/src/providers/user.dart';
import 'package:wordstation_flutter/src/routes.dart';
import 'package:provider/provider.dart';


import 'dart:ui';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/components/joystick/joystick.dart';
import 'package:flame/components/joystick/joystick_action.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.util.fullScreen();
  await Flame.util.setLandscape();
  runApp(MyGame().widget);
}

class MyGame extends BaseGame {
  late Joystick joystick;
  late double playerX, playerY, playerSpeed;
  late Paint playerPaint;

  MyGame() {
    initialize();
  }

  void initialize() async {
    joystick = Joystick(
      joystickMode: JoystickMode.all,
      size: 150,
      opacityBackground: 0.5,
      opacityKnob: 0.8,
      color: Colors.blue,
      knobColor: Colors.blue,
      isFixed: false,
    );
    joystick.initialize();
    joystick.position = Offset(100, 100);
    add(joystick);

    playerX = size.width / 2;
    playerY = size.height / 2;
    playerSpeed = 5;

    playerPaint = Paint()..color = Colors.red;
  }

  @override
  void render(Canvas canvas) {
    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), Paint()..color = Colors.white);
    canvas.drawRect(Rect.fromLTWH(playerX, playerY, 50, 50), playerPaint);
    joystick.render(canvas);
  }

  @override
  void update(double dt) {
    joystick.update(dt);
    if (joystick.direction != JoystickDirectionalEvent(dir: 0, distance: 0)) {
      playerX += joystick.delta.dx * playerSpeed;
      playerY += joystick.delta.dy * playerSpeed;
    }
  }

  @override
  void resize(Size size) {
    super.resize(size);
    joystick.position = Offset(size.width - joystick.size - 50, size.height - joystick.size - 50);
  }
}





// void main() {
//   WidgetsFlutterBinding.ensureInitialized();
//   runApp(MultiProvider(
//     providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
//     child: App(),
//   ));
// }

// class App extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'WordStation',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       routes: routes,
//       initialRoute: '/entry',
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }



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
