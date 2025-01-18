import 'package:flutter/material.dart';
import 'package:news_app/model/Newsmodel.dart';

class NewsProvider extends ChangeNotifier {
  List<News> news = [];

  initnews() {
    news = [];
    notifyListeners();
  }

  addMoreEvent(List<News> newNew) {
    news.addAll(newNew);
  }
}
