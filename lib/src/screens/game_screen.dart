import 'dart:math';

import 'package:flame/extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordstation_flutter/src/components/circular_joystick.dart';
import 'package:wordstation_flutter/src/components/comic_input.dart';
import 'package:wordstation_flutter/src/components/level_finished_dialog.dart';
import 'package:wordstation_flutter/src/components/powerups.dart';
import 'package:wordstation_flutter/src/components/status_bar.dart';
import 'package:wordstation_flutter/src/components/letter_block.dart';
import 'package:wordstation_flutter/src/components/pause_menu.dart';
import 'package:wordstation_flutter/src/config.dart';
import 'package:wordstation_flutter/src/providers/user.dart';

class Vector2 {
  double x;
  double y;
  Vector2(this.x, this.y);
}

class Direction {
  bool isHorizontal;
  get isVertical => !isHorizontal;
  Direction({required this.isHorizontal});

  void toggleAxis() {
    isHorizontal = !isHorizontal;
  }
}

class GameScreen extends StatefulWidget {
  int level;
  GameScreen({super.key, required this.level});

  @override
  State<GameScreen> createState() => _GameScreen2State();
}

int gridSize = 30;
int maxGrid = 20;
Direction d = Direction(isHorizontal: true);

class _GameScreen2State extends State<GameScreen> {
  late Level level;
  late List<String> words = [];
  late List<String> words2 = [];
  List<LetterBlock> letterBlocks = [];
  TextEditingController controller = TextEditingController();
  // List<String> words =
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    level = levels.firstWhere((item) => item.level == widget.level);
    for (int i = 0; i < level.words.length; i++) {
      words.add(level.words[i]);
      words2.add(level.words[i]);
    }
    buildCrossword();
  }

  void buildCrossword() {
    print("Building crossword");
    print(words);
    String firstCrosswordWord = "";
    words.forEach((element) {
      if (element.length > firstCrosswordWord.length) {
        firstCrosswordWord = element;
      }
    });
    double x = 5; //temporary variable
    firstCrosswordWord.split("").forEach((letter) {
      letterBlocks.add(LetterBlock(
        x: x,
        y: 5,
        letter: letter,
        isRevealed: false,
        fullWord: firstCrosswordWord,
        isHorizontal: true,
      ));
      x++;
    });
    words.remove(firstCrosswordWord);
    int step = 0; // debugging infinite loop
    while (words.isNotEmpty) {
      if (step++ == 100) {
        break;
      }
      d.toggleAxis();

      var intersectionLetterBlock = letterBlocks
          .where((element) =>
              element.isUsedAsIntersection == false &&
              element.isHorizontal != d.isHorizontal)
          .toList()
          .random(); // filter de var
      var nextWord = words.random();
      while (true) {
        if (nextWord.contains(intersectionLetterBlock.letter)) {
          break;
        } else {
          intersectionLetterBlock = letterBlocks.random(); // filter de var
          nextWord = words.random();
        }
      }

      // now finding offset and checking validity
      // one grid cannot contain more than one letter
      // one letter can only be used 1 time as an part of intersection
      int offset = nextWord.indexOf(intersectionLetterBlock.letter);
      double startX = d.isHorizontal
          ? intersectionLetterBlock.x - offset
          : intersectionLetterBlock.x;
      double startY = d.isVertical
          ? intersectionLetterBlock.y - offset
          : intersectionLetterBlock.y;
      double copyStartX = startX;
      double copyStartY = startY;
      // print(
      //     "next word is $nextWord intersection letter is ${intersectionLetterBlock.letter} offset is $offset");
      // print("isHorizontal ${d.isHorizontal}");
      // print("startX is $startX startY is $startY");
      bool canPlaceWord = nextWord.split("").every((letter) {
        //   letterBlocks.add(LetterBlock(x: startX, y: startY, letter: letter, isRevealed: false, fullWord: nextWord, isHorizontal: d.isHorizontal));
        // print(
        //     "letter is $letter, position x is $copyStartX  and position y is $copyStartY");
        // the grid should be whether  empty or equal to intersection block
        bool st = letterBlocks.every((element) {
          bool st1 = element.x != copyStartX || element.y != copyStartY;
          bool st2 = element.x == intersectionLetterBlock.x &&
              element.y == intersectionLetterBlock.y;

          bool st3 = true;
          if (d.isHorizontal &&
              copyStartX == element.x &&
              copyStartX != intersectionLetterBlock.x) {
            // print("114e gird");
            st3 = copyStartY + 1 != element.y && copyStartY - 1 != element.y;
          }

          if (d.isVertical &&
              copyStartY == element.y &&
              copyStartY != intersectionLetterBlock.y) {
            st3 = copyStartX + 1 != element.x && copyStartX - 1 != element.x;
            if (st3 == false) {
              // print(
              //     "copyStartX = $copyStartX, copyStartY = $copyStartY Element.x = ${element.x} element.y = ${element.y}");
            }
          }
          // print("st1 is $st1 st2 is $st2 st3 is $st3");
          return (st1 || st2) && st3;
        });
        // print("end of one letterBlock and st is $st");
        d.isHorizontal ? copyStartX++ : copyStartY++;
        return st;
      });

      if (!canPlaceWord) {
        d.toggleAxis(); // return back and get another word
        continue;
      }
      // print("yes you can place word");
      intersectionLetterBlock.isUsedAsIntersection = true;
      nextWord.split("").forEach((letter) {
        letterBlocks.add(LetterBlock(
            x: startX,
            y: startY,
            letter: letter,
            isRevealed: false,
            fullWord: nextWord,
            isHorizontal: d.isHorizontal));
        d.isHorizontal ? startX++ : startY++;
      });
      words.remove(nextWord);
    }
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    UserProvider user = Provider.of<UserProvider>(context);

    void isGameFinished() async {
      bool foo = letterBlocks.every((element) => element.isRevealed == true);
      print("checking whether game is finished $foo");

      if (!foo) {
        return;
      }
      await user.levelUp();
      print("yes finished");
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
              content: LevelFinishedDialog(nextLevel: widget.level + 1)));
    }

    void validate(String word) {
      controller.text = "";
      if (!words2.contains(word)) {
        print("not a valid word $word");
        return;
      }
      var foo = letterBlocks.where(
          (element) => element.fullWord == word && element.isRevealed == true);
      bool isRevealed = word.length == foo.length;

      if (isRevealed) {
        print("you have revealed it ");
        return;
      }

      List<LetterBlock> my = [];
      for (int i = 0; i < letterBlocks.length; i++) {
        var item = letterBlocks[i];
        if (item.fullWord == word && item.isRevealed == false) {
          item = item.copyWithIsRevelead(true);
        }
        my.add(item);
      }
      setState(() {
        letterBlocks = my;
        isGameFinished();
      });
    }

    void updateLetterBlocks(List<LetterBlock> newLetterBlocks) {
      setState(() {
        // letter/ = newWords;
        letterBlocks = newLetterBlocks;
      });
    }

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          // border: Border.all(width: 3, color: Colors.blue),
          image: DecorationImage(
              image: AssetImage(level.backgroundImage), fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            StatusBar(),
            Padding(
              padding: EdgeInsets.all(30),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, "/entry");
                      },
                      child: Image(
                        image: AssetImage(
                            "images/png/Buttons/Square-Medium/Home/Default.png"),
                        width: 50,
                        height: 50,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  content: PauseMenu(),
                                ));
                      },
                      child: Image(
                          image: AssetImage(
                              "images/png/Buttons/Square-Medium/Pause/Default.png"),
                          width: 50,
                          height: 50),
                    ),
                  ]),
            ),
            SizedBox(
              width: (gridSize * maxGrid).toDouble() + 20,
              height: 300,
              child: Stack(
                children: [
                  // Positioned(left: 100, top: 100, child: Text("GelG")),
                  ...letterBlocks,
                ],
              ),
            ),
            // CircularJoystick()
            PowerUps(
              updateLetterBlocks: updateLetterBlocks,
              letterBlocks: letterBlocks,
            ),

            // showing letters
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: level.letters.map((letter) {
                return Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: Text(
                      letter,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        fontFamily:
                            'Comic Sans MS', // Choose a comic-style font
                        color: Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            ComicInput(
                controller: controller,
                onSubmitted: validate,
                onChanged: (text) {})
          ],
        ),
      ),
    );
  }
}
