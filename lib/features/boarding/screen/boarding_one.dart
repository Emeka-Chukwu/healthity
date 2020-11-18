import 'package:flutter/material.dart';
import 'package:healthify/cores/cores.dart';
import 'package:healthify/features/boarding/screen/get_started.dart';

class BoardingOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => GetStarted()));
    });

    print(Responsive.screenWidth(100, context) / 2);
    // print(Responsive.screenHeight(100, context) / 2);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: purple,
          ),
          Image.asset(
            "assets/images/capsules.png",
            width: Responsive.screenWidth(100, context),
            height: Responsive.screenHeight(130, context),
            fit: BoxFit.cover,
          ),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(top: Responsive.textSize(45, context)),
              child: Text(
                "HEALTHIFY",
                style: TextStyle(
                    color: white,
                    fontWeight: FontWeight.w900,
                    fontSize: Responsive.textSize(7.8, context)),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: Responsive.textSize(30, context),
              height: Responsive.textSize(30, context),
              decoration: BoxDecoration(color: white, shape: BoxShape.circle),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: Responsive.textSize(17, context),
              height: Responsive.textSize(4.5, context),
              decoration: BoxDecoration(
                color: orange,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              width: Responsive.textSize(4.5, context),
              height: Responsive.textSize(17, context),
              decoration: BoxDecoration(
                color: orange,
              ),
            ),
          )
        ],
      ),
    );
  }
}
