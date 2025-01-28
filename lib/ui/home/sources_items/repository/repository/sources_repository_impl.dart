import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/ui/home/sources_items/repository/data_source/sources_data_source.dart';
import 'package:news_app/ui/home/sources_items/repository/repository/sources_repository.dart';

class SourcesRepositoryImpl extends SourcesRepository {
  SourcesDataSource sourcesDataSource;

  SourcesRepositoryImpl(this.sourcesDataSource);

  @override
  Future<SourceResponse?> getSources(String categoryID) {
    return sourcesDataSource.getSources(categoryID);
  }
}
