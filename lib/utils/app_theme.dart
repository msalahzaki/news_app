import 'package:flutter/material.dart';
import 'package:news_app/utils/app_color.dart';
import 'package:news_app/utils/app_styles.dart';

class AppTheme {
  static ThemeData lighttheme = ThemeData(
      primaryColor: AppColor.white,
      colorScheme: const ColorScheme.light(secondary: AppColor.black),
      appBarTheme: const AppBarTheme(backgroundColor: AppColor.white),
      scaffoldBackgroundColor: AppColor.white,
      dropdownMenuTheme: DropdownMenuThemeData(
          menuStyle: MenuStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
          ),
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: dropMenuBorder(),
        focusedBorder: dropMenuBorder(),
        border: dropMenuBorder(),
        )),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: AppColor.black,
      suffixIconColor: AppColor.black,
      hintStyle: AppStyles.normal16black,
      border: dropMenuBorder(borderColor: AppColor.black),
      enabledBorder: dropMenuBorder(borderColor: AppColor.black),
      focusedBorder: dropMenuBorder(borderColor: AppColor.black),
    ),
  );

  static ThemeData darktheme = ThemeData(
      primaryColor: AppColor.black,
      colorScheme: const ColorScheme.dark(secondary: AppColor.white),
      appBarTheme: const AppBarTheme(backgroundColor: AppColor.black),
      scaffoldBackgroundColor: AppColor.black,
      dropdownMenuTheme: DropdownMenuThemeData(
          menuStyle: MenuStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),
          ),
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: dropMenuBorder(),
            focusedBorder: dropMenuBorder(),
            border: dropMenuBorder(),
        )),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: AppColor.white,
      suffixIconColor: AppColor.white,
      hintStyle: AppStyles.normal16white,
      border: dropMenuBorder(),
      enabledBorder: dropMenuBorder(),
      focusedBorder: dropMenuBorder(),
    ),
  );

  static OutlineInputBorder dropMenuBorder(
      {Color borderColor = AppColor.white}) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(
          color: borderColor,
        ));
  }
}
