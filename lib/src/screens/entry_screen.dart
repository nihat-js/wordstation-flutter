import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:wordstation_flutter/src/components/status_bar.dart';
import 'package:wordstation_flutter/src/components2/credits.dart';
import 'package:wordstation_flutter/src/providers/user.dart';

class EntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final countProvider = Provider.of<Counter>(context);
    final userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(children: [
          StatusBar(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 70,
                ),
                Text(
                  "Word Station",
                  style: TextStyle(
                      color: Colors.yellowAccent,
                      fontSize: 40,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 150,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                                context, "/level-map");
                          },
                          child: Image(
                            image: AssetImage(
                                "images/png/Buttons/Square-Medium/Levels/Default.png"),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, "/game",
                                arguments: {
                                  "level": userProvider.level,
                                });
                          },
                          child: Container(
                            margin: EdgeInsets.only(bottom: 60),
                            child: Image(
                              image: AssetImage(
                                  "images/png/Buttons/Square-Medium/Play/Default.png"),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            await userProvider.toggleSound();
                          },
                          child: Image(
                              image: AssetImage(userProvider.soundOn
                                  ? "images/png/Buttons/Square-Medium/SoundOn/Default.png"
                                  : "images/png/Buttons/Square-Medium/SoundOff/Default.png")),
                        ),
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () {
                          //   userProvider.makeTransaction(
                          //       payloadDiamonds: 5, payloadCoins: 50);
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              content: Credits(),
                            ),
                          );
                        },
                        child: Text("Credits")),
                    ElevatedButton(onPressed: () {}, child: Text("Quit"))
                  ],
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
