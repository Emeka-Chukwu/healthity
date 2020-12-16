class SearchModel {
  bool verified;
  String storeName;
  String address;
  String email;
  PhoneNumber phoneNumber;
  List<InventorySearch> inventory;
  PhoneNumber score;
  List<Highlight> highlight;

  SearchModel(
      {this.verified,
      this.storeName,
      this.address,
      this.email,
      this.phoneNumber,
      this.inventory,
      this.score,
      this.highlight});

  SearchModel.fromJson(Map<String, dynamic> json) {
    verified = json['verified'];
    storeName = json['storeName'];
    address = json['address'];
    email = json['email'];
    phoneNumber = json['phoneNumber'] != null
        ? new PhoneNumber.fromJson(json['phoneNumber'])
        : null;
    if (json['inventory'] != null) {
      inventory = new List<InventorySearch>();
      json['inventory'].forEach((v) {
        inventory.add(new InventorySearch.fromJson(v));
      });
    }
    score =
        json['score'] != null ? new PhoneNumber.fromJson(json['score']) : null;
    if (json['highlight'] != null) {
      highlight = new List<Highlight>();
      json['highlight'].forEach((v) {
        highlight.add(new Highlight.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['verified'] = this.verified;
    data['storeName'] = this.storeName;
    data['address'] = this.address;
    data['email'] = this.email;
    if (this.phoneNumber != null) {
      data['phoneNumber'] = this.phoneNumber.toJson();
    }
    if (this.inventory != null) {
      data['inventory'] = this.inventory.map((v) => v.toJson()).toList();
    }
    if (this.score != null) {
      data['score'] = this.score.toJson();
    }
    if (this.highlight != null) {
      data['highlight'] = this.highlight.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PhoneNumber {
  String numberDouble;

  PhoneNumber({this.numberDouble});

  PhoneNumber.fromJson(Map<String, dynamic> json) {
    numberDouble = json['$numberDouble'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$numberDouble'] = this.numberDouble;
    return data;
  }
}

class InventorySearch {
  String itemName;
  Quantity quantity;
  String pricePerUnit;
  String image;
  String form;
  String activeIngredients;
  String dosage;
  String name;
  bool verified;
  String address;

  InventorySearch({
    this.itemName,
    this.quantity,
    this.pricePerUnit,
    this.image,
    this.form,
    this.activeIngredients,
    this.dosage,
    this.name,
    this.verified,
    this.address,
  });

  InventorySearch.fromJson(Map<String, dynamic> json) {
    itemName = json['itemName'];
    quantity = json['quantity'] != null
        ? new Quantity.fromJson(json['quantity'])
        : null;
    pricePerUnit = json['pricePerUnit'];
    image = json['image'];
    form = json['form'];
    activeIngredients = json['activeIngredients'];
    dosage = json['dosage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemName'] = this.itemName;
    if (this.quantity != null) {
      data['quantity'] = this.quantity.toJson();
    }
    data['pricePerUnit'] = this.pricePerUnit;
    data['image'] = this.image;
    data['form'] = this.form;
    data['activeIngredients'] = this.activeIngredients;
    data['dosage'] = this.dosage;
    return data;
  }
}

class Quantity {
  String numberInt;

  Quantity({this.numberInt});

  Quantity.fromJson(Map<String, dynamic> json) {
    numberInt = json['$numberInt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['$numberInt'] = this.numberInt;
    return data;
  }
}

class Highlight {
  String path;
  List<Texts> texts;
  PhoneNumber score;

  Highlight({this.path, this.texts, this.score});

  Highlight.fromJson(Map<String, dynamic> json) {
    path = json['path'];
    if (json['texts'] != null) {
      texts = new List<Texts>();
      json['texts'].forEach((v) {
        texts.add(new Texts.fromJson(v));
      });
    }
    score =
        json['score'] != null ? new PhoneNumber.fromJson(json['score']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['path'] = this.path;
    if (this.texts != null) {
      data['texts'] = this.texts.map((v) => v.toJson()).toList();
    }
    if (this.score != null) {
      data['score'] = this.score.toJson();
    }
    return data;
  }
}

class Texts {
  String value;
  String type;

  Texts({this.value, this.type});

  Texts.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['value'] = this.value;
    data['type'] = this.type;
    return data;
  }
}
