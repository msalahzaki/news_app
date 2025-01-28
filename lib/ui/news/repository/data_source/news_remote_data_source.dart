import 'package:news_app/api/api_manger.dart';
import 'package:news_app/model/Newsmodel.dart';
import 'package:news_app/ui/news/repository/data_source/news_data_source.dart';

class NewsRemoteDataSource extends NewsDataSource {
  ApiManger apiManger;

  NewsRemoteDataSource(this.apiManger);

  @override
  Future<Newsmodel> getNewsBySearch(String searchKey, int page) async {
    return await apiManger.getNewsBySearch(searchKey, page);
  }

  @override
  Future<Newsmodel?> getNewsBySourceID(String sourceID, int page) async {
    return await apiManger.getNewsBySourceID(sourceID, page);
  }
}
