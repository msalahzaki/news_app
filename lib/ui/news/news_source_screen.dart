import 'package:flutter/material.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/ui/home/sources_items/source_name_item.dart';
import 'package:news_app/ui/news/news_widget.dart';
import 'package:news_app/utils/app_color.dart';

class NewsSourceScreen extends StatefulWidget {
  const NewsSourceScreen({super.key, required this.sourcesList});

  final List<Sources> sourcesList;

  @override
  State<NewsSourceScreen> createState() => _NewsSourceScreenState();
}

class _NewsSourceScreenState extends State<NewsSourceScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultTabController(
            length: widget.sourcesList.length,
            child: TabBar(
              tabs: widget.sourcesList.map((e) {
                return SourceNameItem(
                  source: e,
                  isSelected: selectedIndex == widget.sourcesList.indexOf(e),
                );
              }).toList(),
              onTap: (index) {
                selectedIndex = index;
                setState(() {});
              },
              isScrollable: true,
              tabAlignment: TabAlignment.start,
              indicatorColor: Theme.of(context).colorScheme.secondary,
              dividerColor: AppColor.transpernt,
            )),
        Expanded(child: NewsWidget(source: widget.sourcesList[selectedIndex])),
      ],
    );
  }
}
