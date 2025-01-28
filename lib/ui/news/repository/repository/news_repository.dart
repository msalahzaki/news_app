import '../../../../model/Newsmodel.dart';

abstract class NewsRepository {
  Future<Newsmodel?> getNewsBySourceID(String sourceID, int page);

  Future<Newsmodel> getNewsBySearch(String searchKey, int page);
}
