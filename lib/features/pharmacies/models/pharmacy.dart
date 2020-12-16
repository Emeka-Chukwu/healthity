class Pharmacy {
  bool success;
  String message;
  int count;
  List<Data> data;

  Pharmacy({this.success, this.message, this.count, this.data});

  Pharmacy.fromJson(Map<String, dynamic> json) {
    success = json['success'] ?? null;
    message = json['message'] ?? null;
    count = json['count'] ?? null;
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    data['count'] = this.count;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  bool isValid;
  bool verified;
  String Id;
  String storeName;
  String address;
  String email;
  String password;
  List<Inventory> inventory;
  String createdAt;
  String updatedAt;
  int iV;
  int phoneNumber;

  Data(
      {this.isValid,
      this.verified,
      this.Id,
      this.storeName,
      this.address,
      this.email,
      this.password,
      this.inventory,
      this.createdAt,
      this.updatedAt,
      this.iV,
      this.phoneNumber});

  Data.fromJson(Map<String, dynamic> json) {
    isValid = json['isValid'] ?? null;
    verified = json['verified'] ?? null;
    Id = json['_id'] ?? null;
    storeName = json['storeName'] ?? null;
    address = json['address'] ?? null;
    email = json['email'] ?? null;
    password = json['password'] ?? null;
    if (json['inventory'] != null) {
      inventory = new List<Inventory>();
      json['inventory'].forEach((v) {
        inventory.add(new Inventory.fromJson(v));
      });
    }
    createdAt = json['createdAt'] ?? null;
    updatedAt = json['updatedAt'] ?? null;
    iV = json['__v'] ?? null;
    phoneNumber = json['phoneNumber'] ?? null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['isValid'] = this.isValid;
    data['verified'] = this.verified;
    data['_id'] = this.Id;
    data['storeName'] = this.storeName;
    data['address'] = this.address;
    data['email'] = this.email;
    data['password'] = this.password;
    if (this.inventory != null) {
      data['inventory'] = this.inventory.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    data['phoneNumber'] = this.phoneNumber;
    return data;
  }
}

class Inventory {
  String sId;
  String itemName;
  int quantity;
  String pricePerUnit;
  String image;
  String form;
  String activeIngredients;
  String dosage;
  String createdAt;
  String updatedAt;

  Inventory(
      {this.sId,
      this.itemName,
      this.quantity,
      this.pricePerUnit,
      this.image,
      this.form,
      this.activeIngredients,
      this.dosage,
      this.createdAt,
      this.updatedAt});

  Inventory.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] ?? null;
    itemName = json['itemName'] ?? null;
    quantity = json['quantity'] ?? null;
    pricePerUnit = json['pricePerUnit'] ?? null;
    image = json['image'] ?? null;
    form = json['form'] ?? null;
    activeIngredients = json['activeIngredients'] ?? null;
    dosage = json['dosage'] ?? null;
    createdAt = json['createdAt'] ?? null;
    updatedAt = json['updatedAt'] ?? null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['itemName'] = this.itemName;
    data['quantity'] = this.quantity;
    data['pricePerUnit'] = this.pricePerUnit;
    data['image'] = this.image;
    data['form'] = this.form;
    data['activeIngredients'] = this.activeIngredients;
    data['dosage'] = this.dosage;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
