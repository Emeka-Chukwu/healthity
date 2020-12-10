import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthify/cores/cores.dart';
import 'package:healthify/features/authentication/blocs/user_bloc.dart';
import 'package:healthify/features/authentication/blocs/user_bloc_initialization.dart';

class StoreSignUp extends StatelessWidget {
  final Function function;

  const StoreSignUp({Key key, @required this.function}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final store = storeInitialization;

    final RegisterStore storeEvent = RegisterStore();

    return BlocConsumer<AuthUserBloc, AuthUserState>(
      cubit: store,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is AuthStoreRegister) {
          function();
        }
        return Container(
          height: Responsive.screenHeight(70, context),
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
                    labelText: "Storename",
                  ),
                  onChanged: (val) => storeEvent.storename = val,
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
                  onChanged: (val) => storeEvent.email = val,
                ),
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
                    labelText: "Address",
                  ),
                  style: TextStyle(
                    color: black,
                    height: Responsive.textSize(.4, context),
                  ),
                  onChanged: (val) => storeEvent.address = val,
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
                  onChanged: (val) => storeEvent.password = val,
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
                  onChanged: (val) => storeEvent.confirm_password = val,
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
                            "Sign In",
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
                  onTap: () async {
                    try {
                      store.add(storeEvent);
                    } catch (e) {
                      print(e);
                    }
                  },
                  child: Container(
                    width: Responsive.screenWidth(85, context),
                    height: Responsive.screenHeight(6, context),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: cyan,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text("Sign Up"),
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
