class DrugModel {
  String title;
  double quantity;
  DrugModel({this.title, this.quantity});

  DrugModel.fromJson(Map<String, dynamic> json) {
    title = json["title"] ?? null;
    quantity = json["quantity"] ?? null;
  }

  Map<String, dynamic> toJson() => {
        "title": this.title,
        "quantity": this.quantity,
      };
}
