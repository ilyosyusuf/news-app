import 'package:flutter/material.dart';

class UpBorder {
  static upBorder(Color color) {
    return BoxDecoration(
      color: color,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)));
  }
}

class AllBorder {
  static allBorder(Color color) {
    return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 0),
          ),
        ]);
  }
}

class BottomBorder {
  static bottomBorder(Color color) {
    return BoxDecoration(
        color: color,
        // borderRadius:
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(100),
            bottomRight: Radius.circular(100)));
  }
}

class UpBorderList {
  static bottomBorder(Color color) {
    return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5.0), topRight: Radius.circular(5.0)));
  }
}

class AllBorderWhithoutShadow {
  static allBorder(Color color) {
    return BoxDecoration(
        border: Border.all(color: color),
        borderRadius: BorderRadius.circular(5.0));
  }
}