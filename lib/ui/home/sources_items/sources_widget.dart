import 'package:flutter/material.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/ui/home/sources_items/source_widget_viewmodel.dart';
import 'package:news_app/ui/news/news_source_screen.dart';
import 'package:provider/provider.dart';

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
    super.initState();
    viewmodel.getSourcesByCategoryID(widget.categoryModel.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => viewmodel,
      child: Consumer<SourceWidgetViewmodel>(
        builder: (context, viewmodel, child) {
          if (viewmodel.errorMessage != null) {
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
          } else if (viewmodel.sources == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return NewsSourceScreen(
              sourcesList: viewmodel.sources!,
            );
          }
        },
      ),
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
