import 'package:flutter/material.dart';
import 'package:healthify/cores/cores.dart';

class SignUp extends StatelessWidget {
  final Function function;

  const SignUp({Key key, @required this.function}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive.screenHeight(57, context),
      child: Column(
        children: [
          Container(
            width: Responsive.screenWidth(90, context),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: Responsive.textSize(3.5, context),
                ),
                labelText: "Username",
              ),
              style: TextStyle(
                color: black,
                height: Responsive.textSize(.4, context),
              ),
            ),
          ),
          YMargin(
            Responsive.screenHeight(1, context),
          ),
          Container(
            width: Responsive.screenWidth(90, context),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: Responsive.textSize(3.5, context),
                ),
                labelText: "Email Address",
              ),
              style: TextStyle(
                color: black,
                height: Responsive.textSize(.4, context),
              ),
            ),
          ),
          YMargin(
            Responsive.screenHeight(1, context),
          ),
          Container(
            width: Responsive.screenWidth(90, context),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                labelText: "Password",
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: Responsive.textSize(3.5, context),
                ),
              ),
              obscureText: true,
              style: TextStyle(
                height: Responsive.textSize(.4, context),
              ),
            ),
          ),
          YMargin(
            Responsive.screenHeight(1, context),
          ),
          Container(
            width: Responsive.screenWidth(90, context),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                ),
                labelText: "Confirm Password",
                labelStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: Responsive.textSize(3.5, context),
                ),
              ),
              obscureText: true,
              style: TextStyle(
                height: Responsive.textSize(.4, context),
              ),
            ),
          ),
          YMargin(
            Responsive.screenHeight(3.5, context),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: Responsive.textSize(5, context)),
            child: Container(
                width: Responsive.screenHeight(90, context),
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    Text(
                      "Already have an account ?",
                      style: TextStyle(),
                    ),
                    XMargin(Responsive.screenWidth(3, context)),
                    GestureDetector(
                      onTap: function,
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          color: red,
                          height: Responsive.textSize(.4, context),
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          YMargin(
            Responsive.screenHeight(3.5, context),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: null,
              child: Container(
                width: Responsive.screenWidth(85, context),
                height: Responsive.screenHeight(6, context),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: orangeYellow,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text("Sign Up"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
