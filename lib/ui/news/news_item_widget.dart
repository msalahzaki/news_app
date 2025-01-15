import 'package:flutter/material.dart';
import 'package:news_app/utils/app_styles.dart';

import '../../model/Newsmodel.dart';

class NewsItemWidget extends StatelessWidget {
  const NewsItemWidget({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
            color: Theme.of(context).colorScheme.secondary, width: 2),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              news.urlToImage ?? "",
              height: size.height * .20,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            news.title ?? "",
            style: AppStyles.bold16black
                .copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "By ${(news.author!.length > 10) ? news.author!.substring(0, 10) : news.author!}",
                style: AppStyles.normal12grey,
              ),
              Text(
                "By ${news.publishedAt}",
                style: AppStyles.normal12grey,
              ),
            ],
          )
        ],
      ),
    );
  }
}
