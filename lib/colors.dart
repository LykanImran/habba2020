import 'package:flutter/material.dart';
import 'dart:math';

//colors
List<Color> kitGradients = [
  // new Color.fromRGBO(103, 218, 255, 1.0),
  // new Color.fromRGBO(3, 169, 244, 1.0),
  // new Color.fromRGBO(0, 122, 193, 1.0),
  Colors.blueGrey.shade800,
  Colors.black87,
];
List<Color> kitGradients2 = [
  Colors.cyan.shade600,
  Colors.blue.shade900
];

//randomcolor
final Random _random = new Random();

/// Returns a random color.
Color next() {
return new Color(0xFF000000 + _random.nextInt(0x00FFFFFF));
}
