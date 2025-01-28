import 'package:news_app/model/SourceResponse.dart';

abstract class SourcesRepository {
  Future<SourceResponse?> getSources(String categoryID);
}
