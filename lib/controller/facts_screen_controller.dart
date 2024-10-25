import 'package:api_fact_integration/model/facts_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FactsScreenController with ChangeNotifier {
  List<Facts> dataList = [];
  bool isLoading = false;

  Future<void> getFacts() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse("https://catfact.ninja/facts");

    try {
      var response = await http.get(url);

      if (response.statusCode == 200) {
        FactsModel resModel = factsModelFromJson(response.body);

        dataList = resModel.factslist ?? [];
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
