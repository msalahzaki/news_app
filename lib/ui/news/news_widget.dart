import 'package:flutter/material.dart';
import 'package:news_app/ui/news/news_item_widget.dart';

import '../../api/api_manger.dart';
import '../../model/Newsmodel.dart';
import '../../model/SourceResponse.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget({super.key, required this.source});

  final Sources source;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Newsmodel>(
        future: ApiManger.getNewsBySourceID(widget.source.id!),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircleAvatar(),
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
            var news = snapshot.data!.articles;
            return ListView.separated(
                itemBuilder: (context, index) {
                  return NewsItemWidget(news: news[index]);
                },
                separatorBuilder: (context, index) {
                  return SizedBox(height: 5);
                },
                itemCount: news!.length);
          }
        });
  }
}
