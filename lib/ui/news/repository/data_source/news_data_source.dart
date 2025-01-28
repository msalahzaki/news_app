import '../../../../model/Newsmodel.dart';

abstract class NewsDataSource {
  Future<Newsmodel?> getNewsBySourceID(String sourceID, int page);

  Future<Newsmodel> getNewsBySearch(String searchKey, int page);
}
