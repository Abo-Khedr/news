import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news/model/NewsResponse.dart';
import 'package:news/model/SourceResponse.dart';
import 'package:news/api/api_constants.dart';

class ApiManager {
  /*
    https://newsapi.org/v2/top-headlines/sources?apiKey=4ecb46b18edd4db9b2044a1110ccbdcf
  */

  /// function to get sources
  static Future<SourceResponse?> getSources(String categoryId) async {
    Uri url = Uri.https(
      ApiConstants.baseUrl,
      ApiConstants.sourceApi,
      {
        'apiKey': ApiConstants.apiKey,
        'category': categoryId,
      },
    );
    var response = await http.get(url);
    try {
      var responseBody = response.body;
      var json = jsonDecode(responseBody);
      return SourceResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  /// function get news
  /// https://newsapi.org/v2/everything?q=bitcoin&apiKey=4ecb46b18edd4db9b2044a1110ccbdcf
  static Future<NewsResponse?> getNeswBySourceId(String sourceId) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApi, {
      'apiKey': ApiConstants.apiKey,
      'sources': sourceId,
    });
    var response = await http.get(url);
    try {
      var responseBody = response.body;
      var json = jsonDecode(responseBody); // json
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }

  static Future<NewsResponse?> searchNews(String query) async {
    Uri url = Uri.https(ApiConstants.baseUrl, ApiConstants.newsApi, {
      'apiKey': ApiConstants.apiKey,
      'q': query,
    });
    var response = await http.get(url);
    try {
      var responseBody = response.body;
      var json = jsonDecode(responseBody); // json
      return NewsResponse.fromJson(json);
    } catch (e) {
      throw e;
    }
  }
}
