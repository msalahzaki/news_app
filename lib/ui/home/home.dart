import 'package:flutter/material.dart';
import 'package:news_app/ui/home/category/category_details.dart';
import 'package:news_app/utils/app_color.dart';

import 'drawer/drawer_widget.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: AppColor.black,
        child: DrawerWidget(),),
     appBar: AppBar(title: const Text("General"),centerTitle: true,),

    body:const CategoryDetails(),

    );
  }
}
