import 'dart:convert';

import 'package:healthify/features/authentication/models/users.dart';
import 'package:http/http.dart' as http;

class UserRepository {
  http.Client client = http.Client();
  String url = "http://www.example.com";

  void register(String email, String password, String name) async {
    Users users = Users();
    users.name = name;
    users.email = email;
    users.password = password;
    await client.post(
      url,
      body: users.toJson(),
    );
  }

  Future<Users> loginIn(String email, String password) async {
    final users = await client.post(
      url,
      body: {"email": email, "password": password},
    );
    var data = jsonDecode(users.body);
    return Users.fromJson(data);
  }
}
