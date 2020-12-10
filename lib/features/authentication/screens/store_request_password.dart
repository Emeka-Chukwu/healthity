import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthify/cores/cores.dart';
import 'package:healthify/features/authentication/blocs/user_bloc.dart';
import 'package:healthify/features/authentication/blocs/user_bloc_initialization.dart';
import 'package:healthify/features/authentication/screens/open_email.dart';

class StoreRequestPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final email = userInitialization;
    final PasswordReset reset = PasswordReset(isUser: false);
    return BlocConsumer<AuthUserBloc, AuthUserState>(
      cubit: email,
      listener: (context, state) {
        if (state is AuthUserEmail) {
          changeScreen(context, OpenEmails());
        }
      },
      builder: (context, state) {
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
                    "StoreReset Password",
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
                      "Enter the email associated with your account and we will send an email with instruction to reset password",
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
                    "Email Address",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: Responsive.textSize(3.6, context),
                      color: lightGrey,
                      height: Responsive.textSize(.3, context),
                    ),
                  ),
                  YMargin(Responsive.constScreenHeight(3, context)),
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
                        labelText: "example@email.com",
                      ),
                      onChanged: (email) => reset.email = email,
                    ),
                  ),
                  YMargin(Responsive.constScreenHeight(3, context)),
                  GestureDetector(
                    onTap: () => email.add(reset),
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
                          "Send Instructions",
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
      },
    );
  }
}
