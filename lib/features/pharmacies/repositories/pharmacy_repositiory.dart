import 'dart:convert';

import 'package:healthify/features/pharmacies/models/pharmacy.dart';
import 'package:healthify/features/pharmacies/models/search_pharmacy.dart';
import 'package:http/http.dart' as http;

class PharmacyRepository {
  String url = "https://healthify-app.herokuapp.com/api/v1/stores";
  // "https://webhooks.mongodb-realm.com/api/client/v2.0/app/pharmastoresearch-rfnht/service/Search_for_a_drug/incoming_webhook/drugSearch?arg=paracetamol";

  String urlSearch =
      "https://webhooks.mongodb-realm.com/api/client/v2.0/app/pharmastoresearch-rfnht/service/Search_for_a_drug/incoming_webhook/drugSearch";
  final http.Client client = http.Client();

  Future<Pharmacy> getAllStoresData() async {
    final pharmacies = await client.get(url);

    final data = jsonDecode(pharmacies.body);
    return Pharmacy.fromJson(data);
  }

  Future<List<SearchModel>> getAllSearchDrugs(String searchText) async {
    List<SearchModel> listModels = List<SearchModel>();
    final searchResult = await client.get("$urlSearch?arg=$searchText");
    List<dynamic> data = json.decode(searchResult.body);
    for (var element in data) {
      listModels.add(SearchModel.fromJson(element));
    }
    print(listModels);
    return listModels;
  }

  List<InventorySearch> getDrugsSearched(
      List<SearchModel> searchModel, String searchText) {
    List<InventorySearch> searchedDrugs = List<InventorySearch>();
    var val;
    for (var model in searchModel) {
      print(model);
      // model.inventory.map((element) {
      //   if(element.itemName == searchText){
      //      element.name = model.storeName;
      //   element.verified = model.verified;
      //   element.address = model.address;
      //   }
      // });

      val = model.inventory.where((element) {
        element.name = model.storeName;
        element.verified = model.verified;
        element.address = model.address;
        print(element.itemName);
        return element.itemName == searchText;
      }).toList();
      searchedDrugs.addAll(val);
    }
    print(searchedDrugs);
    return searchedDrugs;
  }
}
