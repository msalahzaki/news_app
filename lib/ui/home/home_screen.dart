import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/ui/home/category/category_details.dart';
import 'package:news_app/ui/home/widget/home_category_widget.dart';
import 'package:news_app/utils/app_assets.dart';
import 'package:news_app/utils/app_styles.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.navigateNewScreen});
  late AppLocalizations local;
 final  Function(Widget,String) navigateNewScreen ;

  @override
  Widget build(BuildContext context) {
    local = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(
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
          HomeCategoryWidget(
            text: local.general,
            imageUrl: AppAssets.generalImage,
            ontap: () {
            //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CategoryDetails(),));
              navigateNewScreen(CategoryDetails(),local.general);
            },
          ),
          HomeCategoryWidget(
            text: local.business,
            imageUrl: AppAssets.businessImage,
            isLeft: false,
            ontap: () {},
          ),
          HomeCategoryWidget(
            text: local.entertainment,
            imageUrl: AppAssets.entertainmentImage,
            ontap: () {},
          ),
          HomeCategoryWidget(
            text: local.health,
            imageUrl: AppAssets.healthImage,
            isLeft: false,
            ontap: () {},
          ),
          HomeCategoryWidget(
            text: local.science,
            imageUrl: AppAssets.scienceImage,
            ontap: () {},
          ),
          HomeCategoryWidget(
            text: local.technology,
            imageUrl: AppAssets.technologyImage,
            isLeft: false,
            ontap: () {},
          ),
          HomeCategoryWidget(
            text: local.sports,
            imageUrl: AppAssets.sportsImage,
            ontap: () {},
          ),
        ],
      ),
    );
  }
}
