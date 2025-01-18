import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_time_ago/get_time_ago.dart';
import 'package:news_app/utils/app_styles.dart';

import '../../model/Newsmodel.dart';
import 'news_details_dailog.dart';

class NewsItemWidget extends StatelessWidget {
  const NewsItemWidget({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => NewsDetailsDailog(news: news),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: Theme.of(context).colorScheme.secondary, width: 2),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage!.substring(1, 3) ?? "",
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
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
                  "By: ${(news.author != null && news.author!.length > 10) ? news.author!.substring(0, 10) : news.author ?? ""}",
                  style: AppStyles.normal12grey,
                ),
                Text(
                  getTimeAge(),
                  style: AppStyles.normal12grey,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  String getTimeAge() {
    var timestamp = news.publishedAt; // [DateTime] formatted as String.
    var convertedTimestamp =
        DateTime.parse(timestamp!); // Converting into [DateTime] object
    return GetTimeAgo.parse(convertedTimestamp);
  }
}
