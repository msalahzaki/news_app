import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/ui/home/sources_items/Cubit/source_widget_viewmodel.dart';
import 'package:news_app/ui/home/sources_items/Cubit/sources_states.dart';
import 'package:news_app/ui/home/sources_items/source_name_item.dart';
import 'package:news_app/ui/news/news_widget.dart';
import 'package:news_app/utils/app_color.dart';

class NewsSourceScreen extends StatelessWidget {
  const NewsSourceScreen({super.key, required this.sourcesList});

  final List<Sources> sourcesList;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SourceWidgetViewmodel(),
      child: BlocBuilder<SourceWidgetViewmodel, SourcesStates>(
        builder: (context, state) {
          final viewModel = BlocProvider.of<SourceWidgetViewmodel>(context);

          return Column(
            children: [
              DefaultTabController(
                length: sourcesList.length,
                  child: TabBar(
                    tabAlignment: TabAlignment.start,
                      tabs: sourcesList.map((source) {
                        int index = sourcesList.indexOf(source);
                        return SourceNameItem(
                          source: source,
                          isSelected: viewModel.currentSourceIndex == index,
                        );
                      }).toList(),
                      onTap: (index) {
                        viewModel.changeSource(index);
                      },
                      isScrollable: true,
                      indicatorColor: Theme.of(context).colorScheme.secondary,
                      dividerColor: AppColor.transpernt,
                  )),
              const SizedBox(height: 10),
              Expanded(
                  child: NewsWidget(
                source: sourcesList[viewModel.currentSourceIndex],
              )),
            ],
          );
        },
      ),
    );
  }
}
