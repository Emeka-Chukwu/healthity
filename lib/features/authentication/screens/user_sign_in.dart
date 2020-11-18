import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthify/cores/cores.dart';
import 'package:healthify/features/authentication/blocs/authPage.dart';
import 'package:healthify/features/authentication/components/components.dart';

class UserSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = AuthPageBloc();
    return Scaffold(
        backgroundColor: white,
        body: BlocBuilder<AuthPageBloc, AuthPageState>(
          cubit: user,
          builder: (context, state) {
            if (state is AuthPageLoaded) {
              print(state.signin);
              return Container(
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: Responsive.screenHeight(45, context),
                          width: Responsive.screenWidth(100, context),
                          decoration: BoxDecoration(
                            color: orangeYellow,
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
                              Icon(Icons.person_outline_outlined,
                                  size: Responsive.textSize(45, context)),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      user.add(FetchAuthPage(signIn: 1));
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
                                      user.add(FetchAuthPage(signIn: 2));
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
                      Responsive.screenHeight(5, context),
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
                      Responsive.screenHeight(2, context),
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
                      Responsive.screenHeight(5, context),
                    ),
                    Expanded(
                      child: Text(
                        state.signin == 1 ? "Forget password" : "",
                        style: TextStyle(
                          color: red,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
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
                          child:
                              Text(state.signin == 1 ? "Sign In" : "Sign Up"),
                        ),
                      ),
                    ),
                    YMargin(Responsive.screenHeight(3, context))
                  ],
                ),
              );
            }
            return Container(
              child: Center(child: CircularProgressIndicator()),
            );
          },
        ));
  }
}
