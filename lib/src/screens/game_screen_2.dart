import 'dart:math';

import 'package:flutter/material.dart';

class Vector2 {
  double  x;
  double  y;
  Vector2(this.x,this.y);
}

class GameScreen2 extends StatefulWidget {
  const GameScreen2({super.key});

  @override
  State<GameScreen2> createState() => _GameScreen2State();
}
  int gridSize = 20;
  int maxGrid = 20;

class _GameScreen2State extends State<GameScreen2> {

  List<String> words = ["imtina","tin","iman","amin","min"];
  List<LetterBlock> letterBlocks = [];
  String direction = "v";   //"v";
  Vector2 penPosition = Vector2(5,5);

  void toggleDirection(){
    direction = direction == "h" ? "v" : "h";
  }

  bool canWordFit(String word){
    double xCopy = penPosition.x;
    double = penPosition.y;
    return word.characters.every((element) => {
      
      return letterBlocks.every((element2) => element.x != element2.x || element.y != element2.y )}
      );  
  }

  void render(){
    while(words.isNotEmpty){
      String word = words.removeAt(Random().nextInt(words.length));
      // double crossAxis = direction == "h" ? penPosition.y : penPosition.x;

      // double mainAxis = direction == "h" ? penPosition.x : penPosition.y;
      var predictedLastMainPosition =  (direction == "h" ? penPosition.x : penPosition.y) + word.length ;
    
      if (predictedLastMainPosition > maxGrid){
        words.add(word); // return back to list, because it exceeds boundary
        continue;
      }

      double xCopy =penPosition.x; 
      double yCopy =penPosition.y;
      List<Vector2> predictedPositions = List.filled(words.length,"---").map((e)  {
        direction == "h" ? xCopy++ : yCopy++;
        return Vector2(xCopy,yCopy);
      }).toList();

      var myBlocks = [];
      for(var i = 0; i < word.length; i++){
        myBlocks.add(LetterBlock(x: penPosition.x, y: penPosition.y, letter: word[i], isRevealed: false, fullWord: word));
        if (direction == "h"){
          penPosition.x++;
        }else{
          penPosition.y++;
        }
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: (gridSize * maxGrid).toDouble()+ 20,
        height: (gridSize * maxGrid).toDouble() + 20,
        child: Stack(
          children: [

          ],
        ),
      ),
    );
  }
}

class LetterBlock extends StatelessWidget {
  late double x;
  late double y;
  late bool isRevealed = false;
  late String letter;
  late String fullWord;
  LetterBlock({required double x, required double y,required String letter,required bool isRevealed,required String fullWord,  super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left:  ( x * gridSize).toDouble() ,
      top: y * gridSize.toDouble(),
      width: maxGrid.toDouble() ,
      height: maxGrid.toDouble() ,
      child: Container(
        decoration : BoxDecoration(
          border: Border.all(width: 2,color: Colors.blue)
        ),
        child: Text(letter)
      ),
      
    );
  }
}