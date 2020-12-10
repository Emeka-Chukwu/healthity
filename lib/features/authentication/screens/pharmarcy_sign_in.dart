import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthify/cores/cores.dart';
import 'package:healthify/features/authentication/blocs/authPage.dart';
import 'package:healthify/features/authentication/components/components.dart';
import 'package:healthify/features/authentication/components/store_signin.dart';
import 'package:healthify/features/authentication/components/store_signup.dart';

class PharmacySignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pharmacy = AuthPageBloc();
    return Scaffold(
      backgroundColor: white,
      body: BlocBuilder<AuthPageBloc, AuthPageState>(
        cubit: pharmacy,
        builder: (context, state) {
          if (state is AuthPageLoaded) {
            print(state.signin);
            return Container(
              child: SingleChildScrollView(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: Responsive.screenHeight(45, context),
                          width: Responsive.screenWidth(100, context),
                          decoration: BoxDecoration(
                            color: cyan,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(
                                Responsive.textSize(10, context),
                              ),
                              bottomRight: Radius.circular(
                                Responsive.textSize(10, context),
                              ),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(
                                "assets/images/pharmacy1.png",
                                width: Responsive.textSize(35, context),
                                height: Responsive.screenWidth(35, context),
                                fit: BoxFit.cover,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      pharmacy.add(FetchAuthPage(signIn: 1));
                                    },
                                    child: Text(
                                      "Sign In",
                                      style: TextStyle(
                                          fontSize:
                                              Responsive.textSize(5, context),
                                          fontWeight: state.signin == 1
                                              ? FontWeight.w700
                                              : FontWeight.normal),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      pharmacy.add(FetchAuthPage(signIn: 2));
                                    },
                                    child: Text(
                                      "Sign up",
                                      style: TextStyle(
                                          fontSize:
                                              Responsive.textSize(5, context),
                                          fontWeight: state.signin == 2
                                              ? FontWeight.w700
                                              : FontWeight.normal),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: Responsive.screenWidth(5, context),
                              top: Responsive.screenWidth(9, context),
                            ),
                            child: Container(
                              child: BackNavButton(),
                              alignment: Alignment.centerLeft,
                            ),
                          ),
                        )
                      ],
                    ),
                    // InputDecorationTheme(),

                    YMargin(
                      Responsive.screenHeight(3, context),
                    ),

                    state.signin == 1
                        ? StoreSignIn()
                        : StoreSignUp(function: () {
                            pharmacy.add(FetchAuthPage(signIn: 1));
                          })
                  ],
                ),
              ),
            );
          }
          return Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
