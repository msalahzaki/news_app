import '../../../../../model/SourceResponse.dart';

abstract class SourcesRemoteDatasource {
  Future<SourceResponse?> getSources(String categoryID);
}
