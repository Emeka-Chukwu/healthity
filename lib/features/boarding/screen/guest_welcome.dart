import 'package:flutter/material.dart';
import 'package:healthify/cores/cores.dart';
import 'package:healthify/features/authentication/screens/pharmarcy_sign_in.dart';
import 'package:healthify/features/authentication/screens/user_sign_in.dart';

class WelcomeGuest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: Responsive.screenWidth(3, context),
                  vertical: Responsive.screenHeight(2, context)),
              child: Text(
                "Sign Up/\nSign In",
                style: TextStyle(
                    fontFamily: "Lato",
                    fontSize: Responsive.textSize(6.5, context),
                    fontWeight: FontWeight.w700,
                    height: Responsive.textSize(.25, context)),
              ),
            ),
            // YMargin(
            //   Responsive.screenHeight(5, context),
            // ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Responsive.screenWidth(3, context),
                  vertical: Responsive.screenHeight(2, context)),
              child: Text(
                "Let us know how you want to join us",
                style: TextStyle(
                  fontSize: Responsive.textSize(5, context),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),

            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Responsive.screenWidth(3, context)),
                height: Responsive.textSize(40, context),
                width: Responsive.screenWidth(90, context),
                decoration: BoxDecoration(
                  color: orangeYellow,
                  borderRadius:
                      BorderRadius.circular(Responsive.screenWidth(3, context)),
                  boxShadow: [boxShadow],
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.person_outline_sharp,
                      size: Responsive.textSize(20, context),
                    ),
                    XMargin(Responsive.screenWidth(4, context)),
                    Expanded(
                      child: Text(
                        "Individual\nPerson",
                        style: TextStyle(
                          fontSize: Responsive.textSize(5, context),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: Responsive.screenWidth(6, context)),
                        child: Container(
                          width: Responsive.screenWidth(9, context),
                          height: Responsive.screenWidth(9, context),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: white),
                          child: IconButton(
                            icon: Icon(Icons.arrow_forward_ios),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UserSignIn(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            // YMargin(Responsive.constScreenHeight(2, context)),
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.symmetric(
                    horizontal: Responsive.screenWidth(3, context)),
                height: Responsive.textSize(40, context),
                width: Responsive.screenWidth(90, context),
                decoration: BoxDecoration(
                  color: cyan,
                  borderRadius:
                      BorderRadius.circular(Responsive.screenWidth(3, context)),
                  boxShadow: [boxShadow],
                ),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/pharmacy1.png",
                      width: Responsive.screenWidth(20, context),
                    ),
                    XMargin(Responsive.screenWidth(4, context)),
                    Expanded(
                      child: Text(
                        "Pharmacy\nStore",
                        style: TextStyle(
                          fontSize: Responsive.textSize(5, context),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                            bottom: Responsive.screenWidth(6, context)),
                        child: Container(
                          width: Responsive.screenWidth(9, context),
                          height: Responsive.screenWidth(9, context),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: white),
                          child: IconButton(
                            icon: Icon(Icons.arrow_forward_ios),
                            onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PharmacySignIn(),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
