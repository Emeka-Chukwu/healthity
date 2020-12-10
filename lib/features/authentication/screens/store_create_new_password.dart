import 'package:flutter/material.dart';
import 'package:healthify/cores/cores.dart';

class StoreCreateNewPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.only(
              top: Responsive.screenHeight(5, context),
              left: Responsive.screenHeight(3, context)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                // child: Text("back"),
                child: Icon(Icons.arrow_back),
                onTap: () => Navigator.pop(context),
              ),
              YMargin(Responsive.constScreenHeight(5, context)),
              Text(
                "Create New Password",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: Responsive.textSize(7, context),
                    height: Responsive.textSize(.2, context),
                    color: lightBlack),
              ),
              YMargin(Responsive.constScreenHeight(3, context)),
              Padding(
                padding: EdgeInsets.only(
                  right: Responsive.screenHeight(20, context),
                ),
                child: Text(
                  "Enter a new password to finally recover your password",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: Responsive.textSize(3.6, context),
                    height: Responsive.textSize(.3, context),
                    color: lightGrey,
                  ),
                ),
              ),
              YMargin(Responsive.constScreenHeight(7, context)),
              Text(
                "Password",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: Responsive.textSize(3.6, context),
                  color: lightGrey,
                  height: Responsive.textSize(.3, context),
                ),
              ),
              YMargin(Responsive.constScreenHeight(1, context)),
              Container(
                height: Responsive.constScreenHeight(5.5, context),
                width: Responsive.screenWidth(90, context),
                decoration: BoxDecoration(),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        Responsive.screenWidth(1, context),
                      ),
                    ),
                    hintText: "********",
                  ),
                  style: TextStyle(height: Responsive.textSize(0.5, context)),
                  obscureText: true,
                ),
              ),
              YMargin(Responsive.constScreenHeight(1, context)),
              Text(
                "Confirm Password",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: Responsive.textSize(3.6, context),
                  color: lightGrey,
                  height: Responsive.textSize(.3, context),
                ),
              ),
              YMargin(Responsive.constScreenHeight(1, context)),
              Container(
                height: Responsive.constScreenHeight(5.5, context),
                width: Responsive.screenWidth(90, context),
                decoration: BoxDecoration(),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        Responsive.screenWidth(1, context),
                      ),
                    ),
                    labelText: "********",
                  ),
                  style: TextStyle(height: Responsive.textSize(0.5, context)),
                  obscureText: true,
                ),
              ),
              YMargin(Responsive.constScreenHeight(1, context)),
              Text(
                "Both passwords must match",
                style: TextStyle(
                    color: lightGrey,
                    fontSize: Responsive.textSize(2.8, context)),
              ),
              YMargin(Responsive.constScreenHeight(3.5, context)),
              GestureDetector(
                onTap: null,
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
                    child: Text(
                      "Reset Password",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: Responsive.textSize(3.6, context),
                        height: Responsive.textSize(.3, context),
                        color: white,
                      ),
                    )),
              ),
            ],
          )),
    );
  }
}
