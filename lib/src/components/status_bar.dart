import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordstation_flutter/src/providers/user.dart';

class StatusBar extends StatelessWidget {
  //  int coins;
  //  int crowns;

  StatusBar({super.key});

  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context);
    return Container(
      height: 40,
      color: Colors.blueGrey,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: [
              Icon(Icons.attach_money, color: Colors.yellow),
              SizedBox(width: 1),
              Text('${provider.coins}', style: TextStyle(color: Colors.white)),
            ],
          ),
          SizedBox(
            width: 12,
          ),
          Row(
            children: [
              Icon(Icons.diamond, color: Colors.amber),
              SizedBox(width: 1),
              Text('${provider.diamonds} ',
                  style: TextStyle(color: Colors.white)),
            ],
          ),
        ],
      ),
    );
  }
}