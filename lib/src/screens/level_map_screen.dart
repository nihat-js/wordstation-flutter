import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:wordstation_flutter/src/components/status_bar.dart';
import 'package:wordstation_flutter/src/config.dart';
import 'package:wordstation_flutter/src/providers/user.dart';

class LevelMapScreen extends StatefulWidget {
  const LevelMapScreen({super.key});

  @override
  State<LevelMapScreen> createState() => _LevelMapScreenState();
}

class _LevelMapScreenState extends State<LevelMapScreen> {
  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);

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
                // height: 600,
                child: Container(
                  padding: EdgeInsets.all(30),
                  // color: Colors.white,
                  decoration: BoxDecoration(
                    // border: Border.all(width: 3, color: Colors.amber),
                    // borderRadius: BorderRadius.all(Radius.circular(10)),
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
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 96, 66, 14)),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          ...levels.map((e) => GestureDetector(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    "/game",
                                    arguments: {"level": e.level},
                                  );
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 25),
                                  color: Color.fromRGBO(42, 46, 55, 1),
                                  // decoration: BoxDecoration(
                                  //   border: Border.all(
                                  //       width: 2, color: Colors.redAccent),
                                  //   // borderRadius: BorderRadius.all(Radius.lerp(l));
                                  // ),
                                  child: SizedBox(
                                      width: 60,
                                      height: 60,
                                      child: Center(
                                        child: e.level > userProvider.level
                                            ? Opacity(
                                                opacity: .5,
                                                child: Image(
                                                  image: AssetImage(
                                                      "images/png/Level/Button/Locked/Default.png"),
                                                ),
                                              )
                                            : Text(
                                                "${e.level} ",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 40,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                      )
                                      // Image(
                                      //   image: AssetImage(e.backgroundImage),
                                      //   width: 30,
                                      //   height: 30,
                                      // ),
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
