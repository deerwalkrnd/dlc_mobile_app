import 'package:flutter/material.dart';

//colors
Color oneBlue = const Color.fromRGBO(15, 82, 136, 1);
Color twoBlue = const Color.fromRGBO(53, 115, 163, 1);
Color threeBlue = const Color.fromRGBO(90, 148, 189, 1);
Color fourBlue = const Color.fromRGBO(128, 181, 216, 1);
Color fiveBlue = const Color.fromRGBO(165, 214, 242, 1);

//font

class AppTextStyles {
  static const TextStyle headline900 = TextStyle(
      fontSize: 48,
      fontWeight: FontWeight.bold, // or FontWeight.w600 for Semibold
      height: 56 / 48,
      color: Colors.white);

  static const TextStyle headline800 = TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.w600,
      height: 36 / 32,
      color: Colors.white);

  static const TextStyle headline700 = TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      height: 24 / 20,
      color: Colors.white);

  static const TextStyle headline600 = TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      height: 20 / 24,
      color: Colors.white);

  static const TextStyle headline500 = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      height: 16 / 18,
      color: Colors.white);

  static const TextStyle headline400 = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      height: 14 / 16,
      color: Colors.white);

  static const TextStyle headline300 = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w500,
      height: 12 / 16,
      color: Colors.white);

  static const TextStyle headline200 = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.w600,
      height: 12 / 16,
      color: Colors.white);

  static const TextStyle headline100 = TextStyle(
      fontSize: 10,
      fontWeight: FontWeight.w500,
      height: 10 / 16,
      color: Colors.white);

  // Body Text Styles
  static const TextStyle bodyText300 = TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.normal,
      // height: 16 ,
      color: Colors.white);

  static const TextStyle bodyText200 = TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      height: 14 / 24,
      color: Colors.white);

  static const TextStyle bodyText100 = TextStyle(
      fontSize: 12,
      fontWeight: FontWeight.normal,
      height: 12 / 24,
      color: Colors.white);
}

navigateTo(BuildContext context, Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
