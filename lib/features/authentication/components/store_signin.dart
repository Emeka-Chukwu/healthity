import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthify/cores/cores.dart';
import 'package:healthify/features/authentication/blocs/user_bloc.dart';
import 'package:healthify/features/authentication/blocs/user_bloc_initialization.dart';
import 'package:healthify/features/authentication/screens/reset_password.dart';
import 'package:healthify/features/authentication/screens/store_request_password.dart';
import 'package:healthify/features/pharmacies/screens/home_page.dart';

class StoreSignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final store = storeInitialization;
    final LoginStore loginStore = LoginStore();
    return BlocConsumer<AuthUserBloc, AuthUserState>(
      cubit: store,
      listener: (context, state) {
        if (state is AuthUserAuthenticated) {
          changeScreenReplacement(
            context,
            PharmacyStore(),
          );
        }
      },
      builder: (context, state) {
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
                    labelText: "Email Address",
                  ),
                  onChanged: (val) => loginStore.email = val,
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
                  onChanged: (val) => loginStore.password = val,
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
                child: GestureDetector(
                  onTap: () => changeScreen(context, StoreRequestPassword()),
                  child: Text(
                    "Forget password",
                    style: TextStyle(
                      color: red,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
              YMargin(
                Responsive.screenHeight(5, context),
              ),
              Align(
                alignment: Alignment.center,
                child: GestureDetector(
                  onTap: () => store.add(loginStore),
                  child: Container(
                    width: Responsive.screenWidth(85, context),
                    height: Responsive.screenHeight(6, context),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: cyan,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text("Sign In"),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
