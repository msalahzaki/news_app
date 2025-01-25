import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api/api_manger.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/ui/home/sources_items/Cubit/sources_states.dart';

class SourceWidgetViewmodel extends Cubit<SourcesStates> {
  int currentSourceIndex = 0;
  List<Sources>? sources;

  SourceWidgetViewmodel() : super(SourceLoadingState());

  getSourcesByCategoryID(String categoryID) async {
    try {
      emit(SourceLoadingState());
      var response = await ApiManger.getSources(categoryID);
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
