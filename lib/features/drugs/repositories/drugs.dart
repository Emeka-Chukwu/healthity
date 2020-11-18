import 'dart:convert';

import 'package:healthify/features/drugs/models/drugs.dart';
import 'package:http/http.dart' as http;

class DrugRepository {
  http.Client client = http.Client();
  String url = "http://www.example.com";

  Future<DrugModel> getPharmarcyDrugs(String url) async {
    final drugs = await client.get(url);
    var data = jsonDecode(drugs.body);
    return DrugModel.fromJson(data);
  }

  void addDrugs(
    String title,
    double qty,
  ) {
    DrugModel drugModel = DrugModel();
    drugModel.title = title;
    drugModel.quantity = qty;
    client.post(
      url,
      body: drugModel.toJson(),
    );
  }

  Future<DrugModel> searchDrugPharmacy(String url, String search) async {
    final drugs = await client.get("$url?search=$search");
    var data = jsonDecode(drugs.body);
    return DrugModel.fromJson(data);
  }
}
