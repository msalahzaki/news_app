import 'package:flutter/material.dart';
import 'package:news_app/api/api_manger.dart';
import 'package:news_app/model/SourceResponse.dart';

class SourceWidgetViewmodel extends ChangeNotifier {
  List<Sources>? sources;
  Sources? currentSource;
  String? errorMessage;

  getSourcesByCategoryID(String categoryID) async {
    try {
      var response = await ApiManger.getSources(categoryID);
      if (response == null) {
        errorMessage = "error Loading";
      } else if (response.message != null) {
        errorMessage = response.message;
      } else {
        sources = response.sources!;
        currentSource = sources![0];
      }
      notifyListeners();
    } catch (e) {}
  }

  changeSource(int sourceIndex) async {
    currentSource = sources![sourceIndex];
    notifyListeners();
  }
}
