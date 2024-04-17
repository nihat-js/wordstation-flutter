import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier, DiagnosticableTreeMixin {
  int _coins = 500;
  int _diamonds = 5;

  int get coins => _coins;
  int get diamonds => _diamonds;

  void earnAward() {}

  void spendAward() {}
}
