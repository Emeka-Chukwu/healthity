import 'dart:convert';

import 'package:healthify/features/pharmacies/models/pharmacy.dart';
import 'package:http/http.dart' as http;

class PharmacyRepository {
  String url = "https://healthify-app.herokuapp.com/api/v1/stores";
  final http.Client client = http.Client();

  Future<Pharmacy> getAllStoresData() async {
    final pharmacies = await client.get(url);

    final data = jsonDecode(pharmacies.body);
    return Pharmacy.fromJson(data);
  }
}
