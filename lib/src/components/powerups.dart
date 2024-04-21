import 'package:flame/extensions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordstation_flutter/src/components/letter_block.dart';
import 'package:wordstation_flutter/src/components/not_enough_dialog.dart';
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
      if (provider.coins - 50 < 0) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(content: NotEnoughDialog()));
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

    revealOneWord() {
      if (provider.diamonds - 1 < 0) {
        showDialog(
            context: context,
            builder: (context) => AlertDialog(content: NotEnoughDialog()));
        return;
      }
    }

    return Row(
      // width: context.size?.width ?? 400,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            PowerUpButton(
              icon: Icon(Icons.text_fields, color: Colors.teal),
              label: '(-50 coins)',
              onPressed: revealOneLetter,
            ),
            PowerUpButton(
              icon: Icon(Icons.auto_stories, color: Colors.deepPurple),
              label: '(-1 diamond)',
              onPressed: revealOneLetter,
            ),
            // PowerUpButton(
            //   icon: Icons.video_library,
            //   label: 'Reveal a word with Ads',
            //   onPressed: revealOneLetter,
            // ),
          ],
        )
      ],
    );
  }
}

class PowerUpButton extends StatelessWidget {
  final Icon icon;
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
        ElevatedButton(
          child: icon,
          onPressed: () {
            onPressed();
          },
        ),
        Text(
          label,
          style: TextStyle(fontSize: 12, color: Colors.white),
        ),
      ],
    );
  }
}
