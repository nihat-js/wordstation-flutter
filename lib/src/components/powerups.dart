import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordstation_flutter/src/components/letter_block.dart';
import 'package:wordstation_flutter/src/providers/user.dart';

class PowerUps extends StatelessWidget {
  final Function updateLetterBlocks;
  final List<LetterBlock> letterBlocks;
  const PowerUps(
      {super.key,
      required this.updateLetterBlocks,
      required this.letterBlocks});

  @override
  Widget build(BuildContext context) {
    UserProvider provider = Provider.of<UserProvider>(context, listen: false);

    revealOneLetter() {
      print("letter");
      if (provider.coins <= 0) {
        return;
      }
      List<LetterBlock> my = [];
      bool flagVariable = false;
      for (int i = 0; i < letterBlocks.length; i++) {
        var item = letterBlocks[i];
        if (!flagVariable && letterBlocks[i].isRevealed == false) {
          item = item.copyWithIsRevelead(true);
          flagVariable = true;
        }
        my.add(item);
      }
      provider.makeTransaction(payloadDiamonds: 0, payloadCoins: -50);
      print("testing");
      updateLetterBlocks(my);
      // .isRevealed = true;
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        PowerUpButton(
          icon: Icons.text_fields,
          label: 'A letter ( - 50 coins)',
          onPressed: revealOneLetter,
        ),
        PowerUpButton(
          icon: Icons.auto_stories,
          label: 'Reveal a word',
          onPressed: revealOneLetter,
        ),
        PowerUpButton(
          icon: Icons.video_library,
          label: 'Reveal a word with Ads',
          onPressed: revealOneLetter,
        ),
      ],
    );
  }
}

class PowerUpButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Function onPressed;

  const PowerUpButton(
      {Key? key,
      required this.icon,
      required this.label,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon),
          onPressed: () {
            onPressed();
          },
          iconSize: 48,
        ),
        Text(
          label,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
