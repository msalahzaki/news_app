import 'package:flutter/material.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/ui/news/news_item_widget.dart';
import 'package:provider/provider.dart';

import '../../api/api_manger.dart';
import '../../model/Newsmodel.dart';
import '../../model/SourceResponse.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget({
    super.key,
    required this.source,
  });

  final Sources source;

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  late NewsProvider newsProvider;
  final ScrollController _scrollController = ScrollController();
  int page = 1;

  bool isEnd = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    newsProvider = Provider.of<NewsProvider>(context);
    if (newsProvider.news.isEmpty) {
      page = 1;
    }

    return FutureBuilder<Newsmodel>(
        future: ApiManger.getNewsBySourceID(widget.source.id!, page),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              page == 1) {
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
          } else if (snapshot.data!.status != "ok" && page == 1) {
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
            // news.addAll(snapshot.data!.articles!);
            if (snapshot.data!.articles != null &&
                snapshot.data!.articles!.isNotEmpty &&
                snapshot.connectionState != ConnectionState.waiting) {
              Provider.of<NewsProvider>(context, listen: false)
                  .addMoreEvent(snapshot.data!.articles!);
              // newsProvider.addMoreEvent(snapshot.data!.articles!);

              if (snapshot.data!.articles!.length < 100) {
                isEnd = true;
              } else {
                isEnd = false;
              }
            }
            return ListView.builder(
                controller: _scrollController,
                itemBuilder: (context, index) {
                  print(index.toString());
                  if (index < newsProvider.news.length) {
                    return NewsItemWidget(news: newsProvider.news[index]);
                  } else {
                    return !isEnd
                        ? TextButton(
                            onPressed: () {
                              _onScroll();
                            },
                            child: Text("Load More ....."),
                          )
                        : SizedBox();
                  }
                },
                itemCount: newsProvider.news.length + 1);
          }
        });
  }

  void _onScroll() async {
    // newsProvider.addMoreEvent(widget.source.id!, page);
    page++;
    setState(() {});
    // var newsModel = await ApiManger.getNewsBySourceID(widget.source.id!, page);
    // var newNews  = newsModel.articles;
    // if(newNews !=null ) {
    //   newsProvider.addMoreEvent(newNews);
    // }
  }
}
