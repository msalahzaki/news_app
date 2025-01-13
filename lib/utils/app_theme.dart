
import 'package:flutter/material.dart';
import 'package:news_app/utils/app_color.dart';


class AppTheme {
  static ThemeData lighttheme = ThemeData(
    primaryColor: AppColor.white,
    colorScheme: const ColorScheme.light(secondary: AppColor.black),
    appBarTheme: const AppBarTheme(backgroundColor:  AppColor.white),
    scaffoldBackgroundColor: AppColor.white,
    dropdownMenuTheme: DropdownMenuThemeData(
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: dropMenuBorder(),
        focusedBorder: dropMenuBorder(),
        border: dropMenuBorder(),

      )
    )


  )
  ;

  static ThemeData darktheme = ThemeData(
    primaryColor: AppColor.black,
    colorScheme: const ColorScheme.dark(secondary: AppColor.white),
    appBarTheme: const AppBarTheme(backgroundColor:  AppColor.black),
    scaffoldBackgroundColor: AppColor.black,
      dropdownMenuTheme: DropdownMenuThemeData(
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: dropMenuBorder(),
            focusedBorder: dropMenuBorder(),
            border: dropMenuBorder(),


          ))
  );

  static OutlineInputBorder dropMenuBorder(){
    return OutlineInputBorder(
        borderSide: BorderSide(color: AppColor.white));
  }
}

