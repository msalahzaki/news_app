import 'package:news_app/api/api_manger.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/ui/home/sources_items/repository/data_source/sources_remote_dataSource.dart';

class SourcesRemoteDatasourceImpl extends SourcesRemoteDatasource {
  SourcesRemoteDatasourceImpl(this.apiManger);

  ApiManger apiManger;

  @override
  Future<SourceResponse?> getSources(String categoryID) async {
    return await apiManger.getSources(categoryID);
  }
}
