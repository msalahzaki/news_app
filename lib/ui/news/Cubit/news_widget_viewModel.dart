import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/ui/news/Cubit/news_states.dart';
import 'package:news_app/ui/news/repository/repository/news_repository.dart';

import '../../../../model/Newsmodel.dart';

class NewsWidgetViewmodel extends Cubit<NewsStates> {
  int page = 1;
  bool isEnd = true;
  bool loadingMoreNews = false;
  List<News>? news;
  String? errorMessage;
  NewsRepository newsRepository;

  NewsWidgetViewmodel({required this.newsRepository})
      : super(NewsLoadingState());

  void getNewsBySourceID(String sourceID) async {
    page = 1;
    isEnd = false;
    try {
      emit(NewsLoadingState());
      Newsmodel? response = await newsRepository.getNewsBySourceID(sourceID, 1);
      if (response == null) {
        errorMessage = "Some Thing went wrong";
        emit(NewsErrorState(errorMessage!));
      } else if (response.message != null) {
        emit(NewsErrorState(errorMessage!));
      } else {
        news = response.articles!;
        if (news!.length < 100) {
          isEnd = true;
        }
        emit(NewsSuccessState(news));
      }
    } catch (e) {
      errorMessage = e.toString();
      emit(NewsErrorState(errorMessage!));
    }
    // notifyListeners();
  }

  initNews() {
    page = 1;
    news = null;
    isEnd = false;
  }

  void loadMoreEvent(String sourceId) async {
    loadingMoreNews = true;
    page++;
    try {
      Newsmodel? response =
          await newsRepository.getNewsBySourceID(sourceId, page);
      if (response == null) {
        errorMessage = "Some Thing went wrong";
      } else if (response.message != null) {
        errorMessage = response.message;
      } else {
        if (response.articles!.length < 100) {
          isEnd = true;
        }
        news!.addAll(response.articles!);
        emit(NewsSuccessState(news));
      }
    } catch (e) {
      errorMessage = e.toString();
    }
    loadingMoreNews = false;
    // notifyListeners();
  }
}
