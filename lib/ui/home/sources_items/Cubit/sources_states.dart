import 'package:news_app/model/SourceResponse.dart';

abstract class SourcesStates {}

class SourceLoadingState extends SourcesStates {}

class SourceErrorState extends SourcesStates {
  String? errorMessage;

  SourceErrorState(this.errorMessage);
}

class SourceSuccessState extends SourcesStates {
  List<Sources>? sources;

  SourceSuccessState(this.sources);
}

class CurrentSourceChanged extends SourcesStates {
  int currentSourceIndex;

  CurrentSourceChanged(this.currentSourceIndex);
}
