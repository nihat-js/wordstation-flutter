import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wordstation_flutter/src/screens/entry_screen.dart';
import 'package:wordstation_flutter/src/screens/game_screen.dart';

var routerConfig = <String, WidgetBuilder>{
  '/entry': (BuildContext context) => EntryScreen(),
  '/game': (BuildContext context) => const GameScreen(),
  '/credits': (BuildContext context) => const GameScreen(),
};

