import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:healthify/cores/cores.dart';
import 'package:healthify/features/authentication/models/store.dart';
import 'package:healthify/features/authentication/models/users.dart';
import 'package:healthify/features/authentication/screens/user_sign_in.dart';
import 'package:healthify/features/boarding/screen/guest_welcome.dart';
import 'package:healthify/features/pharmacies/components/components.dart';
import 'package:healthify/features/pharmacies/screens/home_page.dart';
import 'package:http/http.dart' as http;
import 'package:jwt_decoder/jwt_decoder.dart';

class UserRepository {
  String loggedIn = "loggedIn";
  http.Client client = http.Client();
  String url = "https://healthify-app.herokuapp.com/api/v1/user";
  String urlStore = "https://healthify-app.herokuapp.com/api/v1/store";

  register(String email, String password, String name, String cpassword) async {
    Users users = Users();
    users.username = name;
    users.email = email;
    users.password = password;
    users.confirm_password = cpassword;
    print("Started");
    print(users);
    var post = await client.post(
      "$url/signup",
      body: users.toJson(),
    );
    return jsonDecode(post.body);
  }

  loginIn(String email, String password) async {
    try {
      final users = await client.post(
        "$url/login",
        body: {"email": email, "password": password},
      );

      var data = jsonDecode(users.body);
      return data;
      // print(data);
    } catch (e) {
      print("catch");
      print(e);
    }
  }

  logoutUserStore() async {
    final storage = FlutterSecureStorage();
    // String loggedIn = "loggedIn";

    storage.delete(key: loggedIn);
    var loggedout = await storage.read(key: loggedIn);
    print(loggedout);
    if (loggedout == null) {
      return true;
    }
    return false;
  }

  registerStore(String email, String password, String name, String cpassword,
      String address) async {
    StoresModel stores = StoresModel();
    stores.storename = name;
    stores.email = email;
    stores.address = address;
    stores.password = password;
    stores.confirm_password = cpassword;

    print("Started");
    var post = await client.post(
      "$urlStore/create",
      body: stores.toJson(),
    );
    return jsonDecode(post.body);
  }

  loginStoreIn(String email, String password) async {
    try {
      final users = await client.post(
        "$urlStore/login",
        body: {"email": email, "password": password},
      );

      var data = jsonDecode(users.body);
      return data;
      // print(data);
    } catch (e) {
      print("catch");
      print(e);
    }
  }

  receiveEmailForResetPassword(String email, bool isUser) async {
    print(email);
    print(isUser);
    String url = "";
    String storeUrl =
        "https://healthify-app.herokuapp.com/api/v1/store/password/forget_password";
    String userUrl =
        "https://healthify-app.herokuapp.com/api/v1/user/password/forget_password";

    url = isUser ? userUrl : storeUrl;

    try {
      final getEmail = await client.post(url, body: {"email": email});
      return jsonDecode(getEmail.body);
    } catch (e) {
      print(e);
      print("catch");
    }
  }
}

redirectToMainPage(BuildContext context) async {
  final storage = new FlutterSecureStorage();
  String loggedIn = "loggedIn";

  print(await storage.read(key: loggedIn));
  print("all");
  print(await storage.readAll());

  var redirect = await storage.read(key: loggedIn);
  if (redirect != null) {
    bool hasExpired = JwtDecoder.isExpired(redirect);
    if (hasExpired) {
      print("Logout");
      // logout the user
    }
    changeScreenReplacement(
      context,
      PharmacyStore(),
      // WelcomeGuest(),
    );
  } else {
    changeScreen(context, WelcomeGuest());
  }
  // print(decodedToken);
}

redirectToLogin(BuildContext context) async {
  final storage = new FlutterSecureStorage();
  String loggedIn = "loggedIn";

  print(await storage.read(key: loggedIn));
  print("all");
  print(await storage.readAll());

  var redirect = await storage.read(key: loggedIn);
  if (redirect != null) {
    bool hasExpired = JwtDecoder.isExpired(redirect);
    if (hasExpired) {
      print("Logout");
      changeScreenReplacement(context, UserSignIn());
      // logout the user
    }
  } else {
    changeScreenReplacement(context, UserSignIn());
  }
  // print(decodedToken);
}
