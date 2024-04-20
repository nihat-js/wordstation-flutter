import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PauseMenu extends StatelessWidget {
  const PauseMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 100,
        width: MediaQuery.of(context).size.width,
        child: Container(
            color: Color.fromRGBO(3, 26, 15, 1),
            child: Text(
              "Pause menu",
              style: TextStyle(fontSize: 32, color: Colors.white),
            )),
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width * 1,
        height: 200,
        child: Container(
          color: Color(0xFF323741),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, "/level-map");
                    },
                    child: Image(
                      image: AssetImage(
                          "images/png/Buttons/Square-Medium/Repeat/Default.png"),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
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
                    onTap: () {
                      Navigator.pushReplacementNamed(context, "/level-map");
                    },
                    child: Image(
                      image: AssetImage(
                          "images/png/Buttons/Square-Medium/Levels/Default.png"),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )
    ]);
  }
}
