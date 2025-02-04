import 'package:news_app/api/api_manger.dart';
import 'package:news_app/ui/home/sources_items/repository/data_source/Sources_local_dataSource_impl.dart';
import 'package:news_app/ui/home/sources_items/repository/data_source/Sources_remote_dataSource_impl.dart';
import 'package:news_app/ui/home/sources_items/repository/data_source/sources_local_dataSource.dart';
import 'package:news_app/ui/home/sources_items/repository/data_source/sources_remote_dataSource.dart';
import 'package:news_app/ui/home/sources_items/repository/repository/sources_repository.dart';
import 'package:news_app/ui/home/sources_items/repository/repository/sources_repository_impl.dart';
import 'package:news_app/ui/news/repository/data_source/news_data_source.dart';
import 'package:news_app/ui/news/repository/data_source/news_remote_data_source.dart';
import 'package:news_app/ui/news/repository/repository/news_repository.dart';
import 'package:news_app/ui/news/repository/repository/news_repositroy_impl.dart';

SourcesRepository injectSourceRepository() {
  return SourcesRepositoryImpl(
      injectSourceLocalDataSource(), injectSourceRemoteDataSource());
}

SourcesRemoteDatasource injectSourceRemoteDataSource() {
  return SourcesRemoteDatasourceImpl(injectApiManger());
}

SourcesLocalDatasource injectSourceLocalDataSource() {
  return SourcesLocalDatasourceImpl(injectApiManger());
}

ApiManger injectApiManger() {
  return ApiManger();
}

NewsRepository injectNewsRepository() {
  return NewsRepositoryImpl(injectDataSource());
}

NewsDataSource injectDataSource() {
  return NewsRemoteDataSource(injectApiManger());
}
