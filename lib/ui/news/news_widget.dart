import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/ui/news/Cubit/news_states.dart';
import 'package:news_app/ui/news/news_item_widget.dart';

import '../../model/SourceResponse.dart';
import 'news_widget_viewModel.dart';

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
  NewsWidgetViewmodel viewmodel = NewsWidgetViewmodel();

  @override
  void didUpdateWidget(NewsWidget oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.source.id != widget.source.id) {
      viewmodel.getNewsBySourceID(widget.source.id!);
    }
  }

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
    return BlocBuilder<NewsWidgetViewmodel, NewsStates>(
      bloc: viewmodel,
      builder: (context, state) {
        if (state is NewsErrorState) {
          return Column(
            children: [
              Text(state.errorMessage),
              ElevatedButton(
                  onPressed: () {
                    viewmodel.getNewsBySourceID(widget.source.id!);
                  },
                  child: const Text("Try Again"))
            ],
          );
        } else if (state is NewsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is NewsSuccessState) {
          return ListView.builder(
              itemBuilder: (context, index) {
                if (index < state.news!.length) {
                  return NewsItemWidget(news: viewmodel.news![index]);
                } else {
                  return !viewmodel.isEnd
                      ? TextButton(
                          onPressed: () {
                            viewmodel.loadMoreEvent(widget.source.id!);
                          },
                          child: viewmodel.loadingMoreNews
                              ? const Center(
                                  child: CircularProgressIndicator(),
                                )
                              : const Text("Load More ....."),
                        )
                      : const SizedBox();
                }
              },
              itemCount: state.news!.length + 1);
        } else {
          return SizedBox();
        }
      },
    );
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
