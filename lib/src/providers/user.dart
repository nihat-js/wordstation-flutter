import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider with ChangeNotifier, DiagnosticableTreeMixin {
  late int coins;
  late int diamonds;
  late int level;
  late bool soundOn;
  late bool musicOn;

  late SharedPreferences prefs;
  UserProvider({required this.prefs}) {
    coins = prefs.getInt('coins') ?? 250;
    diamonds = prefs.getInt('diamonds') ?? 5;
    level = prefs.getInt('level') ?? 1;
    soundOn = prefs.getBool("soundOn") ?? true;
    musicOn = prefs.getBool("musicOn") ?? true;
  }

  Future toggleSound() async {
    await prefs.setBool("soundOn", !soundOn);
    soundOn = !soundOn;
    notifyListeners();
  }

  Future makeTransaction(
      {required int payloadDiamonds, required int payloadCoins}) async {
    coins += payloadCoins;
    diamonds += payloadDiamonds;
    await prefs.setInt("coins", coins);
    await prefs.setInt("diamonds", diamonds);
    notifyListeners();
  }

  Future levelUp() async {
    level++;
    await prefs.setInt("level", level);
  }
}
