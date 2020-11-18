import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:healthify/cores/cores.dart';
import 'package:healthify/features/boarding/screen/guest_welcome.dart';

class GetStarted extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: SafeArea(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Responsive.screenWidth(4, context)),
              child: Wrap(
                direction: Axis.horizontal,
                children: [
                  Text(
                    "Beyond Local Prescription",
                    style: TextStyle(
                        color: purple,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Lato',
                        fontSize: Responsive.textSize(6.7, context),
                        height: Responsive.textSize(0.35, context)),
                  ),
                ],
              ),
            ),
            YMargin(Responsive.constScreenHeight(13, context)),
            Image.asset(
              'assets/images/started.png',
              width: double.infinity,
              height: Responsive.constScreenHeight(70, context),
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => WelcomeGuest())),
                child: Container(
                  width: Responsive.screenWidth(90, context),
                  height: Responsive.screenWidth(12, context),
                  // padding: EdgeInsets.only(,
                  //     bottom: Responsive.screenHeight(1, context)),
                  decoration: BoxDecoration(
                    color: cyan,
                    borderRadius: BorderRadius.circular(
                      Responsive.screenWidth(5, context),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Lato',
                          fontSize: Responsive.screenWidth(3, context),
                          height: Responsive.textSize(.3, context)),
                    ),
                  ),
                ),
              ),
            ),
            YMargin(Responsive.constScreenHeight(1.5, context)),
          ],
        )),
      ),
    );
  }
}
