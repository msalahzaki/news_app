import 'package:flutter/material.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/ui/news/news_item_widget.dart';
import 'package:news_app/ui/news/news_widget_viewModel.dart';
import 'package:provider/provider.dart';

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
  late NewsWidgetViewmodel viewmodel = NewsWidgetViewmodel();
  late NewsProvider newsProvider;

  @override
  void initState() {
    super.initState();
    viewmodel.getNewsBySourceID(widget.source.id!);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    newsProvider = Provider.of<NewsProvider>(context);

    if (newsProvider.news.isEmpty) {
      viewmodel.page = 1;
    }

    return ChangeNotifierProvider(
        create: (context) => viewmodel,
        child:
            Consumer<NewsWidgetViewmodel>(builder: (context, viewmodel, child) {
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
          } else if (viewmodel.news == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return ListView.builder(
                itemCount: viewmodel.news!.length,
                itemBuilder: (context, index) {
                  return NewsItemWidget(news: viewmodel.news![index]);
                });
          }
        }));
  }
}
/*
      FutureBuilder<Newsmodel?>(
        future: ApiManger.getNewsBySourceID(widget.source.id!, page),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting &&
              page == 1) {
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
            if (snapshot.data!.articles != null &&
                snapshot.data!.articles!.isNotEmpty &&
                snapshot.connectionState != ConnectionState.waiting) {
              Provider.of<NewsProvider>(context, listen: false)
                  .addMoreEvent(snapshot.data!.articles!);
              loadingMoreNews = false;
              // newsProvider.addMoreEvent(snapshot.data!.articles!);

              if (snapshot.data!.articles!.length < 100) {
                isEnd = true;
              } else {
                isEnd = false;
              }
            }
            return ListView.builder(
                itemBuilder: (context, index) {
                  if (index < newsProvider.news.length) {
                    return NewsItemWidget(news: newsProvider.news[index]);
                  } else {
                    return !isEnd
                        ? TextButton(
                            onPressed: () {
                              _onScroll();
                            },
                            child: loadingMoreNews
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : const Text("Load More ....."),
                          )
                        : const SizedBox();
                  }
                },
                itemCount: newsProvider.news.length + 1);
          }
        });
        */
