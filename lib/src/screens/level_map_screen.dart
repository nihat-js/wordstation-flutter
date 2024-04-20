import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wordstation_flutter/src/components/status_bar.dart';
import 'package:wordstation_flutter/src/config.dart';

class LevelMapScreen extends StatefulWidget {
  const LevelMapScreen({super.key});

  @override
  State<LevelMapScreen> createState() => _LevelMapScreenState();
}

class _LevelMapScreenState extends State<LevelMapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/bg-3.jpg"), fit: BoxFit.cover),
          ),
          // margin: EdgeInsetsGeometry.,
          child: Column(
            children: [
              StatusBar(),
              SizedBox(
                height: 300,
                child: Container(
                  padding: EdgeInsets.all(30),
                  // color: Colors.white,
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.amber),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    shape: BoxShape.rectangle,
                  ),
                  child: Column(
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, "/entry");
                          },
                          child: Text("Go back")),
                      Text(
                        "Levels",
                        style:
                            TextStyle(fontSize: 30, color: Colors.amber[700]),
                      ),
                      Row(
                        children: [
                          ...levels.map((e) => GestureDetector(
                                onTap: () {
                                  print("bax");
                                  Navigator.pushReplacementNamed(
                                    context,
                                    "/game",
                                    arguments: {"level": e.level as int},
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(width: 3)),
                                  child: Column(
                                    children: [
                                      Text("Level ${e.level} "),
                                      SizedBox(height: 5),
                                      Image(
                                        image: AssetImage(e.backgroundImage),
                                        width: 30,
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                ),
                              ))
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
