import 'package:flutter/material.dart';

class MyText extends StatelessWidget {
  final String text;
  Color color;
  final double size;
  MyText({ Key? key, required this.text, required this.color, this.size = 18 }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
      color: color,
      fontSize: size,
    )
    );
  }
}