import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/api/api_const.dart';
import 'package:news_app/api/end_points.dart';
import 'package:news_app/model/Newsmodel.dart';
import 'package:news_app/model/SourceResponse.dart';

class ApiManger {
  Future<SourceResponse?> getSources(String categoryID) async {
    Uri url = Uri.https(ApiConst.baseURL, EndPoints.sourceApi,
        {'apiKey': ApiConst.apiKey, 'category': categoryID});
    print(url);
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body);
      return SourceResponse.fromJson(json);
    } catch (e) {
      return null;
    }
  }

  Future<Newsmodel?> getNewsBySourceID(String sourceID, int page) async {
    Uri url = Uri.https(ApiConst.baseURL, EndPoints.newsApi,
        {'apiKey': ApiConst.apiKey, 'sources': sourceID, 'page': '$page'});
    print(url);
    var response = await http.get(url);
    return Newsmodel.fromJson(jsonDecode(response.body));
  }

  Future<Newsmodel> getNewsBySearch(String searchKey, int page) async {
    Uri url = Uri.https(ApiConst.baseURL, EndPoints.newsApi,
        {'apiKey': ApiConst.apiKey, 'q': searchKey, 'page': '$page'});
    print(url);
    var response = await http.get(url);
    return Newsmodel.fromJson(jsonDecode(response.body));
  }
}
