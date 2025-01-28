import '../../../../../model/SourceResponse.dart';

abstract class SourcesDataSource {
  Future<SourceResponse?> getSources(String categoryID);
}
