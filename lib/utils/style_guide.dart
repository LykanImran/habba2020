import 'package:flutter/material.dart';
Color hexToColor(String code) {
  return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
}

Color notWhite = Color(0xFFEDF0F2);
Color primaryColor = Colors.blue;

///+============ text styles ================================``
/*
TextStyle title = TextStyle(
  // h5 -> headline
  fontWeight: FontWeight.bold,
  fontSize: 24,
  color: Colors.white,
  letterSpacing: 0.27,
);
*/
TextStyle subtitleWhite = TextStyle(
  color: Colors.white,
    fontWeight: FontWeight.bold, fontSize: 18, fontFamily: 'Quicksand');

TextStyle descriptionWhite =
TextStyle(fontSize: 16, color: Colors.white, fontFamily: 'Quicksand');

TextStyle title = TextStyle(
  // h5 -> headline
  fontWeight: FontWeight.bold,
  fontSize: 24,
  color: Colors.white,
  letterSpacing: 0.27,
);
TextStyle subtitle = TextStyle(
    fontWeight: FontWeight.bold, fontSize: 18, fontFamily: 'Quicksand');

TextStyle description =
    TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'Quicksand');

var bluePinkGradient = new LinearGradient(
    colors: [const Color(0xFFCC0099), const Color(0xFF6600FF)],
    tileMode: TileMode.clamp,
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 1.0]);

final blueGradient = const LinearGradient(colors: const <Color>[
  const Color(0xFF0075D1),
  const Color(0xFF00A2E3),
], stops: const <double>[
  0.4,
  0.6
], begin: Alignment.topRight, end: Alignment.bottomLeft);
final purpleGraient = const LinearGradient(
    colors: const <Color>[const Color(0xFF882DEB), const Color(0xFF9A4DFF)],
    stops: const <double>[0.5, 0.7],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight);
final redGradient = const LinearGradient(colors: const <Color>[
  const Color(0xFFBA110E),
  const Color(0xFFCF3110),
], stops: const <double>[
  0.6,
  0.8
], begin: Alignment.bottomRight, end: Alignment.topLeft);

var blueGreenGradient = new LinearGradient(
  colors: [const Color(0xFF0099CC), const Color(0xFF99FF66)],
  tileMode: TileMode.clamp,
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  stops: [0.0, 1.0],
);
var yellowOrangeGradient = new LinearGradient(
  colors: [const Color(0xFFFFFF00), const Color(0xFFFF6600)],
  tileMode: TileMode.clamp,
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  stops: [0.0, 1.0],
);
var pinkRedGradient = new LinearGradient(
    colors: [const Color(0xFFFF3399), const Color(0xFFFF0000)],
    tileMode: TileMode.clamp,
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 1.0]);

var blackBlueGradient = new LinearGradient(
    colors: [Colors.blueGrey.shade800, Colors.black87],
    tileMode: TileMode.clamp,
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.0, 1.0]);
var redSexyGradient = new LinearGradient(
    colors: [const Color(0xFFF6356F), const Color(0xFFFF5F50)],
    tileMode: TileMode.clamp,
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    stops: [0.0, 1.0]);
var greenSexyGradient = new LinearGradient(
    colors: [const Color(0xFF92D000), const Color(0xFFE1EB01)],
    tileMode: TileMode.clamp,
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    stops: [0.0, 1.0]);
var violetSexyGradient = new LinearGradient(
    colors: [const Color(0xFF52A7EA), const Color(0xFF712E98)],
    tileMode: TileMode.clamp,
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    stops: [0.0, 1.0]);
var blueSexyGradient = new LinearGradient(
    colors: [const Color(0xFF46A3B7), const Color(0xFF86F1DE)],
    tileMode: TileMode.clamp,
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    stops: [0.0, 1.0]);
var orangeSexyGradient = new LinearGradient(
    colors: [const Color(0xFFFF9B30), Colors.deepOrange],
    tileMode: TileMode.clamp,
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    stops: [0.0, 1.0]);
var thodaSexyGradient = new LinearGradient(
    colors: [const Color(0xFFF58573), const Color(0xFF5F79F4)],
    tileMode: TileMode.clamp,
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    stops: [0.0, 1.0]);
var skyBlueGradient = new LinearGradient(
    colors: [const Color(0xFF15EDED), const Color(0xFF029CF5)],
    tileMode: TileMode.clamp,
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    stops: [0.0, 1.0]);
var blackSexyGradient = new LinearGradient(
    colors: [const Color(0xFF90203F), const Color(0xFF537895)],
    tileMode: TileMode.clamp,
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    stops: [0.0, 1.0]);

var disabledSilverGradient = new LinearGradient(
    colors: [const Color(0xFFF6F2F2), const Color(0xFFD9D9D9)],
    tileMode: TileMode.clamp,
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    stops: [0.0, 1.0]);
var balbirGradient = new LinearGradient(
    colors: [const Color(0xFFFF5F6d), const Color(0xFFFFC371)],
    tileMode: TileMode.clamp,
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    stops: [0.0, 1.0]);

var orangeCoral = new LinearGradient(
    colors: [const Color(0xFFff9966), const Color(0xFFff5e62)],
    tileMode: TileMode.clamp,
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    stops: [0.0, 1.0]);
var whiteGradient = new LinearGradient(
    colors: [const Color(0xFFfdfbfb), const Color(0xFFebedee)],
    tileMode: TileMode.clamp,
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
    stops: [0.0, 1.0]);
