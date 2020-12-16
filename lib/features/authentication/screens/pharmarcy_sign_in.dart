import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthify/cores/cores.dart';
import 'package:healthify/features/authentication/blocs/authPage.dart';
import 'package:healthify/features/authentication/blocs/user_bloc.dart';
import 'package:healthify/features/authentication/blocs/user_bloc_initialization.dart';
import 'package:healthify/features/authentication/components/components.dart';
import 'package:healthify/features/authentication/components/store_signin.dart';
import 'package:healthify/features/authentication/components/store_signup.dart';
import 'package:healthify/features/pharmacies/screens/home_page.dart';

class PharmacySignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final pharmacyauths = storeInitialization;
    print(pharmacyauths.state);
    print("emeka");

    final pharmacy = AuthPageBloc();
    return Scaffold(
      backgroundColor: white,
      body: BlocBuilder<AuthPageBloc, AuthPageState>(
        cubit: pharmacy,
        builder: (context, state) {
          if (state is AuthPageLoaded) {
            print(state.signin);
            return Stack(
              children: [
                Container(
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                                          pharmacy
                                              .add(FetchAuthPage(signIn: 1));
                                        },
                                        child: Text(
                                          "Sign In",
                                          style: TextStyle(
                                              fontSize: Responsive.textSize(
                                                  5, context),
                                              fontWeight: state.signin == 1
                                                  ? FontWeight.w700
                                                  : FontWeight.normal),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          pharmacy
                                              .add(FetchAuthPage(signIn: 2));
                                        },
                                        child: Text(
                                          "Sign up",
                                          style: TextStyle(
                                              fontSize: Responsive.textSize(
                                                  5, context),
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
                ),
                BlocConsumer<AuthUserBloc, AuthUserState>(
                    cubit: pharmacyauths,
                    listener: (context, state) {
                      print(state);
                      if (state is AuthUserAuthenticated) {
                        changeScreen(
                          context,
                          PharmacyStore(),
                        );
                      }
                    },
                    builder: (context, state) {
                      print(state);
                      print("state.store");
                      if (state is AuthUserAuthenticating) {
                        return Container(
                          alignment: Alignment.center,
                          width: double.infinity,
                          height: Responsive.screenHeight(115, context),
                          color: Colors.grey.withOpacity(.5),
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Container();
                    }),
              ],
            );
          }
          // return Container(
          //   child: Center(
          //     child: CircularProgressIndicator(),
          //   ),
          // );
        },
      ),
    );
  }
}
