import 'dart:io';

import 'package:android_intent/android_intent.dart';
import 'package:flutter/material.dart';
import 'package:healthify/cores/cores.dart';
import 'package:healthify/features/authentication/screens/create_new_password.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenEmails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("assets/images/resetlogo.png"),
          ),
          YMargin(Responsive.constScreenHeight(4.5, context)),
          Text(
            "Check your Email",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: Responsive.textSize(7, context),
                height: Responsive.textSize(.2, context),
                color: lightBlack),
          ),
          YMargin(Responsive.constScreenHeight(3, context)),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: Responsive.screenHeight(8, context),
            ),
            child: Text(
              "We have sent a password recovery instructions to your email.",
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: Responsive.textSize(3.6, context),
                height: Responsive.textSize(.3, context),
                color: lightGrey,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          YMargin(Responsive.constScreenHeight(7, context)),
          GestureDetector(
            onTap: () => changeScreen(context, CreateNewPassword()),
            child: Container(
                alignment: Alignment.center,
                height: Responsive.constScreenHeight(5.5, context),
                width: Responsive.screenWidth(90, context),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Responsive.screenWidth(1, context),
                  ),
                  color: darkPurple,
                ),
                child: GestureDetector(
                  onTap: () {
                    if (Platform.isAndroid) {
                      AndroidIntent intent = AndroidIntent(
                        action: 'android.intent.action.MAIN',
                        category: 'android.intent.category.APP_EMAIL',
                      );
                      intent.launch().catchError((e) {
                        print(e.toString());
                      });
                    } else if (Platform.isIOS) {
                      launch("message://").catchError((e) {
                        print(e.toString());
                      });
                    }
                  },
                  child: Text(
                    "Open Email App",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: Responsive.textSize(3.6, context),
                      height: Responsive.textSize(.3, context),
                      color: white,
                    ),
                  ),
                )),
          ),
        ],
      )),
    );
  }
}
