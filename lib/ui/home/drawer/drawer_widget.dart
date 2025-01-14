import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:news_app/providers/theme_provider.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:news_app/utils/app_styles.dart';
import 'package:provider/provider.dart';

import '../../../providers/language_provider.dart';
import 'drawer_drop_menu.dart';
import 'drawer_item.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  late ThemeProvider themeProvider;
  late LanguageProvider languageProvider;
  late AppLocalizations local;

  @override
  Widget build(BuildContext context) {
    themeProvider = Provider.of<ThemeProvider>(context);
    languageProvider = Provider.of<LanguageProvider>(context);
    local = AppLocalizations.of(context)!;
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(
            bottom: size.height * .015,
          ),
          width: double.infinity,
          height: size.height * 0.25,
          alignment: Alignment.center,
          color: AppColor.white,
          child: Text(
            "News App",
            style: AppStyles.bold24black,
          ),
        ),
        DrawerItem(text: local.go_home_page, icon: Icons.home_outlined),
        const Divider(
          color: AppColor.white,
          thickness: 1.5,
          indent: 20,
          endIndent: 20,
        ),
        DrawerItem(text: local.theme, icon: Icons.format_paint_outlined),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DrawerDropMenu(
                option1: local.light,
                option2: local.dark,
                selected: themeProvider.theme == ThemeMode.light
                    ? local.light
                    : local.dark,
                onSelected: changeTheme)),
        const Divider(
          color: AppColor.white,
          thickness: 1.5,
          indent: 20,
          endIndent: 20,
        ),
        DrawerItem(text: local.language, icon: Icons.language),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: DrawerDropMenu(
              option1: local.english,
              option2: local.arabic,
              selected: languageProvider.language == "en"
                  ? local.english
                  : local.arabic,
              onSelected: changeLanguage,
            )),
      ],
    );
  }

  void changeTheme(String newTheme) {
    if (newTheme == "Light") {
      themeProvider.changeTheme(ThemeMode.light);
    } else {
      themeProvider.changeTheme(ThemeMode.dark);
    }
  }

  void changeLanguage(String newLanguage) {
    if (newLanguage == local.arabic) {
      languageProvider.changeLanguage(language: "ar");
    } else {
      languageProvider.changeLanguage(language: "en");
    }
  }
}
