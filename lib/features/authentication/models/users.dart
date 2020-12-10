class Users {
  String username;
  String email;
  String password;
  String confirm_password;

  Users({this.username, this.email, this.password, this.confirm_password});

  Users.fromJson(Map<String, dynamic> json) {
    username = json["username"] ?? null;
    email = json["email"] ?? null;
    password = json["password"] ?? null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["username"] = this.username;
    data["email"] = this.email;
    data["password"] = this.password;
    data["confirm_password"] = this.confirm_password;
    return data;
  }
}
