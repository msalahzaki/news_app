import 'package:news_app/model/Newsmodel.dart';
import 'package:news_app/ui/news/repository/data_source/news_data_source.dart';
import 'package:news_app/ui/news/repository/repository/news_repository.dart';

class NewsRepositoryImpl extends NewsRepository {
  NewsRepositoryImpl(this.newsDataSource);

  NewsDataSource newsDataSource;

  @override
  Future<Newsmodel> getNewsBySearch(String searchKey, int page) {
    return newsDataSource.getNewsBySearch(searchKey, page);
  }

  @override
  Future<Newsmodel?> getNewsBySourceID(String sourceID, int page) {
    return newsDataSource.getNewsBySourceID(sourceID, page);
  }
}
