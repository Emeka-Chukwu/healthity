import 'package:flutter/material.dart';
import 'package:healthify/cores/cores.dart';

class NotificationBell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          Icons.notifications,
          size: Responsive.textSize(5.5, context),
        ),
        Positioned(
          right: Responsive.screenWidth(.5, context),
          top: Responsive.constScreenHeight(.1, context),
          child: Container(
            height: Responsive.screenHeight(1, context),
            width: Responsive.screenHeight(1, context),
            decoration: BoxDecoration(shape: BoxShape.circle, color: red),
          ),
        )
      ],
    );
  }
}
