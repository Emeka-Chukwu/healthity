class StoresModel {
  String storename;
  String address;
  String email;
  String password;
  String confirm_password;

  StoresModel(
      {this.storename,
      this.email,
      this.password,
      this.confirm_password,
      this.address});

  StoresModel.fromJson(Map<String, dynamic> json) {
    storename = json["storeName"] ?? null;
    email = json["email"] ?? null;
    address = json["address"] ?? null;
    password = json["password"] ?? null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["storeName"] = this.storename;
    data["email"] = this.email;
    data["password"] = this.password;
    data["address"] = this.address;
    data["confirm_password"] = this.confirm_password;
    return data;
  }
}
