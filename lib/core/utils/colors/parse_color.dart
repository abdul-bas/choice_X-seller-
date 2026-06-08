
  import 'dart:ui';

import 'package:flutter/material.dart';

Color parseColor(String name) {
    const map = {
      'red': Colors.red,
      'blue': Colors.blue,
      'green': Colors.green,
      'yellow': Colors.yellow,
      'black': Colors.black,
      'purple': Colors.purple,
      'orange': Colors.orange,
      'pink': Colors.pink,
      'brown': Colors.brown,
      'grey': Colors.grey,
      'gray': Colors.grey,
      'cyan': Colors.cyan,
      'teal': Colors.teal,
      'indigo': Colors.indigo,
      'white': Colors.white,
    };
    return map[name.toLowerCase()] ?? Colors.grey;
  }