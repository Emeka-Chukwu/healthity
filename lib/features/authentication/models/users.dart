class Users {
  String name;
  String email;
  String password;

  Users({this.name, this.email, this.password});

  Users.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    email = json["email"];
    password = json["password"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["name"] = this.name;
    data["email"] = this.email;
    data["password"] = this.password;
    return data;
  }
}
