import 'package:flutter/material.dart';
import 'package:news_app/api/api_manger.dart';

import '../../model/Newsmodel.dart';

class NewsWidgetViewmodel extends ChangeNotifier {
  int page = 1;
  bool isEnd = true;
  bool loadingMoreNews = false;
  List<News>? news;

  String? errorMessage;

  getNewsBySourceID(String sourceID) async {
    try {
      Newsmodel? response = await ApiManger.getNewsBySourceID(sourceID, page);
      if (response == null) {
        errorMessage = "Some Thing went wrong";
      } else if (response.message != null) {
        errorMessage = response.message;
      } else {
        news = response.articles!;
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    notifyListeners();
  }

  Future<void> changeSource(String sourceId) async {
    try {
      news = null; // To trigger loading spinner
      notifyListeners();
      await getNewsBySourceID(sourceId);
    } catch (e) {
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  initNews() {
    page = 1;
    news = null;
    notifyListeners();
  }

  void loadMoreEvent() async {
    page++;
    // loadingMoreNews = true;
    // setState(() {});
  }
}
