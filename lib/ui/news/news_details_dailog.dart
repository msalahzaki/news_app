import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/Newsmodel.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsDailog extends StatelessWidget {
  const NewsDetailsDailog({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Dialog(
      insetPadding: const EdgeInsets.all(5),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage ?? "",
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    CircularProgressIndicator(),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            SizedBox(
              height: size.height * .01,
            ),
            Text(
              news.description ?? "No Description Found ",
              style: AppStyles.normal14white
                  .copyWith(color: Theme.of(context).primaryColor),
            ),
            SizedBox(
              height: size.height * .01,
            ),
            ElevatedButton(
                style: ButtonStyle(
                    padding: const WidgetStatePropertyAll(EdgeInsets.all(20)),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)))),
                onPressed: () async {
                  if (news.url != null && news.url!.isNotEmpty) {
                    final uri = Uri.parse(news.url!);
                    if (await canLaunchUrl(uri)) {
                      await launchUrl(uri);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text('Cannot open the article.')),
                      );
                    }
                  }
                },
                child: Text(
                  "View All Article",
                  style: AppStyles.bold16black
                      .copyWith(color: Theme.of(context).colorScheme.secondary),
                ))
          ],
        ),
      ),
    );
  }
}
