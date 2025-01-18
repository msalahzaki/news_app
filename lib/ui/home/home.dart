import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/ui/home/home_screen.dart';
import 'package:news_app/ui/news/news_search.dart';
import 'package:news_app/utils/app_color.dart';

import 'drawer/drawer_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget? currentWidget;
  late String appBarTitle;

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    if (currentWidget == null) {
      currentWidget = HomeScreen(navigateNewScreen: changeHomeWidget);
      appBarTitle = AppLocalizations.of(context)!.home;
    }

    return Scaffold(
      drawer: const Drawer(
        backgroundColor: AppColor.black,
        child: DrawerWidget(),
      ),
      appBar: AppBar(
        title:  Text(appBarTitle),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NewsSearch(),
                ));
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: currentWidget,
    );
  }

  void changeHomeWidget(Widget newWidget, CategoryModel category) {
    setState(() {
      currentWidget = newWidget;
      appBarTitle = category.title;
    });
  }
}
