import 'package:flutter/material.dart';
import 'package:healthify/cores/cores.dart';
import 'package:healthify/features/pharmacies/components/components.dart';

class ThanksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        children: [
          YMargin(Responsive.screenHeight(3, context)),
          Align(
            alignment: Alignment.centerLeft,
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          YMargin(Responsive.screenHeight(6, context)),
          Text("THANK YOU!"),
          YMargin(Responsive.screenHeight(6, context)),
          Text(
              "Your Order has been placed! You will receive an email receipt shortly"),
          YMargin(Responsive.screenHeight(7, context)),
          Image(
            image: AssetImage("assets/images/fireworks.png"),
            height: Responsive.screenHeight(45, context),
            fit: BoxFit.cover,
          ),
          YMargin(Responsive.screenHeight(15, context)),
          ThanksButton(
            onTap: null,
          )
        ],
      )),
    );
  }
}
