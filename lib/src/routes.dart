import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wordstation_flutter/src/screens/entry_screen.dart';
import 'package:wordstation_flutter/src/screens/game_screen.dart';
import 'package:wordstation_flutter/src/screens/level_map_screen.dart';

var routes = <String, WidgetBuilder>{
  '/entry': (BuildContext context) => EntryScreen(),
  // '/game': (BuildContext context) => const GameScreen(),
  // '/credits': (BuildContext context) => const GameScreen(),
  "/game": (BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    return GameScreen(level: 1);
  },
  "/level-map": (BuildContext context) => const LevelMapScreen()
};
