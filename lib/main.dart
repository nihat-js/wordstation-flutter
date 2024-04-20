import 'package:flutter/material.dart';
import 'package:wordstation_flutter/src/providers/user.dart';
import 'package:wordstation_flutter/src/routes.dart';
import 'package:provider/provider.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
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
      initialRoute: '/game2',
      debugShowCheckedModeBanner: false,
    );
  }
}
