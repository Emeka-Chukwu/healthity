import 'package:flutter/material.dart';
import 'package:healthify/cores/cores.dart';

class BackNavButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: Responsive.screenWidth(9, context),
      height: Responsive.screenWidth(9, context),
      decoration: BoxDecoration(shape: BoxShape.circle, color: black),
      child: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_outlined,
          color: white,
        ),
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
