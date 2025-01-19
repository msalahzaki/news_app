import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/ui/home/sources_items/sources_widget.dart';
import 'package:news_app/ui/home/widget/home_category_widget.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

import '../../providers/news_provider.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.navigateNewScreen});
  late AppLocalizations local;
  final Function(Widget, CategoryModel) navigateNewScreen;

  @override
  Widget build(BuildContext context) {
    local = AppLocalizations.of(context)!;
    List<CategoryModel> categoryList = CategoryList.getCategoryList(context);
    // Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            local.good_morning,
            style: AppStyles.normal20white
                .copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
          Text(
            local.here_is_some_fews_for_you,
            style: AppStyles.normal20white
                .copyWith(color: Theme.of(context).colorScheme.secondary),
          ),
          Expanded(
              child: ListView.builder(
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              return HomeCategoryWidget(
                  text: categoryList[index].title,
                  imageUrl: categoryList[index].imagePath,
                  isLeft: index % 2 == 0,
                  ontap: () {
                    Provider.of<NewsProvider>(context, listen: false)
                        .initnews();
                    navigateNewScreen(
                        SourcesWidget(categoryModel: categoryList[index]),
                        categoryList[index]);
                  });
            },
          ))
        ],
      ),
    );
  }
}
