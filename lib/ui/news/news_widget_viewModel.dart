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
      Newsmodel? response = await ApiManger.getNewsBySourceID(sourceID, 1);
      if (response == null) {
        errorMessage = "Some Thing went wrong";
      } else if (response.message != null) {
        errorMessage = response.message;
      } else {
        news = response.articles!;
        if (news!.length < 100) {
          isEnd = true;
        }
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
    isEnd = false;
    notifyListeners();
  }

  void loadMoreEvent(String sourceId) async {
    loadingMoreNews = true;
    notifyListeners();

    page++;
    try {
      Newsmodel? response = await ApiManger.getNewsBySourceID(sourceId, page);
      if (response == null) {
        errorMessage = "Some Thing went wrong";
      } else if (response.message != null) {
        errorMessage = response.message;
      } else {
        if (response.articles!.length < 100) {
          isEnd = true;
        }
        news!.addAll(response.articles!);
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    loadingMoreNews = false;
    notifyListeners();
  }
}
