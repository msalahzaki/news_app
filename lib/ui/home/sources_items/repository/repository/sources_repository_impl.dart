import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/ui/home/sources_items/repository/data_source/sources_local_dataSource.dart';
import 'package:news_app/ui/home/sources_items/repository/data_source/sources_remote_dataSource.dart';
import 'package:news_app/ui/home/sources_items/repository/repository/sources_repository.dart';

class SourcesRepositoryImpl extends SourcesRepository {
  SourcesRemoteDatasource sourcesRemoteDatasource;
  SourcesLocalDatasource sourcesLocalDataSource;

  SourcesRepositoryImpl(
      this.sourcesLocalDataSource, this.sourcesRemoteDatasource);

  @override
  Future<SourceResponse?> getSources(String categoryID) async {
    final List<ConnectivityResult> connectivityResult =
        await (Connectivity().checkConnectivity());

    if (connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.mobile)) {
      SourceResponse? response =
          await sourcesRemoteDatasource.getSources(categoryID);
      sourcesLocalDataSource.saveLocalSources(response, categoryID);
      return response;
    } else {
      return sourcesLocalDataSource.getSources(categoryID);
    }
  }
}
