import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  SourceWidgetViewmodel viewmodel = SourceWidgetViewmodel();

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
          return SizedBox();
        }
      },
    );

    /*
      FutureBuilder<SourceResponse?>(
        future: ApiManger.getSources(widget.categoryModel.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
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
          } else if (snapshot.data!.status != "ok") {
            return Column(
              children: [
                Text(snapshot.data!.message ?? ""),
                ElevatedButton(
                    onPressed: () {
                      setState(() {});
                    },
                    child: const Text("Try Again"))
              ],
            );
          } else {
            var sources = snapshot.data!.sources;
            return NewsSourceScreen(sourcesList: sources!);
          }
        });*/
  }
}
