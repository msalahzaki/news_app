import 'package:news_app/model/Newsmodel.dart';

abstract class NewsStates {}

class NewsLoadingState extends NewsStates {}

class NewsErrorState extends NewsStates {
  String errorMessage;

  NewsErrorState(this.errorMessage);
}

class NewsSuccessState extends NewsStates {
  List<News>? news;

  NewsSuccessState(this.news);
}
