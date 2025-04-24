import 'package:flutter/material.dart';
import 'package:news/api/ApiManager.dart';
import 'package:news/model/SourceResponse.dart';

class CategoryDetailsViewModel extends ChangeNotifier {
  /// hold data  -  handle logic
  List<Source>? sourcesList;
  String? errorMessage;

  void getSources(String categoryId) async {
    sourcesList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getSources(categoryId);
      if (response?.status == 'error') {
        errorMessage = response!.message;
      } else {
        sourcesList = response!.sources;
      }
    } catch (e) {
      errorMessage = 'Error Loading Source List. ';
    }
    notifyListeners();
  }
}
