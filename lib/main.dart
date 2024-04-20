import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wordstation_flutter/src/providers/user.dart';
import 'package:wordstation_flutter/src/routes.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedPreferences prefs = await SharedPreferences.getInstance();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserProvider(prefs: prefs))
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
      debugShowCheckedModeBanner: false,
    );
  }
}
