import 'package:flutter/material.dart';
import 'package:news/api/ApiManager.dart';
import 'package:news/model/NewsResponse.dart';

class NewsWidgetViewModel extends ChangeNotifier {
  /// hold data - handle logic
  List<News>? newsList;
  String? errorMessage;

  void getNewsBySourceId(String sourceId) async {
    newsList = null;
    errorMessage = null;
    notifyListeners();
    try {
      var response = await ApiManager.getNeswBySourceId(sourceId);
      if (response?.status == 'error') {
        errorMessage = response!.message;
      } else {
        newsList = response!.articles;
      }
    } catch (e) {
      errorMessage = 'Error Loading News List.';
    }
    notifyListeners();
  }
}
