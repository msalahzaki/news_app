import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/di/di.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/ui/home/sources_items/Cubit/source_widget_viewmodel.dart';
import 'package:news_app/ui/home/sources_items/Cubit/sources_states.dart';
import 'package:news_app/ui/news/news_source_screen.dart';

class SourcesWidget extends StatefulWidget {
  const SourcesWidget({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  State<SourcesWidget> createState() => _SourcesWidgetState();
}

class _SourcesWidgetState extends State<SourcesWidget> {
  SourceWidgetViewmodel viewmodel =
      SourceWidgetViewmodel(sourcesRepository: injectSourceRepository());

  @override
  void initState() {
    // TODO: implement initState
    viewmodel.getSourcesByCategoryID(widget.categoryModel.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SourceWidgetViewmodel, SourcesStates>(
      bloc: viewmodel,
      builder: (context, state) {
        if (state is SourceErrorState) {
          return Column(
            children: [
              const Text("SomeThing Wrong"),
              ElevatedButton(
                  onPressed: () {
                    setState(() {});
                  },
                  child: const Text("Try Again"))
            ],
          );
        } else if (state is SourceLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SourceSuccessState) {
          return NewsSourceScreen(
            sourcesList: state.sources!,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
