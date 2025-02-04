import '../../../../../model/SourceResponse.dart';

abstract class SourcesLocalDatasource {
  Future<SourceResponse?> getSources(String categoryID);

  void saveLocalSources(SourceResponse? sources, String categoryID);
}
