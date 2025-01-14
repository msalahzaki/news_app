import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/ui/home/home_screen.dart';
import 'package:news_app/utils/app_color.dart';

import 'drawer/drawer_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Widget currentWidget;
  late String appBarTitle =  AppLocalizations.of(context)!.home;

  @override
  void initState() {
    super.initState();

    currentWidget = HomeScreen(navigateNewScreen: changeHomeWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: AppColor.black,
        child: DrawerWidget(),
      ),
      appBar: AppBar(
        title:  Text(appBarTitle),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search))
        ],
      ),
      body: currentWidget,
    );
  }

  void changeHomeWidget(Widget newWidget,String appBarTitle) {
    setState(() {
      currentWidget = newWidget;
      this.appBarTitle = appBarTitle;
    });
  }
}
