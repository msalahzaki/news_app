import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/utils/app_assets.dart';

class CategoryModel {
  final String id;

  final String title;

  final String imagePath;

  CategoryModel(this.id, this.title, this.imagePath);
}

//
class CategoryList {
  static List<CategoryModel> getCategoryList(BuildContext context) {
    AppLocalizations local = AppLocalizations.of(context)!;
    return [
      CategoryModel("general", local.general, AppAssets.generalImage),
      CategoryModel("business", local.business, AppAssets.businessImage),
      CategoryModel(
          "entertainment", local.entertainment, AppAssets.entertainmentImage),
      CategoryModel("health", local.health, AppAssets.healthImage),
      CategoryModel("science", local.science, AppAssets.scienceImage),
      CategoryModel("technology", local.technology, AppAssets.technologyImage),
      CategoryModel("sports", local.sports, AppAssets.sportsImage),
    ];
  }
}
