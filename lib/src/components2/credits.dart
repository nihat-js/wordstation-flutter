import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Credits extends StatelessWidget {
  const Credits({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 100,
        width: MediaQuery.of(context).size.width * .7,
        child: Container(
            color: Color.fromRGBO(3, 26, 15, 1),
            child: Text(
              "Credits",
              style: TextStyle(color: Colors.white),
            )),
      ),
      SizedBox(
        height: 400,
        width: MediaQuery.of(context).size.width * .7,
        child: Container(
          color: Color(0xFF323741),
          child: Column(
            children: [
              Text("Game developer : Nihat"),
              Text("Github : @nihat-js"),
              Text("Instagram : @nihat-js"),
            ],
          ),
        ),
      )
    ]);
  }
}
