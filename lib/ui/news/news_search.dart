import 'package:flutter/material.dart';
import 'package:news_app/api/api_manger.dart';
import 'package:news_app/utils/app_color.dart';

import '../../model/Newsmodel.dart';
import 'news_item_widget.dart';

class NewsSearch extends StatefulWidget {
  const NewsSearch({super.key});

  @override
  State<NewsSearch> createState() => _NewsSearchState();
}

class _NewsSearchState extends State<NewsSearch> {
  TextEditingController searchEditingController = TextEditingController();
  List<News> news = [];
  String status = "";
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onEditingComplete: () {
                getSeacrhedData();
              },
              controller: searchEditingController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: AppColor.black)),
                  prefixIcon: IconButton(
                      onPressed: () {
                        getSeacrhedData();
                      },
                      icon: const Icon(Icons.search)),
                  suffixIcon: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.close)),
                  hintText: "Search"),
            ),
            isLoading
                ? const Expanded(
                    child: Center(child: CircularProgressIndicator()))
                : news.isEmpty
                    ? Expanded(child: Center(child: Text(status)))
                    : Expanded(
                        child: ListView.builder(
                            itemBuilder: (context, index) {
                              print(index.toString());
                              return NewsItemWidget(news: news[index]);
                            },
                            itemCount: news.length),
                      ),
          ],
        ),
      )),
    );
  }

  void getSeacrhedData() async {
    isLoading = true;
    setState(() {});
    String searchText = searchEditingController.text;
    if (searchText.isNotEmpty) {
      Newsmodel newsModel = await ApiManger.getNewsBySearch(searchText, 1);
      if (newsModel.status == "ok" && newsModel.articles!.isNotEmpty) {
        news = newsModel.articles!;
      } else {
        status = "No News Founded ";
      }
    } else {
      status = "Please Enter valid Search key ";
    }
    isLoading = false;
    setState(() {});
  }
}
