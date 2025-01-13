import 'package:flutter/material.dart';
import 'package:news_app/api/api_manger.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/ui/home/category/source_tab_widget.dart';

class CategoryDetails extends StatelessWidget {
  const CategoryDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse>(
      future: ApiManger.getSources(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        else if (snapshot.hasError) {
          return Column(
            children: [
              const Text("SomeThing Wrong"),
              ElevatedButton(onPressed: () {}, child: const Text("Try Again"))
            ],
          );
        }
        else if(snapshot.data!.status != "ok"){

          return Column(
              children: [
               Text(snapshot.data!.message??""),
        ElevatedButton(onPressed: () {}, child: const Text("Try Again"))
        ],);
        }else {
          var sources = snapshot.data!.sources;
          return SourceTabWidget(sourcesList: sources!);
        }
      }
    );
      }
  }

