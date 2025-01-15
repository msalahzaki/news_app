import 'package:flutter/material.dart';
import 'package:news_app/api/api_manger.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/ui/news/news_source_screen.dart';

class Sources_widget extends StatefulWidget {
  const Sources_widget({super.key, required this.categoryModel});

  final CategoryModel categoryModel;

  @override
  State<Sources_widget> createState() => _Sources_widgetState();
}

class _Sources_widgetState extends State<Sources_widget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
        future: ApiManger.getSources(),
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
        });
  }
}
