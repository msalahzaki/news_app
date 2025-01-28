import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/ui/news/Cubit/news_states.dart';
import 'package:news_app/ui/news/news_item_widget.dart';

import '../../di/di.dart';
import '../../model/SourceResponse.dart';
import 'Cubit/news_widget_viewModel.dart';

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
  NewsWidgetViewmodel viewmodel =
      NewsWidgetViewmodel(newsRepository: injectNewsReposatory());

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
          return const SizedBox();
        }
      },
    );
  }
}
