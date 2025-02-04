import 'package:hive/hive.dart';
import 'package:news_app/api/api_manger.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/ui/home/sources_items/repository/data_source/sources_local_dataSource.dart';

class SourcesLocalDatasourceImpl extends SourcesLocalDatasource {
  ApiManger apiManger;

  SourcesLocalDatasourceImpl(this.apiManger);

  @override
  Future<SourceResponse?> getSources(String categoryID) async {
    try {
      Box sourceBox = await Hive.openBox('news_sources');
      SourceResponse? response =
          SourceResponse.fromJson(sourceBox.get(categoryID));
      sourceBox.close();
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }

  @override
  void saveLocalSources(SourceResponse? sources, String categoryID) async {
    try {
      Box sourceBox = await Hive.openBox('news_sources');
      sourceBox.put(categoryID, sources!.toJson());
      sourceBox.close();
    } catch (e) {
      print(e);
    }
  }
}
