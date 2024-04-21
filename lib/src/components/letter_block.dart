import 'package:flutter/material.dart';
import 'package:wordstation_flutter/src/screens/game_screen.dart';

class LetterBlock extends StatefulWidget {
  final double x;
  final double y;
  final bool isRevealed;
  final String letter;
  final String fullWord;
  final bool isHorizontal;
  bool isUsedAsIntersection;
  LetterBlock(
      {required this.x,
      required this.y,
      required this.letter,
      required this.isRevealed,
      required this.fullWord,
      required this.isHorizontal,
      this.isUsedAsIntersection = false,
      super.key});

  LetterBlock copyWithIsRevelead(
    bool newIsRevealed,
  ) =>
      LetterBlock(
        isRevealed: newIsRevealed,
        x: x,
        y: y,
        letter: letter,
        fullWord: fullWord,
        isHorizontal: isHorizontal,
        isUsedAsIntersection: isUsedAsIntersection,
      );

  @override
  State<LetterBlock> createState() => _LetterBlockState();
}

class _LetterBlockState extends State<LetterBlock> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: (widget.x * gridSize).toDouble(),
      top: widget.y * gridSize.toDouble(),
      width: gridSize.toDouble(),
      height: gridSize.toDouble(),
      child: Container(
        // decoration:
        // BoxDecoration(border: Border.all(width: 1, color: Colors.amber)),
        alignment: Alignment.center,
        color: Colors.white,
        child: Text(
          widget.isRevealed ? widget.letter : "",
          style: TextStyle(color: Colors.amber),
        ),
      ),
    );
  }
}
