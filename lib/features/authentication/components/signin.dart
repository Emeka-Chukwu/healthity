import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthify/cores/cores.dart';
import 'package:healthify/features/authentication/blocs/user_bloc.dart';
import 'package:healthify/features/authentication/blocs/user_bloc_initialization.dart';
import 'package:healthify/features/authentication/repositories/repository.dart';
import 'package:healthify/features/authentication/screens/reset_password.dart';
import 'package:healthify/features/pharmacies/screens/home_page.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(getExpiration());
    print(getTimeDuration());
    print(DateTime.now());

    final user = userInitialization;
    final LoginUser loginUser = LoginUser();
    return BlocConsumer<AuthUserBloc, AuthUserState>(
      cubit: user,
      listener: (context, state) {
        print(state);
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
                  onChanged: (val) => loginUser.email = val,
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
                  onChanged: (val) => loginUser.password = val,
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
                child: GestureDetector(
                  onTap: () => changeScreen(context, ResetPassword()),
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
                  onTap: () => user.add(loginUser),
                  child: Container(
                    width: Responsive.screenWidth(85, context),
                    height: Responsive.screenHeight(6, context),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: orangeYellow,
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

bool getExpiration() {
  bool hasExpired = JwtDecoder.isExpired(
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InZlcmlmaWVkIjp0cnVlLCJyb2xlIjoiYWRtaW4iLCJfaWQiOiI1ZmNlMzRkNzUyMTY4ODY1MmNiNGJlMGMiLCJ1c2VybmFtZSI6ImVtZWthIiwiZW1haWwiOiJlbWVrYXBhc2NhbDExQGdtYWlsLmNvbSIsInBhc3N3b3JkIjoiJDJiJDEwJEZ6OTlyblFja0RPZmFIZ1lJMjRCLi54S3Q2UU1NRFpwa21ua094TGhoQURYeFhCQUswTmcyIiwiZmlyc3ROYW1lIjoiZW1la2EiLCJsYXN0TmFtZSI6InBhc2NhbCIsInBob25lTnVtYmVyIjoyMzQ4MTY1OTU1MzUzLCJhZGRyZXNzIjoiYWdiYXJhIG9ndW4gc3RhdGUiLCJjcmVhdGVkQXQiOiIyMDIwLTEyLTA3VDEzOjU3OjM5LjE0OVoiLCJ1cGRhdGVkQXQiOiIyMDIwLTEyLTA3VDEzOjU3OjM5LjE0OVoiLCJfX3YiOjB9LCJpYXQiOjE2MDczNTU5ODAsImV4cCI6MTYwNzQ0MjM4MH0.l3X7xv55xFgeRlAcTmTWv6dn6uJ4ZQMln1dL-yt9hPM",
  );
  return hasExpired;
}

DateTime getTimeDuration() {
  DateTime hasExpired = JwtDecoder.getExpirationDate(
    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InZlcmlmaWVkIjp0cnVlLCJyb2xlIjoiYWRtaW4iLCJfaWQiOiI1ZmNlMzRkNzUyMTY4ODY1MmNiNGJlMGMiLCJ1c2VybmFtZSI6ImVtZWthIiwiZW1haWwiOiJlbWVrYXBhc2NhbDExQGdtYWlsLmNvbSIsInBhc3N3b3JkIjoiJDJiJDEwJEZ6OTlyblFja0RPZmFIZ1lJMjRCLi54S3Q2UU1NRFpwa21ua094TGhoQURYeFhCQUswTmcyIiwiZmlyc3ROYW1lIjoiZW1la2EiLCJsYXN0TmFtZSI6InBhc2NhbCIsInBob25lTnVtYmVyIjoyMzQ4MTY1OTU1MzUzLCJhZGRyZXNzIjoiYWdiYXJhIG9ndW4gc3RhdGUiLCJjcmVhdGVkQXQiOiIyMDIwLTEyLTA3VDEzOjU3OjM5LjE0OVoiLCJ1cGRhdGVkQXQiOiIyMDIwLTEyLTA3VDEzOjU3OjM5LjE0OVoiLCJfX3YiOjB9LCJpYXQiOjE2MDczNTU5ODAsImV4cCI6MTYwNzQ0MjM4MH0.l3X7xv55xFgeRlAcTmTWv6dn6uJ4ZQMln1dL-yt9hPM",
  );
  return hasExpired;
}
