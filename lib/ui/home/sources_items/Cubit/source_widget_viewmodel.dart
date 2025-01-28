import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/ui/home/sources_items/Cubit/sources_states.dart';
import 'package:news_app/ui/home/sources_items/repository/repository/sources_repository.dart';

class SourceWidgetViewmodel extends Cubit<SourcesStates> {
  int currentSourceIndex = 0;
  List<Sources>? sources;

  SourceWidgetViewmodel({required this.sourcesRepository})
      : super(SourceLoadingState());

  final SourcesRepository sourcesRepository;

  getSourcesByCategoryID(String categoryID) async {
    try {
      emit(SourceLoadingState());
      var response = await sourcesRepository.getSources(categoryID);
      if (response == null) {
        emit(SourceErrorState("SomeThing Went Wrong"));
      } else if (response.message != null) {
        emit(SourceErrorState(response.message));
      } else {
        sources = response.sources!;
        emit(SourceSuccessState(response.sources!));
        currentSourceIndex = 0;
      }
    } catch (e) {
      emit(SourceErrorState(e.toString()));
    }
  }

  changeSource(int sourceIndex) async {
    currentSourceIndex = sourceIndex;
    emit(CurrentSourceChanged(sourceIndex));
  }
}
