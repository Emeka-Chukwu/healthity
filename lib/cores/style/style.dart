import 'package:flutter/material.dart';

TextStyle header({double size, Color black = Colors.black}) => TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: size,
      height: size * 1.8,
      color: black,
    );

TextStyle normalText({double size, Color black = Colors.black}) => TextStyle(
      fontSize: size,
      height: size * 1.8,
      color: black,
    );
