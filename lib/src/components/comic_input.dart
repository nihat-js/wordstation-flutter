import 'package:flutter/material.dart';

class ComicInput extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onChanged;

  const ComicInput({
    Key? key,
    required this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.yellow,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black, width: 2),
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: TextStyle(
          fontSize: 18,
          color: Colors.black,
          fontFamily: 'Comic Sans MS', // Choose a comic-style font
        ),
        decoration: InputDecoration(
          hintText: 'Enter your word...',
          hintStyle: TextStyle(
            fontSize: 16,
            color: Colors.grey[700],
            fontFamily: 'Comic Sans MS', // Choose a comic-style font
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
